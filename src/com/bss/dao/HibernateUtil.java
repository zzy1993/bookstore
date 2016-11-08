package com.bss.dao;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class HibernateUtil {
	private static SessionFactory sessionFactory = buildSessionFactory();
	private static ServiceRegistry serviceRegistry;
	
	private static SessionFactory buildSessionFactory() {
		try{
		Configuration config = new Configuration().configure();  
	    StandardServiceRegistryBuilder serviceBuilder = new StandardServiceRegistryBuilder();
	    serviceBuilder.applySettings(config.getProperties());
	    
	    serviceRegistry = serviceBuilder.build();
	    SessionFactory sessionFactory = config.buildSessionFactory(serviceRegistry);
	    return sessionFactory;	
		} catch (HibernateException e) {
			System.out.println(e.getMessage());
			System.out.println("error from hibernate utility!");
		}
	    return sessionFactory;
	}
	
	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}

}