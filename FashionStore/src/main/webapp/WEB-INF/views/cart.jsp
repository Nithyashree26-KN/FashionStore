<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="com.fashionstore.model.CartItem" %>
<%@ page import="com.fashionstore.model.Product" %>
<%@ page import="com.fashionstore.utils.ImageUtil" %>

<!DOCTYPE html>
<html>

<head>

    <title>Cart - FashionStore</title>

    <!-- MAIN CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/main.css">

    <!-- CART CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/cart.css">

</head>

<body>

<!-- NAVBAR -->
<jsp:include page="/WEB-INF/views/partials/navbar.jsp" />

<div class="cart-page">

    <!-- PAGE TITLE -->

    <h1 class="cart-main-title">
        Shopping Cart
    </h1>

    <div class="cart-layout">

        <!-- LEFT SIDE -->

        <div class="cart-left-section">

            <%

                List<CartItem> cartItems =
                        (List<CartItem>) request.getAttribute("cartItems");

                double total = 0;

                if(cartItems != null && !cartItems.isEmpty()){

                    for(CartItem item : cartItems){

                        Product p = item.getProduct();

                        total += item.getTotalPrice();

            %>

            <!-- SINGLE PRODUCT CARD -->

            <div class="premium-cart-card">

                <!-- PRODUCT IMAGE -->

                <div class="premium-cart-image">

                    <img src="${pageContext.request.contextPath}/<%= ImageUtil.getImageUrl(p) %>"
     alt="Product Image">

                </div>

                <!-- PRODUCT DETAILS -->

                <div class="premium-cart-details">

                    <h2>
                        <%= p.getProductName() %>
                    </h2>

                    <p class="premium-price">
                        ₹ <%= p.getPrice() %>
                    </p>

                    <!-- QUANTITY -->

                    <div class="premium-qty-box">

                        <a href="${pageContext.request.contextPath}/cart?action=decrease&id=<%= p.getProductId() %>"
                           class="premium-qty-btn">

                            -

                        </a>

                        <span class="premium-qty-number">

                            <%= item.getQuantity() %>

                        </span>

                        <a href="${pageContext.request.contextPath}/cart?action=increase&id=<%= p.getProductId() %>"
                           class="premium-qty-btn">

                            +

                        </a>

                    </div>

                    <!-- TOTAL -->

                    <p class="premium-total">

                        Total:
                        ₹ <%= item.getTotalPrice() %>

                    </p>

                    <!-- REMOVE -->

                    <a href="${pageContext.request.contextPath}/remove-cart?id=<%= p.getProductId() %>"
                       class="premium-remove-btn">

                        Remove Item

                    </a>

                </div>

            </div>

            <%

                    }

                }else{

            %>

            <!-- EMPTY CART -->

            <div class="empty-cart-box">

                <h2>
                    Your cart is empty
                </h2>

                <p>
                    Add premium fashion products to your cart.
                </p>

            </div>

            <%

                }

            %>

        </div>

        <!-- RIGHT SIDE -->

        <div class="premium-cart-summary">

            <h2 class="summary-heading">

                Order Summary

            </h2>

            <div class="summary-row">

                <span>Subtotal</span>

                <span>₹ <%= total %></span>

            </div>

            <div class="summary-row">

                <span>Shipping</span>

                <span>FREE</span>

            </div>

            <div class="summary-total">

                <span>Total</span>

                <span>₹ <%= total %></span>

            </div>

            <!-- CHECKOUT BUTTON -->

            <a href="${pageContext.request.contextPath}/checkout"
               class="premium-checkout-btn">

                Proceed To Checkout

            </a>

        </div>

    </div>

</div>

<!-- FOOTER -->

<jsp:include page="/WEB-INF/views/partials/footer.jsp" />

</body>

</html>