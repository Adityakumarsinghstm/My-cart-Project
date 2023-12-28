<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index Page : My Cart</title>

<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>


	<div class="row mt-3 mx-2">

		<%
		ProductDao dao = new ProductDao(FactoryProvider.getFactory());
		List<Product> products = dao.getAllProduct();

		CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
		List<Category> categories = cdao.getCategory();

		Helper helper = new Helper();
		%>
		<!-- For categories -->
		<div class="col-md-2">

			<div class="list-group">
				<a href="#" class="list-group-item list-group-item-action active">
					All Categories </a>

				<%
				for (Category c : categories) {
				%>
				<a href="#" class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>
				<%
				}
				%>


			</div>
		</div>

		<!-- For Products -->
		<div class="col-md-8">
			<div class="row mt-4">
				<div class="col-md-12">

					<div class="card-columns">

						<%
						for (Product p : products) {
						%>

						<div class="card">

							<img class="card-img-top" src="/D:/servlet_workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/MyCart/img/products/<%=p.getpPhoto() %>" alt="Card image cap">

							<div class="card-body">
								<h5 class="card-title"><%=p.getpName()%></h5>

								<p class="card-text">
									<%=helper.get10Words(p.getpDescription())%>
								</p>

								<div class="card-footer">
									<button class="btn bg-primary text-white">Add to Cart</button>
									<button class="btn btn-outline-primary">
										&#8377;
										<%=p.getpPrice()%></button>
								</div>

							</div>
						</div>

						<%
						}
						%>

					</div>
				</div>
			</div>

		</div>
	</div>

</body>
</html>