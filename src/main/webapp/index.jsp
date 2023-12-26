<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.entities.Product" %>
<%@page import="com.learn.mycart.entities.Category" %>
<%@page import="java.util.List" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index Page : My Cart</title>

<%@include file="components/common_css_js.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp" %>
	
	
    <div class="row mt-3 mx-2">
    
    <%
      ProductDao dao = new ProductDao(FactoryProvider.getFactory());
      List<Product> products = dao.getAllProduct();
      
      CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
      List<Category> categories = cdao.getCategory();
    %>
        <!-- For categories -->
        <div class="col-md-2">
        
        <h1><%=categories.size() %></h1>
        
        <%
            for(Category c:categories)
            {
            	out.println(c.getCategoryTitle()+"<br>");
            }
        %>
        </div>
        
        <!-- For Products -->
        <div class="col-md-8">
          <h1>The number of product available is <%=products.size() %></h1>
          
          <%
             for(Product product:products)
             {
            	 out.println(product.getpPhoto()+"<br>");
            	 out.println(product.getpName()+"<br><br>");
             }
          %>
          
        </div>
    </div>
	
</body>
</html>