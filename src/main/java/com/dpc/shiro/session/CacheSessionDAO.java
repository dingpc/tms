package com.dpc.shiro.session;

import java.io.Serializable;
import java.util.Collection;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.EnterpriseCacheSessionDAO;

/** 
 * @author dingpc
 * @version 2016年4月2日
 */
public class CacheSessionDAO extends EnterpriseCacheSessionDAO implements SessionDAO {
	
	public CacheSessionDAO() {
        super();
    }
	
	@Override
	protected Serializable doCreate(Session session) {
		return super.doCreate(session);
	}

	@Override
	protected void doUpdate(Session session) {
		super.doUpdate(session);
	}

	@Override
	protected void doDelete(Session session) {
		super.doDelete(session);
	}

	@Override
	public Collection<Session> getActiveSessions(boolean includeLeave) {
		return null;
	}

	@Override
	public Collection<Session> getActiveSessions(boolean includeLeave,
			Object principal, Session filterSession) {
		return null;
	}

}
