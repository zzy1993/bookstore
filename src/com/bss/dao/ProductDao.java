package com.bss.dao;

import com.bss.model.Product;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.HibernateException;
import org.hibernate.Query;

import java.util.ArrayList;
import java.util.List;


public class ProductDao {

	public List<Product> getProducts() {
		
		List<Product> products = new ArrayList<Product>();
		
		try {
			Session session = HibernateUtil.getSessionFactory().openSession();
			Transaction tx = session.beginTransaction();
			
			Query q = session.createQuery("select * from Product as p where p.id = 1");
			
			products = q.list();
			
			tx.commit();
			session.close();
			
		} catch (HibernateException e) {
			
		}
		return products;
	}
}
