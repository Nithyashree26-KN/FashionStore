<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>

    <title>Search - VASTRA</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/main.css">

    <style>

        body{

            background: #f5f3f0;

            font-family: Arial, sans-serif;
        }

        .search-page{

            width: 90%;

            margin: 80px auto;

            text-align: center;
        }

        .search-title{

            font-size: 60px;

            color: #7a0000;

            margin-bottom: 40px;
        }

        .search-box{

            width: 60%;

            margin: auto;

            display: flex;

            background: white;

            border-radius: 20px;

            overflow: hidden;

            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }

        .search-box input{

            flex: 1;

            padding: 20px;

            border: none;

            font-size: 20px;

            outline: none;
        }

        .search-btn{

            background: #7a0000;

            color: white;

            border: none;

            padding: 20px 40px;

            font-size: 20px;

            cursor: pointer;
        }

        .search-image{

            margin-top: 50px;
        }

        .search-image img{

            width: 400px;

            border-radius: 25px;

            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        }

    </style>

</head>

<body>

<jsp:include page="/WEB-INF/views/partials/navbar.jsp" />

<div class="search-page">

    <h1 class="search-title">

        Search Fashion Products

    </h1>

    <form class="search-box"
          action="${pageContext.request.contextPath}/products">

        <input type="text"
               name="keyword"
               placeholder="Search shirts, dresses, jeans...">

        <button class="search-btn">

            Search

        </button>

    </form>

    <div class="search-image">

        <img src="${pageContext.request.contextPath}/assets/images/banner/fashion-search.jpg">

    </div>

</div>

<jsp:include page="/WEB-INF/views/partials/footer.jsp" />

</body>

</html>