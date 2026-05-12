<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>

    <title>Order Success</title>

    <link rel="stylesheet"
    href="${pageContext.request.contextPath}/assets/css/checkout.css">

</head>

<body>

<div class="success-page">

    <!-- BACKGROUND GLOW -->

    <div class="success-glow glow1"></div>
    <div class="success-glow glow2"></div>

    <!-- SUCCESS CARD -->

    <div class="success-card">

        <div class="success-icon">

            ✓

        </div>

        <h1>

            Order Placed Successfully!

        </h1>

        <p>

            Thank you for shopping with
            <span>VASTRA</span>

        </p>

        <div class="success-info">

            <h3>
                Order Confirmed
            </h3>

            <p>
                Your premium fashion collection
                is being prepared.
            </p>

            <p>
                Estimated Delivery:
                <strong>3-5 Days</strong>
            </p>

        </div>

        <div class="success-buttons">

            <a href="${pageContext.request.contextPath}/home">

                Continue Shopping

            </a>

            <a href="${pageContext.request.contextPath}/products">

                Explore Products

            </a>

        </div>

    </div>

</div>

</body>
</html>