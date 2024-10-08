

<%@page import="com.learn.mycart.entities.*"%>
<%@page import="com.learn.mycart.dao.*"%>
<%@page import="java.util.List"%>

<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.learn.mycart.helper.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MyCart:HOME</title>
<style > 	
</style>
<%@include file="components/common_css_js.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp" %>
<main>
	
	   <div class="row mt-3 mx-2  ">
	      	  <!-- first col -->
		 <div class="col-md-2 " id="left_main_top">
											      	      <!-- categories -->
																		 <div class="list-group">
																		  <a href="#" onclick="getproducts(0,this)" class=" c-link list-group-item list-group-item-action  allpro" >  All Products
																		  </a>
																		  <%
																		  
																		    CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
																			List<Category> listofCategories=cdao.getCategories();
																		    for(Category cli:listofCategories){
																		  %>
																		  <a href="#"  onclick="getproducts(<%=cli.getCategoryId()%>,this)" class=" c-link  list-group-item list-group-item-action"><%=cli.getCategoryTitle()  %></a>
																		  <%} %>
																			</div>
																		   </div>
											      	        <!-- second col -->
											      	           <div class="col-md-10 " id="post_division">
											      	              <div class="conainer text-center" id="loader_post">
											      	              <i class=" fa-spin  fa  fa-refresh fa-4x"></i>
											      	              <h3  class="mt-3">Loading....</h3></div>
											      	              <div class="container-fluid"  id="post_division"></div>
											      	      </div>
											      </div>
										
											</main>
										
										
<script >
						function getproducts(catId,temp){
							$('#loader_post').show();
							$('#post_division').hide();
							$(".c-link").removeClass('allpro')
							 $.ajax({
					    			url:"showproducts.jsp",
					    			data:{cid:catId},
					    		  success:function(data,textStatus,jqXHR)
					    		  {
					    			console.log(data);  
					    			$('#loader_post').hide();
					    			$('#post_division').show();
					    			$('#post_division').html(data)
					    			$(temp).addClass('allpro')
					    		  }
					    })
						
						}
						  $(document).ready(function(e){
								let allpostRef=$('.c-link')[0]
							    getproducts(0,allpostRef);
						  })
						</script>
						<%@include file="components/common_modals.jsp" %>
						
</body>
	<%@include file="components/footer.jsp" %>
</html>
