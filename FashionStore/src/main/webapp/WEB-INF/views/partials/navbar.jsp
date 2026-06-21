<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar">

    <div class="nav-container">

        <!-- LOGO -->
        <a href="${pageContext.request.contextPath}/home"
           class="logo">

            <div class="logo-top">

                <span class="kannada-text">
                    ವಸ್ತ್ರ,
                </span>

                <span class="english-text">
                    <span class="highlight-v">V</span>ASTRA
                </span>

            </div>

            <div class="tagline">
                Your Search Ends Here.....
            </div>

        </a>

        <!-- NAVIGATION LINKS -->
        <ul class="nav-links">

            <li>
                <a href="${pageContext.request.contextPath}/home">
                    Home
                </a>
            </li>

            <li>
                <a href="${pageContext.request.contextPath}/products">
                    Products
                </a>
            </li>

            <li>
               <a href="${pageContext.request.contextPath}/home#categories">
    Categories
</a>
            </li>

           <li>

    <a href="${pageContext.request.contextPath}/search">

        Search

    </a>

</li>

        </ul>

        <!-- RIGHT SIDE -->
        <div class="nav-actions">

            <%
                com.fashionstore.model.User currentUser = (com.fashionstore.model.User) session.getAttribute("user");
                if (currentUser != null) {
            %>
                <div class="profile-dropdown">
                    <span class="user-avatar">👤 Profile ▼</span>
                    <div class="profile-menu">
                        <div class="profile-email"><%= currentUser.getEmail() %></div>
                        <a href="${pageContext.request.contextPath}/logout" class="logout-btn">
                            Logout 🚪
                        </a>
                    </div>
                </div>
            <%
                } else {
            %>
                <a href="${pageContext.request.contextPath}/login">
                    Login 👤
                </a>
            <%
                }
            %>

            <a href="#" class="nav-wishlist" id="navbar-wishlist" onclick="goToWishlist(event, '${pageContext.request.contextPath}')">
                Wishlist ❤️ <span class="wishlist-count" id="wishlist-count">0</span>
            </a>

            <a href="${pageContext.request.contextPath}/cart"
               class="nav-cart">

                Cart 🛒

            </a>

        </div>

    </div>

</nav>

<script>
    function goToWishlist(event, contextPath) {
        event.preventDefault();
        let savedWishlist = localStorage.getItem('wishlistItems');
        let items = savedWishlist ? JSON.parse(savedWishlist) : [];
        let ids = items.join(',');
        window.location.href = contextPath + '/wishlist?ids=' + ids;
    }

    document.addEventListener("DOMContentLoaded", function() {
        let savedWishlist = localStorage.getItem('wishlistItems');
        let wishlistCount = 0;
        if (savedWishlist) {
            let items = JSON.parse(savedWishlist);
            wishlistCount = items.length;
        }
        let countSpan = document.getElementById('wishlist-count');
        if (countSpan) {
            countSpan.innerText = wishlistCount;
        }
    });
</script>