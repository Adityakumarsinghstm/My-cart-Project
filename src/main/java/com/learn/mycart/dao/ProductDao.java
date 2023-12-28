package com.learn.mycart.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.learn.mycart.entities.Product;

public class ProductDao {
	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		this.factory = factory;
	}

	public boolean saveProduct(Product product) {
		boolean f = false;
		try {
			Session session = this.factory.openSession();
			Transaction txt = session.beginTransaction();

			session.save(product);

			txt.commit();
			session.close();
			f = true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			f = false;
		}
		return f;
	}
	
	//Fetching all product data
	public List<Product> getAllProduct()
	{
		Session s =factory.openSession();
		Query query =  s.createQuery("from Product");
		List<Product> products = query.list();
		return products;
	}
}
