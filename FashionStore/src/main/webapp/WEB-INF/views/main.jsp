<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fashionstore.model.Category" %>
<%@ page import="com.fashionstore.model.Product" %>
<%@ page import="com.fashionstore.utils.ImageUtil" %>

<!DOCTYPE html>
<html>
<head>
    <title>Vastra</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/main.css">
          
          <link rel="stylesheet"
href="${pageContext.request.contextPath}/assets/css/home-extra.css">
          
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

            <img src="${pageContext.request.contextPath}/assets/images/model2.png"
                 alt="Fashion Model">

        </div>

        <div class="gallery-column">

            <img src="${pageContext.request.contextPath}/assets/images/model3.png"
                 alt="Fashion Model">

            <img src="${pageContext.request.contextPath}/assets/images/model4.png"
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

    
<a href="${pageContext.request.contextPath}/products?category=<%= c.getCategoryId() %>">

    Explore →

</a>

</div>

        <%
                }
            }
        %>

    </div>

</section>




<!-- TRENDING COLLECTIONS -->

<section class="extra-section">

    <h2 class="extra-title">

        Trending Collections

    </h2>

    <div class="extra-grid">

        <div class="extra-card">

            <img src="${pageContext.request.contextPath}/assets/images/banner/trend1.jpg">

            <h3>Summer Fashion</h3>

        </div>

        <div class="extra-card">

            <img src="${pageContext.request.contextPath}/assets/images/banner/trend2.jpg">

            <h3>Street Wear</h3>

        </div>

        <div class="extra-card">

            <img src="${pageContext.request.contextPath}/assets/images/banner/trend3.jpg">

            <h3>Party Collection</h3>

        </div>

    </div>

</section>




<!-- PRODUCTS -->
<!-- PRODUCTS -->
<!-- LATEST PRODUCTS -->

<section class="premium-category-section"
         id="latest-products">

   

    <div class="premium-product-grid">

        <%
            List<Product> products =
            (List<Product>) request.getAttribute("latestProducts");

            if(products != null){

                for(Product p : products){
        %>

        <div class="product-card premium-enhanced-card">

            <!-- PRODUCT IMAGE -->

            <div class="product-image">

                
<img
src="${pageContext.request.contextPath}/<%= ImageUtil.getImageUrl(p) %>"
alt="Product">

                <span class="offer-badge">
                    NEW
                </span>

                <button class="wishlist-btn" data-product-id="<%= p.getProductId() %>" onclick="addToWishlist(event, this)">
                    🤍
                </button>

            </div>

            <!-- PRODUCT INFO -->

            <div class="premium-product-info">

                <p class="product-category">
                    Premium Fashion
                </p>

                <h3>
                    <%= p.getProductName() %>
                </h3>

                <div class="product-rating">

                    ★ ★ ★ ★ ☆

                    <span>(4.5)</span>

                </div>

                <div class="price-section">

                    <span class="premium-price">
                        ₹ <%= p.getPrice() %>
                    </span>

                </div>

                <div class="product-buttons">

                    <a href="${pageContext.request.contextPath}/product-details?id=<%= p.getProductId() %>"
                       class="premium-btn">

                       View Details
                    </a>

                </div>

            </div>

        </div>

        <%
                }
            }
        %>

    </div>

</section>





<section class="why-section">

    <h2 class="extra-title">

        Why Shop With VASTRA?

    </h2>

    <div class="why-grid">

       <div class="why-card">

    <div class="why-icon">
        🚚
    </div>

    <h3>Free Delivery</h3>

    <p>
        Fast and free delivery across India.
    </p>

</div>
        
        

        <div class="why-card">

    <div class="why-icon">
        💎
    </div>

    <h3>Premium Quality</h3>

    <p>
        Best quality fashion products for every style.
    </p>

</div>


        <div class="why-card">

    <div class="why-icon">
        🔒
    </div>

    <h3>Secure Payments</h3>

    <p>
        100% safe and secure payment experience.
    </p>

</div>


        <div class="why-card">

    <div class="why-icon">
        📞
    </div>

    <h3>24/7 Support</h3>

    <p>
        Dedicated support team available anytime.
    </p>

</div>

    </div>

</section>

<section class="review-section">

    <h2 class="extra-title">

        Customer Reviews

    </h2>

    <div class="review-grid">

        <div class="review-card">

            <div class="review-stars">★ ★ ★ ★ ★</div>

            <p>
                Amazing fashion collection and fast delivery!
            </p>

            <h4>- Priya</h4>

        </div>

        <div class="review-card">

            <div class="review-stars">★ ★ ★ ★ ★</div>

            <p>
                Very stylish and affordable products.
            </p>

            <h4>- Rahul</h4>

        </div>

        <div class="review-card">

            <div class="review-stars">★ ★ ★ ★ ★</div>

            <p>
                Excellent shopping experience.
            </p>

            <h4>- Sneha</h4>

        </div>

    </div>

</section>


<section class="fashion-banner">

    <div class="fashion-overlay">

        <h1>Discover Your Style</h1>

        <p>Fashion that matches your personality.</p>

    </div>

</section>
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/partials/footer.jsp" />

<script>
document.addEventListener("DOMContentLoaded", function() {
    let savedWishlist = localStorage.getItem('wishlistItems');
    let items = savedWishlist ? JSON.parse(savedWishlist) : [];
    document.querySelectorAll('.wishlist-btn').forEach(btn => {
        let pid = btn.dataset.productId;
        if (items.includes(pid)) {
            btn.classList.add('active');
            btn.innerHTML = '❤️';
        }
    });
});

function addToWishlist(event, btn) {
    event.preventDefault();
    event.stopPropagation();
    
    let pid = btn.dataset.productId;
    let savedWishlist = localStorage.getItem('wishlistItems');
    let items = savedWishlist ? JSON.parse(savedWishlist) : [];
    
    const isActive = btn.classList.toggle('active');
    btn.innerHTML = isActive ? '❤️' : '🤍';
    
    if (isActive) {
        if (!items.includes(pid)) items.push(pid);
    } else {
        items = items.filter(id => id !== pid);
    }
    localStorage.setItem('wishlistItems', JSON.stringify(items));
    
    const wishlistTarget = document.getElementById('navbar-wishlist');
    if (!wishlistTarget) return;
    
    const countSpan = document.getElementById('wishlist-count');
    if (countSpan) {
        countSpan.innerText = items.length;
    }
    
    if (isActive) {
        const btnRect = btn.getBoundingClientRect();
        const targetRect = wishlistTarget.getBoundingClientRect();
        
        const heart = document.createElement('div');
        heart.className = 'flying-heart';
        heart.innerHTML = '❤️';
        heart.style.left = btnRect.left + 'px';
        heart.style.top = btnRect.top + 'px';
        document.body.appendChild(heart);
        
        setTimeout(() => {
            heart.style.transform = `translate(${targetRect.left - btnRect.left}px, ${targetRect.top - btnRect.top}px) scale(0.6)`;
            heart.style.opacity = '0';
        }, 10);
        
        setTimeout(() => {
            heart.remove();
            wishlistTarget.style.transition = 'transform 0.2s ease';
            wishlistTarget.style.transform = 'scale(1.2)';
            setTimeout(() => {
                wishlistTarget.style.transform = 'scale(1)';
            }, 200);
        }, 800);
    }
}
</script>

</body>
</html>