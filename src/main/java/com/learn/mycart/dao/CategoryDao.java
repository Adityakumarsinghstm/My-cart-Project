package com.learn.mycart.dao;
import com.learn.mycart.entities.Category;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;



public class CategoryDao {
    private SessionFactory factory;

	
    public CategoryDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}


	public int saveCategory(Category cat)
    {
        Session session = this.factory.openSession();
        Transaction txt = session.beginTransaction();
        int catId = (Integer) session.save(cat);
        txt.commit();
        session.close();
        return catId;
    }
	
	public List<Category> getCategory()
	{
		Session session = this.factory.openSession();
		Query query = session.createQuery("from Category");
		List<Category> list = query.list();
		return list;
	}
	public Category getCategoryById(int cid)
	{
		Category cat = null;
		try {
			Session session = this.factory.openSession();
			cat = session.get(Category.class, cid);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return cat;
	}
}
