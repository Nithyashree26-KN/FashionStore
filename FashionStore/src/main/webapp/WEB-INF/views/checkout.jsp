<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>

    <title>Checkout | VASTRA</title>

    <link rel="stylesheet"
    href="${pageContext.request.contextPath}/assets/css/main.css">
    <link rel="stylesheet"
href="${pageContext.request.contextPath}/assets/css/checkout.css">

    <style>

        .checkout-page{

            width: 95%;
            margin: 50px auto;

            display: grid;
            grid-template-columns: 2fr 1fr;

            gap: 40px;
        }

        /* LEFT */

        .checkout-form{

            background: white;

            padding: 40px;

            border-radius: 25px;

            box-shadow:
            0 10px 30px rgba(0,0,0,0.08);
        }

        .checkout-title{

            font-size: 42px;
            margin-bottom: 35px;

            color: #5c0000;
        }

        .checkout-group{

            margin-bottom: 25px;
        }

        .checkout-group label{

            display: block;

            margin-bottom: 10px;

            font-weight: bold;

            color: #333;
        }

        .checkout-group input,
        .checkout-group textarea,
        .checkout-group select{

            width: 100%;

            padding: 16px;

            border-radius: 12px;

            border: 1px solid #ddd;

            font-size: 16px;

            outline: none;
        }

        .checkout-row{

            display: grid;
            grid-template-columns: 1fr 1fr;

            gap: 20px;
        }

        /* RIGHT */

        .order-summary{

            background: white;

            padding: 35px;

            border-radius: 25px;

            height: fit-content;

            box-shadow:
            0 10px 30px rgba(0,0,0,0.08);
        }

        .summary-title{

            font-size: 32px;
            margin-bottom: 30px;

            color: #5c0000;
        }

        .summary-item{

            display: flex;
            justify-content: space-between;

            margin-bottom: 20px;

            font-size: 18px;
        }

        .summary-total{

            border-top: 1px solid #ddd;

            margin-top: 25px;
            padding-top: 25px;

            display: flex;
            justify-content: space-between;

            font-size: 28px;
            font-weight: bold;

            color: #8b0000;
        }

        /* BUTTON */

        .place-order-btn{

            width: 100%;

            margin-top: 35px;

            padding: 18px;

            border: none;

            border-radius: 50px;

            background:
            linear-gradient(
            135deg,
            #7a0000,
            #b00000
            );

            color: white;

            font-size: 18px;
            font-weight: bold;

            cursor: pointer;

            transition: 0.3s;
        }

        .place-order-btn:hover{

            transform: translateY(-3px);

            background:
            linear-gradient(
            135deg,
            #b00000,
            #7a0000
            );
        }

        /* RESPONSIVE */

        @media(max-width:992px){

            .checkout-page{

                grid-template-columns: 1fr;
            }
        }

    </style>

</head>

<body>

<!-- NAVBAR -->

<jsp:include page="/WEB-INF/views/partials/navbar.jsp" />



<!-- CHECKOUT PAGE -->

<section class="checkout-page">

    <!-- LEFT SIDE -->

    <div class="checkout-form">

        <h1 class="checkout-title">
            Checkout
        </h1>

       <form action="${pageContext.request.contextPath}/order-success">

            <div class="checkout-row">

                <div class="checkout-group">

                    <label>
                        First Name
                    </label>

                    <input type="text"
                           placeholder="Enter first name">

                </div>

                <div class="checkout-group">

                    <label>
                        Last Name
                    </label>

                    <input type="text"
                           placeholder="Enter last name">

                </div>

            </div>



            <div class="checkout-group">

                <label>
                    Email Address
                </label>

                <input type="email"
                       placeholder="Enter email">

            </div>



            <div class="checkout-group">

                <label>
                    Phone Number
                </label>

                <input type="text"
                       placeholder="Enter phone number">

            </div>



            <div class="checkout-group">

                <label>
                    Shipping Address
                </label>

                <textarea rows="4"
                placeholder="Enter shipping address"></textarea>

            </div>



            <div class="checkout-row">

                <div class="checkout-group">

                    <label>
                        City
                    </label>

                    <input type="text"
                           placeholder="Enter city">

                </div>

                <div class="checkout-group">

                    <label>
                        Pincode
                    </label>

                    <input type="text"
                           placeholder="Enter pincode">

                </div>

            </div>



            <div class="checkout-group">

                <label>
                    Payment Method
                </label>

                <select>

                    <option>
                        Cash On Delivery
                    </option>

                    <option>
                        UPI
                    </option>

                    <option>
                        Credit / Debit Card
                    </option>

                </select>

            </div>



           <a href="${pageContext.request.contextPath}/order-success"
   class="place-order-btn">

   Place Order

</a>

            </button>

        </form>

    </div>



    <!-- RIGHT SIDE -->

    <div class="order-summary">

        <h2 class="summary-title">
            Order Summary
        </h2>

        <div class="summary-item">

            <span>
                Product Total
            </span>

            <span>
                ₹ 3999
            </span>

        </div>

        <div class="summary-item">

            <span>
                Delivery
            </span>

            <span>
                ₹ 99
            </span>

        </div>

        <div class="summary-item">

            <span>
                Discount
            </span>

            <span>
                - ₹ 500
            </span>

        </div>

        <div class="summary-total">

            <span>
                Total
            </span>

            <span>
                ₹ 3598
            </span>

        </div>

        <button class="place-order-btn">

            Proceed Payment

        </button>

    </div>

</section>



<!-- FOOTER -->

<jsp:include page="/WEB-INF/views/partials/footer.jsp" />

</body>
</html>