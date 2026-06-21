<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.fashionstore.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fashionstore.model.ProductVariant" %>
<%@ page import="com.fashionstore.utils.ImageUtil" %>

<%
    Product product = (Product) request.getAttribute("product");

    List<ProductVariant> variants =
        (List<ProductVariant>) request.getAttribute("variants");
%>

<!DOCTYPE html>
<html>
<head>

    <title>Product Details</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/main.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/product-details.css?v=3">

</head>

<body>

    <!-- NAVBAR -->
    <jsp:include page="/WEB-INF/views/partials/navbar.jsp" />

    <div class="details-section">
        <div class="container">
            <div class="details-container">

            <!-- IMAGE -->
            <div class="details-image">

               <img src="${pageContext.request.contextPath}/<%= ImageUtil.getImageUrl(product) %>"
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
            if(variants != null && !variants.isEmpty()){

                for(ProductVariant variant : variants){
        %>

            <button class="size-btn" onclick="selectSize(this)">
                <%= variant.getSize() %>
            </button>

        <%
                }
            } else {
        %>
            <button class="size-btn selected" onclick="selectSize(this)">
                Standard Size
            </button>
        <%
            }
        %>

    </div>

</div>
                </p>

                <a href="${pageContext.request.contextPath}/cart?action=add&id=<%= product.getProductId() %>"
                   class="cart-btn">
                    Add To Cart
                </a>

            </div>

        </div>

    </div>
    </div>

    <!-- FOOTER -->
    <jsp:include page="/WEB-INF/views/partials/footer.jsp" />

<script>
function selectSize(clickedBtn) {
    document.querySelectorAll('.size-btn').forEach(btn => {
        btn.classList.remove('selected');
    });
    clickedBtn.classList.add('selected');
}
</script>

</body>
</html>