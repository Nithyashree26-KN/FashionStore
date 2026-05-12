<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.fashionstore.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fashionstore.model.ProductVariant" %>

<%
    Product product = (Product) request.getAttribute("product");

List<ProductVariant> variants =
    (List<ProductVariant>) request.getAttribute("variants");
%>
%>

<!DOCTYPE html>
<html>
<head>

    <title>Product Details</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/main.css">

</head>

<body>

    <!-- NAVBAR -->
    <jsp:include page="/WEB-INF/views/partials/navbar.jsp" />

    <div class="container">

        <div class="details-container">

            <!-- IMAGE -->
            <div class="details-image">

               <img src="${pageContext.request.contextPath}/<%= product.getImageUrl() %>"
     alt="Product Image">

            </div>

            <!-- INFO -->
            <div class="details-info">

                <h1><%= product.getProductName() %></h1>

                <h2>₹ <%= product.getPrice() %></h2>

                <p>
                    <%= product.getDescription() %>
                    <div class="sizes">

    <h3>Available Sizes</h3>

    <div class="size-buttons">

        <%
            if(variants != null){

                for(ProductVariant variant : variants){
        %>

            <button class="size-btn">
                <%= variant.getSize() %>
            </button>

        <%
                }
            }
        %>

    </div>

</div>
                </p>

                <a href="${pageContext.request.contextPath}/cart?action=add&id=<%= product.getProductId() %>"
   class="btn">
    Add To Cart
</a>

            </div>

        </div>

    </div>

    <!-- FOOTER -->
    <jsp:include page="/WEB-INF/views/partials/footer.jsp" />

</body>
</html>