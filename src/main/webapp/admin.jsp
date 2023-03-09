<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.User"%>
<%
User user = (User) session.getAttribute("current-user");
if (user == null) {
	session.setAttribute("message", "you are not logged in!!");
	response.sendRedirect("login.jsp");
	return;
} else {
	if (user.getUserType().equals("normal")) {
		session.setAttribute("message", "This is admin page don't access it!!");
		response.sendRedirect("login.jsp");
		return;
	}
}
%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin pannel: mycart</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container admin">

		<div class="container-fluid mt-3"><%@include
				file="components/message.jsp"%></div>


		<!-- This is first row -->
		<div class="row mt-3">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px" class="img-fluid rounded-circle"
								alt="user_icon" src="img/man.png">
						</div>
						<h1>7475</h1>
						<h1 class="text-uppercase text-muted">Users</h1>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px" class="img-fluid rounded-circle"
								alt="categories_icon" src="img/list.png">
						</div>
						<h1>57387</h1>
						<h1 class="text-uppercase text-muted">Categories</h1>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">

							<img style="max-width: 125px" class="img-fluid rounded-circle"
								alt="product_icon" src="img/delivery-box.png">
						</div>
						<h1>8945</h1>
						<h1 class="text-uppercase text-muted">Products</h1>
					</div>
				</div>
			</div>
		</div>

		<!-- This is second row -->
		<div class="row mt-3">
			<div class="col-md-6">
				<div class="card" data-toggle="modal"
					data-target="#add-categroy-modal">
					<div class="card-body text-center">
						<div class="container">

							<img style="max-width: 125px" class="img-fluid rounded-circle"
								alt="product_icon" src="img/calculator.png">
						</div>
						<p class="mt-2">Click here to add categories</p>
						<h1 class="text-uppercase text-muted">Add Categories</h1>
					</div>
				</div>

			</div>
			<div class="col-md-6">
				<div class="card" data-toggle="modal"
					data-target="#add-product-modal">
					<div class="card-body text-center">
						<div class="container">

							<img style="max-width: 125px" class="img-fluid rounded-circle"
								alt="product_icon" src="img/plus.png">
						</div>
						<p class="mt-2">Click here to add Products</p>
						<h1 class="text-uppercase text-muted">Add Products</h1>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- start add category modal -->

	<!-- Modal -->
	<div class="modal fade" id="add-categroy-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header bg-custom text-white">
					<h5 class="modal-title" id="exampleModalLabel">Add category
						details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="productOperationServlet" method="post">
						<input type="hidden" name="operation" value="addcategory" />
						<div class="form-group">
							<input class="form-control" placeholder="enter category title"
								type="text" name="catTitle" required>
						</div>
						<div class="form-group">
							<textarea style="height: 250px" class="form-control"
								name="catDescription"
								placeholder="enter the category description"></textarea>
						</div>
						<div class="container text-center">
							<button class="btn btn-outline-success">Add Category</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
	<!-- end add category modal -->


	<!-- Start add product modal -->

	<!-- Button trigger modal -->


	<!-- Modal -->
	<!-- Button trigger modal -->


	<!-- Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header bg-custom text-white">
					<h5 class="modal-title" id="exampleModalLabel">Add Product</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="productOperationServlet" method="post" enctype="multipart/form-data">
						<input type="hidden" name="operation" value="addproduct"/>
						<div class="form-group">
							<input class="form-control" type="text"
								placeholder="Enter the title of product" name="pTitle" />
						</div>
						<div class="form-group">
							<textarea style="height: 150px" class="form-control"
								placeholder="Enter the description of product" type="text"
								name="pDesc"></textarea>
						</div>
						<div class="form-group">
							<input class="form-control" type="number"
								placeholder="Enter the price of product" name="pPrice" />
						</div>
						<div class="form-group">
							<input class="form-control" type="number"
								placeholder="Enter the discount of product" name="pDisc" />
						</div>
						<div class="form-group">
							<input class="form-control" type="number"
								placeholder="Enter the quantity of product" name="pQuant" />
						</div>
						
						<%
						  CategoryDao dao = new CategoryDao(FactoryProvider.getFactory());
						  List<Category> list = dao.getCategory();
						  
						%>
						
						<div class="form-group">
							<select class="form-control" name="catId" id="">
							<%for(Category c:list)
								{
								%>
								<option><%=c.getCategoryTitle() %></option>
								
								<%} %>
							</select>
						</div>
						<div class="form-group">
							<label for="pPic">Upload photo of Product</label> <input
								class="form-control" type="file" id="pPic" name="pPic" />
						</div>
						<div class="container text-center">
							<button class="btn btn-outline-success">Add Product</button>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>


	<!-- End add product modal -->
</body>
</html>