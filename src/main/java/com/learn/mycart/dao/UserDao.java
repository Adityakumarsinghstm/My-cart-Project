package com.learn.mycart.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.learn.mycart.entities.User;


public class UserDao {
	private SessionFactory factory;

	public UserDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	 
	public User getUserByEmailAndPassword(String email, String password)
	{
        User user = null;
		try {
			String query = "from User where userEmail =: u and userPassword =: p";
			Session session = this.factory.openSession();
			Query q = session.createQuery(query);
			q.setParameter("u", email);
			q.setParameter("p", password);
			
			user =(User)q.uniqueResult();
			
			session.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return user;
	}

}
