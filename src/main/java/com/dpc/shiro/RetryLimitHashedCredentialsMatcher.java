package com.dpc.shiro;

import java.util.concurrent.atomic.AtomicInteger;

import org.apache.log4j.Logger;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.util.ByteSource;

/** 
 * @author dingpc
 * @version 2016年3月30日
 */
public class RetryLimitHashedCredentialsMatcher extends HashedCredentialsMatcher {
	private static Logger log = Logger.getLogger(RetryLimitHashedCredentialsMatcher.class);
	private Cache<String, AtomicInteger> passwordRetryCache;

	public RetryLimitHashedCredentialsMatcher(CacheManager cacheManager) {
		passwordRetryCache = cacheManager.getCache("passwordRetryCache");
	}

	@Override
	public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {
		log.debug("doCredentialsMatch()");
		String userName = (String) token.getPrincipal();
		log.debug("doCredentialsMatch() userName:" + userName);
		log.debug("doCredentialsMatch() password:" + new String((char[]) token.getCredentials()));
		AtomicInteger retryCount = passwordRetryCache.get(userName);
		if (retryCount == null) {
			retryCount = new AtomicInteger(0);
			passwordRetryCache.put(userName, retryCount);
		}
		if (retryCount.incrementAndGet() > 5) {
			throw new ExcessiveAttemptsException();
		}
		
		boolean matches = super.doCredentialsMatch(token, info);
		
		if (matches) {
			passwordRetryCache.remove(userName);
		}
		return matches;
	}
	
	public String buildCredentials(String userName, String password, String credentialsSalt) {
		log.debug("buildCredentials()");
		log.debug("buildCredentials() userName:" + userName + "----password:" + password);
		SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(userName, password, ByteSource.Util.bytes(userName + credentialsSalt), userName);
		AuthenticationToken token = new UsernamePasswordToken(userName, password);
		return super.hashProvidedCredentials(token, authenticationInfo).toString();
	}
}
