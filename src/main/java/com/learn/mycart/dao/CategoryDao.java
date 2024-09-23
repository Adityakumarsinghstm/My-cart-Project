package com.learn.mycart.dao;
import com.learn.mycart.entities.Category;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;



public class CategoryDao {
	private SessionFactory factory;

	 public CategoryDao(SessionFactory  factory) {
	 	super();
	 	this.factory = factory;
	 }
	 public int saveCategory(Category cat)
	 {

			Session session=this.factory.openSession();
			org.hibernate.Transaction tx=session.beginTransaction();
	      int  catid=(Integer)session.save(cat);
				tx.commit();
	    	 session.close();
	   	 return catid;
	 }
	 public List<Category> getCategories(){
	Session session=	 this.factory.openSession();
	Query<Category> li=	 session.createQuery("from Category");
	  List<Category> list=   li.list();
	  return list;
	 }
	 public Category getcatByid(int cid) {
		 Category c=null;
		 try {
		Session s=	this.factory.openSession();
	     c=s.get(Category.class,cid);
	     s.close();
	     } catch (Exception e) {
			e.printStackTrace();
		}
		 return c;
	 }
}
