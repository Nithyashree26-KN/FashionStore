<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>

    <title>Login | VASTRA</title>

    <link rel="stylesheet"
    href="${pageContext.request.contextPath}/assets/css/main.css">

    <link rel="stylesheet"
    href="${pageContext.request.contextPath}/assets/css/login.css">

</head>

<body>

<!-- NAVBAR -->

<jsp:include page="/WEB-INF/views/partials/navbar.jsp" />



<!-- LOGIN SECTION -->

<section class="login-page">

    <!-- LEFT SIDE -->

    <div class="login-banner">

        <div class="overlay"></div>

        <div class="banner-content">

            <h1>
                Welcome Back
            </h1>

            <p>
                Discover premium fashion collections
                only at VASTRA.
            </p>

        </div>

    </div>



    <!-- RIGHT SIDE -->

    <div class="login-container">

        <div class="login-box">

            <h2>
                Login
            </h2>

            <p class="login-subtitle">
                Sign in to continue shopping
            </p>



            <!-- ERROR MESSAGE -->

            <%

                String error =
                (String) request.getAttribute("error");

                if(error != null){

            %>

            <p class="error-message">
                <%= error %>
            </p>

            <%

                }

            %>



            <!-- LOGIN FORM -->

            <form
            action="${pageContext.request.contextPath}/login"
            method="post">

                <div class="input-box">

                    <label>
                        Email Address
                    </label>

                    <input type="email"
                           name="email"
                           placeholder="Enter your email"
                           required>

                </div>



                <div class="input-box">

                    <label>
                        Password
                    </label>

                    <input type="password"
                           name="password"
                           placeholder="Enter password"
                           required>

                </div>



                <button type="submit"
                        class="login-btn">

                    Login

                </button>

            </form>

        </div>

    </div>

</section>

</body>
</html>