<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fashionstore.model.Product" %>

<!DOCTYPE html>
<html>
<head>
    <title>Products - FashionStore</title>

    <link rel="stylesheet"
    href="${pageContext.request.contextPath}/assets/css/main.css">
</head>

<body>

<jsp:include page="/WEB-INF/views/partials/navbar.jsp" />

<div class="container">

    <h1 class="section-title">All Products</h1>

    <div class="product-grid">

        <%
            List<Product> products =
            (List<Product>) request.getAttribute("products");

            for(Product p : products){
        %>

        <div class="product-card">

            <div class="product-image">
            
            
             <img src="${pageContext.request.contextPath}/<%= p.getImageUrl() %>"
     alt="Product Image">
            </div>

            <div class="product-info">

                <h3><%= p.getProductName() %></h3>

                <div class="price">
                    ₹ <%= p.getPrice() %>
                </div>

                <a href="${pageContext.request.contextPath}/product-details?id=<%= p.getProductId() %>"
   class="btn">

    View Details

</a>

            </div>

        </div>

        <%
            }
        %>

    </div>

</div>

<jsp:include page="/WEB-INF/views/partials/footer.jsp" />

</body>
</html>