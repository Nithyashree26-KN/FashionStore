<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="com.fashionstore.model.CartItem" %>
<%@ page import="com.fashionstore.model.Product" %>

<!DOCTYPE html>
<html>

<head>

    <title>Cart - FashionStore</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/main.css">

</head>

<body>

<jsp:include page="/WEB-INF/views/partials/navbar.jsp" />

<div class="container">

    <h1 class="section-title">
        Shopping Cart
    </h1>

    <div class="cart-container">

        <%

            List<CartItem> cartItems =
                    (List<CartItem>) request.getAttribute("cartItems");

            double total = 0;

            if(cartItems != null && !cartItems.isEmpty()){

                for(CartItem item : cartItems){

                    Product p = item.getProduct();

                    total += item.getTotalPrice();

        %>

        <div class="cart-item">

            <div class="cart-image">

                <img src="${pageContext.request.contextPath}/assets/images/<%= p.getImageUrl() %>">

            </div>

            <div class="cart-info">

                <h2>
                    <%= p.getProductName() %>
                </h2>

                <p>
                    ₹ <%= p.getPrice() %>
                </p>

                <div class="qty-box">

    <a href="${pageContext.request.contextPath}/cart?action=decrease&id=<%= p.getProductId() %>"
       class="qty-btn">
        -
    </a>

    <span class="qty-number">
        <%= item.getQuantity() %>
    </span>

    <a href="${pageContext.request.contextPath}/cart?action=increase&id=<%= p.getProductId() %>"
       class="qty-btn">
        +
    </a>

</div>

                <p>
                    Total:
                    ₹ <%= item.getTotalPrice() %>
                </p>

                <a href="${pageContext.request.contextPath}/remove-cart?id=<%= p.getProductId() %>"
                   class="remove-btn">

                    Remove

                </a>

            </div>

        </div>

        <%

                }

            }else{

        %>

        <h2>Your cart is empty</h2>

        <%

            }

        %>

    </div>

    <div class="cart-total">
    <a href="${pageContext.request.contextPath}/checkout"
   class="checkout-btn">

   Proceed To Checkout

</a>

        <h2>
            Total: ₹ <%= total %>
        </h2>

    </div>

</div>

<jsp:include page="/WEB-INF/views/partials/footer.jsp" />

</body>

</html>