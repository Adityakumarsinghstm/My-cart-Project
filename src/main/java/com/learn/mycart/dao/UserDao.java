package com.learn.mycart.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
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
	 public boolean UpdateUserDetails(User user) {
		   boolean f=false;
		   try {
			   Session session=   this.factory.openSession(); 
		      String query="update User set userName=:a, userEmail=:b,userPassword=:c,userPhone=:d,userAddress=:e  where userID=:x";
		      Query query2 = session.createQuery(query);
		      query2.setParameter("a",user.getUserName());
		      query2.setParameter("b",user.getUserEmail());
		      query2.setParameter("c", user.getUserPassword());
		      query2.setParameter("d",user.getUserPhone());
		      query2.setParameter("e",user.getUserAddress());
		      query2.setParameter("x",user.getUserID());
		      Transaction tx=session.beginTransaction();
		      query2.executeUpdate();
		      tx.commit();
		      session.close();
		      f=true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		   return f;
	   }

}
