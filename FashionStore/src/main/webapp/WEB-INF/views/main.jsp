<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fashionstore.model.Category" %>
<%@ page import="com.fashionstore.model.Product" %>

<!DOCTYPE html>
<html>
<head>
    <title>Vastra</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/main.css">
          
          <link rel="stylesheet"
href="${pageContext.request.contextPath}/assets/css/home.css">
</head>

<body>

<!-- NAVBAR -->
<jsp:include page="/WEB-INF/views/partials/navbar.jsp" />

<!-- HERO -->
<!-- PREMIUM HERO SECTION -->

<section class="premium-hero">

    <div class="hero-left-content">

        <span class="hero-tag">
            NEW COLLECTION 2026
        </span>

        <h1>
            Wear Style <br>
            With Confidence
        </h1>

        <p>
            Discover trendy collections for Men, Women and Kids.
            Fashion that matches your personality only at VASTRA.
        </p>

        <div class="hero-buttons">

            <a href="${pageContext.request.contextPath}/products"
               class="hero-btn primary-btn">

               Shop Collection
            </a>

            <a href="#categories"
               class="hero-btn secondary-btn">

               Explore More
            </a>

        </div>

    </div>

    <div class="hero-right-gallery">

        <div class="gallery-column">

            <img src="${pageContext.request.contextPath}/assets/images/model1.png"
                 alt="Fashion Model">

            <img src="${pageContext.request.contextPath}/assets/images/model4.png"
                 alt="Fashion Model">

        </div>

        <div class="gallery-column center-column">

            <img src="${pageContext.request.contextPath}/assets/images/model2.png"
                 alt="Fashion Model">

        </div>

        <div class="gallery-column">

            <img src="${pageContext.request.contextPath}/assets/images/model3.png"
                 alt="Fashion Model">

        </div>

    </div>

</section>

<!-- CATEGORIES -->
<!-- CATEGORY SECTION -->

<section class="premium-category-section"
         id="categories">

    <h2 class="premium-title">
        Shop by Category
    </h2>

    <div class="premium-category-grid">

        <%
            List<Category> categories =
            (List<Category>) request.getAttribute("categories");

            if(categories != null){

                for(Category c : categories){
        %>

        <div class="premium-category-card">

    <div class="category-image">

        <img
        src="${pageContext.request.contextPath}/assets/images/categories/<%= c.getCategoryName().toLowerCase() %>.jpg"
        alt="Category Image">

    </div>

    <h3>
        <%= c.getCategoryName() %>
    </h3>

    <p>
        <%= c.getDescription() %>
    </p>

    <a href="#">
        Explore →
    </a>

</div>

        <%
                }
            }
        %>

    </div>

</section>

<!-- PRODUCTS -->
<!-- LATEST PRODUCTS -->

<section class="premium-category-section"
         id="categories">

    <h2 class="premium-title">
        Latest Products
    </h2>

    <div class="premium-product-grid">

        <%
            List<Product> products =
            (List<Product>) request.getAttribute("latestProducts");

            if(products != null){

                for(Product p : products){
        %>

      <div class="product-card premium-enhanced-card">
    <!-- PRODUCT IMAGE -->

    <div class="product-image premium-image-box">
    
    <span class="offer-badge">
    NEW
</span>

<div class="wishlist-icon">
    ❤
</div>
        <!-- OFFER BADGE -->
        <span class="offer-badge">
            NEW
        </span>

        <!-- WISHLIST -->
        <div class="wishlist-icon">
            ❤
        </div>

        <img
        src="${pageContext.request.contextPath}/assets/images/model1.png"
        alt="Product">

    </div>



    <!-- PRODUCT INFO -->

    <div class="premium-product-info">

        <!-- CATEGORY -->
        <p class="product-category">
            Premium Fashion
        </p>

        <!-- PRODUCT NAME -->
        <h3>
            <%= p.getProductName() %>
        </h3>

        <!-- RATING -->
        <div class="product-rating">

            ⭐ ⭐ ⭐ ⭐ ☆

            <span>(4.5)</span>

        </div>

        <!-- PRICE -->
        <div class="price-section">

            <span class="premium-price">
                ₹ <%= p.getPrice() %>
            </span>

            <span class="old-price">
                ₹ 2999
            </span>

        </div>

        <!-- BUTTONS -->

        <div class="product-buttons">

            <a href="#"
               class="premium-btn">

               View Details
            </a>

            <a href="#"
               class="cart-btn-home">

               🛒
            </a>

        </div>

    </div>

</div>

            <div class="premium-product-image">

                <img
                src="${pageContext.request.contextPath}/assets/images/model1.png"
                alt="Product">

            </div>

            <div class="premium-product-info">

                <h3>
                    <%= p.getProductName() %>
                </h3>

                <p class="premium-price">
                    ₹ <%= p.getPrice() %>
                </p>

                <a href="#" class="premium-btn">
                    View Details
                </a>

            </div>

        </div>

        <%
                }
            }
        %>

    </div>

</section>
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/partials/footer.jsp" />

</body>
</html>