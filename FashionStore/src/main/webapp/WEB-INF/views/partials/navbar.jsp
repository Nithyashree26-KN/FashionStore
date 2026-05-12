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
                <a href="#">
                    Contact
                </a>
            </li>

        </ul>

        <!-- RIGHT SIDE -->
        <div class="nav-actions">

            <a href="${pageContext.request.contextPath}/login">
                Login
            </a>

            <a href="${pageContext.request.contextPath}/cart"
               class="nav-cart">

                Cart 🛒

            </a>

        </div>

    </div>

</nav>