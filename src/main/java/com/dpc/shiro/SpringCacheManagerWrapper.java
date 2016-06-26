package com.dpc.shiro;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import net.sf.ehcache.Ehcache;

import org.apache.log4j.Logger;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.util.CollectionUtils;
import org.springframework.cache.support.SimpleValueWrapper;

/** 
 * @author dingpc
 * @version 2016年3月28日
 */
public class SpringCacheManagerWrapper implements CacheManager {
	private static Logger log = Logger.getLogger(SpringCacheManagerWrapper.class);
	private org.springframework.cache.CacheManager cacheManager;

	public void setCacheManager(org.springframework.cache.CacheManager cacheManager) {
        this.cacheManager = cacheManager;
    }
	
	@SuppressWarnings("unchecked")
	@Override
	public <K, V> Cache<K, V> getCache(String name) throws CacheException {
		log.debug("getCache name:" + name);
		org.springframework.cache.Cache springCache = cacheManager.getCache(name);
		return new SpringCacheWrapper(springCache);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	static class SpringCacheWrapper implements Cache {
		
		private org.springframework.cache.Cache springCache;
		
		
		public SpringCacheWrapper(org.springframework.cache.Cache springCache) {
			this.springCache = springCache;
		}

		@Override
		public void clear() throws CacheException {
			log.debug("getCache() name:");
			springCache.clear();
		}

		@Override
		public Object get(Object key) throws CacheException {
			log.debug("get() key:" + key);
			Object value = springCache.get(key);
			if (value instanceof SimpleValueWrapper) {
				return ((SimpleValueWrapper) value).get();
			}
			return value;
		}

		@Override
		public Set keys() {
			log.debug("keys()");
			if (springCache.getNativeCache() instanceof Ehcache) {
				Ehcache ehcache = (Ehcache)springCache.getNativeCache();
				return new HashSet(ehcache.getKeys());
			}
			throw new UnsupportedOperationException("invoke spring cache abstract keys method not supported");
		}

		@Override
		public Object put(Object key, Object value) throws CacheException {
			log.debug("put() key:" + key + "----value:" + value);
			springCache.put(key, value);
			return null;
		}

		@Override
		public Object remove(Object key) throws CacheException {
			log.debug("remove() key:" + key);
			springCache.evict(key);
			return null;
		}

		@Override
		public int size() {
			log.debug("size()");
			if (springCache.getNativeCache() instanceof Ehcache) {
				Ehcache ehcache = (Ehcache) springCache.getNativeCache();
				return ehcache.getSize();
			}
			throw new UnsupportedOperationException("invoke spring cache abstract size method not supported");
		}

		@Override
		public Collection values() {
			log.debug("values()");
			if (springCache.getNativeCache() instanceof Ehcache) {
				Ehcache ehcache = (Ehcache) springCache.getNativeCache();
				List keys = ehcache.getKeys();
				if (CollectionUtils.isEmpty(keys)) {
					List values = new ArrayList(keys.size());
					for(Object key : keys) {
						Object value = get(key);
						if (value != null) {
							values.add(value);
						}
					}
					return Collections.unmodifiableList(values);
				} else {
					return Collections.emptyList();
				}
			}
			throw new UnsupportedOperationException("invoke spring cache abstract values method not supported");
		}
	}
}
