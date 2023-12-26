package com.learn.mycart.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.learn.mycart.dao.CategoryDao;
import com.learn.mycart.dao.ProductDao;
import com.learn.mycart.entities.Category;
import com.learn.mycart.entities.Product;
import com.learn.mycart.helper.FactoryProvider;

/**
 * Servlet implementation class productOperationServlet
 */
@MultipartConfig
public class productOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public productOperationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		String op = request.getParameter("operation");

		if (op.trim().equals("addcategory")) {
			String catTitle = request.getParameter("catTitle");
			String catDescription = request.getParameter("catDescription");

			Category category = new Category();
			category.setCategoryTitle(catTitle);
			category.setCategoryDescription(catDescription);

			CategoryDao catDao = new CategoryDao(FactoryProvider.getFactory());
			int catId = catDao.saveCategory(category);

			HttpSession httpsession = request.getSession();
			httpsession.setAttribute("message", "Category Added Successfully " + catId);
			response.sendRedirect("admin.jsp");
			return;
		} else if (op.trim().equals("addproduct")) {
			String pName = request.getParameter("pTitle");
			String pDesc = request.getParameter("pDesc");
			int pPrice = Integer.parseInt(request.getParameter("pPrice"));
			int pDisc = Integer.parseInt(request.getParameter("pDisc"));
			int pQuant = Integer.parseInt(request.getParameter("pQuant"));
			int catId = Integer.parseInt(request.getParameter("catId"));
			Part part = request.getPart("pPic");

			Product product = new Product();
			product.setpName(pName);
			product.setpDescription(pDesc);
			product.setpPrice(pPrice);
			product.setpDiscount(pDisc);
			product.setpQuantity(pQuant);
			product.setpPhoto(part.getSubmittedFileName());

//		  Getting Category by Id

			CategoryDao catDao = new CategoryDao(FactoryProvider.getFactory());
			Category category = catDao.getCategoryById(catId);

			product.setCategory(category);

//			Saving Product
			ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
			pDao.saveProduct(product);
			//out.println("product save successfully.....");
			
			
			
			//find out the path to upload the image
			String path = request.getRealPath("img")+ File.separator +"products"+ File.separator+part.getSubmittedFileName();
			System.out.println(path);
			
			try {
				
			
			//image uploading code
			FileOutputStream fos = new FileOutputStream(path);
			InputStream is = part.getInputStream();
		
			//Reading data
			byte [] data = new byte[is.available()];
			is.read(data);
			
			//writing the data
			fos.write(data);
			fos.close();
			
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("message", "Product Added Successfully");
			response.sendRedirect("admin.jsp");
			return;
			

		}

	}

}
