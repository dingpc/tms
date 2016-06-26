package com.dpc.shiro;

import java.io.Serializable;
import java.util.Deque;
import java.util.LinkedList;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.log4j.Logger;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.DefaultSessionKey;
import org.apache.shiro.session.mgt.SessionManager;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.util.WebUtils;

/** 
 * @author dingpc
 * @version 2016年3月28日
 */
public class KickoutSessionControlFilter extends AccessControlFilter {

	private static Logger log = Logger.getLogger(KickoutSessionControlFilter.class);
	
	private String kickoutUrl;
	private boolean kickoutAfter;
	private int maxSession = 1;
	private SessionManager sessionManager;
	private Cache<String, Deque<Serializable>> cache;
	
	public void setKickoutUrl(String kickoutUrl) {
		this.kickoutUrl = kickoutUrl;
	}

	public void setKickoutAfter(boolean kickoutAfter) {
		this.kickoutAfter = kickoutAfter;
	}

	public void setMaxSession(int maxSession) {
		this.maxSession = maxSession;
	}

	public void setSessionManager(SessionManager sessionManager) {
		this.sessionManager = sessionManager;
	}

	public void setCacheManager(CacheManager cacheManager) {
		this.cache = cacheManager.getCache("shiro-kickout-session");
	}

	@Override
	protected boolean isAccessAllowed(ServletRequest arg0, ServletResponse arg1, Object arg2) throws Exception {
		return false;
	}

	@Override
	protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
		log.debug("onAccessDenied()");
		Subject subject = getSubject(request, response);
		if (subject.isAuthenticated() || subject.isRemembered()) {
			return true;
		}
		Session session = subject.getSession();
		String userName = (String)subject.getPrincipal();
		Serializable sessionId = session.getId();
		log.debug("onAccessDenied userName:" + userName);
		Deque<Serializable> deque = this.cache.get(userName);
		if (deque == null) {
			deque = new LinkedList<Serializable>();
			this.cache.put(userName, deque);
		}
		
		if (!deque.contains(sessionId) && session.getAttribute("kickout") == null) {
			deque.push(sessionId);
		}
		
		while (deque.size() > maxSession) {
			Serializable kickoutSessionId = null;
			if(kickoutAfter) {
				kickoutSessionId = deque.removeFirst();
			} else {
				kickoutSessionId = deque.removeLast();
			}
			Session kickoutSession = sessionManager.getSession(new DefaultSessionKey(kickoutSessionId));
			if (kickoutSession != null) {
				kickoutSession.setAttribute("kickout", true);
			}
		}
		if (session.getAttribute("kickout") != null) {
			subject.logout();
			saveRequest(request);
			WebUtils.issueRedirect(request, response, kickoutUrl);
			return false;
		}
		return true;
	}

}
