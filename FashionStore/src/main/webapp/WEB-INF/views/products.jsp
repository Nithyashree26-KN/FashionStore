<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fashionstore.model.Product" %>
<%@ page import="com.fashionstore.utils.ImageUtil" %>

<!DOCTYPE html>
<html>
<head>
    <title>Products - VASTRA</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
    <style>
        /* ===== PRODUCTS PAGE LAYOUT ===== */
        .products-page {
            display: flex;
            gap: 30px;
            width: 92%;
            margin: 40px auto;
            align-items: flex-start;
        }

        /* ===== FILTER SIDEBAR ===== */
        .filter-sidebar {
            width: 270px;
            flex-shrink: 0;
            background: #ffffff;
            border: 1px solid #eaeaea;
            border-radius: 16px;
            padding: 28px 24px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.05);
            position: sticky;
            top: 90px;
        }

        .filter-sidebar h2 {
            font-size: 18px;
            font-weight: 700;
            color: #111;
            margin-bottom: 24px;
            padding-bottom: 14px;
            border-bottom: 2px solid #f0f0f0;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .filter-group {
            margin-bottom: 26px;
        }

        .filter-group label {
            display: block;
            font-size: 13px;
            font-weight: 600;
            color: #555;
            text-transform: uppercase;
            letter-spacing: 0.8px;
            margin-bottom: 12px;
        }

        /* Price Range Slider */
        .price-inputs {
            display: flex;
            gap: 10px;
            margin-bottom: 14px;
        }

        .price-inputs input {
            width: 100%;
            padding: 10px 12px;
            border: 1.5px solid #e0e0e0;
            border-radius: 8px;
            font-size: 14px;
            color: #111;
            font-family: inherit;
            transition: border-color 0.2s;
            background: #fafafa;
        }

        .price-inputs input:focus {
            outline: none;
            border-color: #7a0000;
            background: #fff;
        }

        /* Range Slider */
        .range-slider-wrap {
            position: relative;
            margin: 8px 0 18px 0;
        }

        .range-slider-wrap input[type="range"] {
            -webkit-appearance: none;
            width: 100%;
            height: 4px;
            border-radius: 4px;
            background: linear-gradient(to right, #7a0000 0%, #7a0000 50%, #e0e0e0 50%, #e0e0e0 100%);
            outline: none;
            cursor: pointer;
        }

        .range-slider-wrap input[type="range"]::-webkit-slider-thumb {
            -webkit-appearance: none;
            width: 18px;
            height: 18px;
            border-radius: 50%;
            background: #7a0000;
            border: 3px solid #fff;
            box-shadow: 0 2px 6px rgba(0,0,0,0.2);
            cursor: pointer;
        }

        .range-price-labels {
            display: flex;
            justify-content: space-between;
            font-size: 12px;
            color: #888;
            margin-top: 6px;
        }

        /* Sort dropdown */
        .filter-select {
            width: 100%;
            padding: 11px 14px;
            border: 1.5px solid #e0e0e0;
            border-radius: 8px;
            font-size: 14px;
            color: #111;
            font-family: inherit;
            background: #fafafa;
            cursor: pointer;
            transition: border-color 0.2s;
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'%3E%3Cpath fill='%23555' d='M6 8L1 3h10z'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 12px center;
        }

        .filter-select:focus {
            outline: none;
            border-color: #7a0000;
        }

        /* Buttons */
        .btn-apply {
            width: 100%;
            padding: 13px;
            background: linear-gradient(135deg, #7a0000, #b00000);
            color: #fff;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            font-family: inherit;
            transition: opacity 0.2s, transform 0.2s;
            margin-top: 6px;
        }

        .btn-apply:hover {
            opacity: 0.92;
            transform: translateY(-1px);
        }

        .btn-clear {
            width: 100%;
            padding: 11px;
            background: transparent;
            color: #7a0000;
            border: 1.5px solid #7a0000;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            font-family: inherit;
            margin-top: 10px;
            transition: all 0.2s;
        }

        .btn-clear:hover {
            background: #7a0000;
            color: #fff;
        }

        /* ===== PRODUCTS AREA ===== */
        .products-area {
            flex: 1;
            min-width: 0;
        }

        .products-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 24px;
        }

        .products-header h1 {
            font-size: 26px;
            font-weight: 700;
            color: #111;
        }

        .result-count {
            font-size: 14px;
            color: #888;
            background: #f5f5f5;
            padding: 6px 14px;
            border-radius: 20px;
            font-weight: 500;
        }

        /* Active filter pills */
        .active-filters {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            margin-bottom: 20px;
        }

        .filter-pill {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 5px 12px;
            background: #fff0f0;
            border: 1px solid #f5c6c6;
            color: #7a0000;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 600;
        }

        /* product grid */
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 24px;
        }

        .product-card {
            background: #fff;
            border-radius: 16px;
            overflow: hidden;
            border: 1px solid #f0f0f0;
            box-shadow: 0 2px 12px rgba(0,0,0,0.06);
            transition: transform 0.25s ease, box-shadow 0.25s ease;
            display: flex;
            flex-direction: column;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }

        .product-image {
            width: 100%;
            height: 220px;
            overflow: hidden;
            position: relative;
            background: #fafafa;
        }

        .product-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.4s ease;
        }

        .product-card:hover .product-image img {
            transform: scale(1.06);
        }

        .wishlist-btn {
            position: absolute;
            top: 12px;
            right: 12px;
            background: rgba(255,255,255,0.9);
            border: none;
            border-radius: 50%;
            width: 36px;
            height: 36px;
            font-size: 16px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            backdrop-filter: blur(4px);
            transition: transform 0.2s;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .wishlist-btn:hover { transform: scale(1.15); }
        .wishlist-btn.active { background: #fff0f0; }

        .product-info {
            padding: 18px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
        }

        .product-info h3 {
            font-size: 15px;
            font-weight: 600;
            color: #111;
            margin-bottom: 6px;
            line-height: 1.3;
        }

        .price {
            font-size: 18px;
            font-weight: 700;
            color: #b12704;
            margin-bottom: 14px;
        }

        .product-info .btn {
            display: block;
            text-align: center;
            padding: 10px;
            background: #111;
            color: #fff;
            text-decoration: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            margin-top: auto;
            transition: background 0.2s;
        }

        .product-info .btn:hover { background: #7a0000; }

        .no-products {
            grid-column: 1 / -1;
            text-align: center;
            padding: 80px 20px;
            color: #888;
        }

        .no-products h3 { font-size: 22px; margin-bottom: 10px; color: #444; }
        .no-products p  { font-size: 15px; }
    </style>
</head>
<body>

<jsp:include page="/WEB-INF/views/partials/navbar.jsp" />

<%
    List<Product> products = (List<Product>) request.getAttribute("products");
    String selMin     = (String) request.getAttribute("selMin");
    String selMax     = (String) request.getAttribute("selMax");
    String selSort    = (String) request.getAttribute("selSort");
    String selKeyword = (String) request.getAttribute("selKeyword");

    boolean hasActiveFilter =
        (selMin     != null && !selMin.isEmpty())  ||
        (selMax     != null && !selMax.isEmpty())  ||
        (selSort    != null && !selSort.isEmpty()) ||
        (selKeyword != null && !selKeyword.isEmpty());

    int count = (products != null) ? products.size() : 0;
%>

<div class="products-page">

    <!-- ===== FILTER SIDEBAR ===== -->
    <aside class="filter-sidebar">

        <h2>🔍 Filters</h2>

        <form id="filterForm" method="get"
              action="${pageContext.request.contextPath}/products">

            <!-- PRICE RANGE -->
            <div class="filter-group">
                <label>Price Range (₹)</label>
                <div class="price-inputs">
                    <input type="number" id="minPrice" name="minPrice"
                           placeholder="Min" min="0"
                           value="<%= selMin != null ? selMin : "" %>">
                    <input type="number" id="maxPrice" name="maxPrice"
                           placeholder="Max" min="0"
                           value="<%= selMax != null ? selMax : "" %>">
                </div>
                <div class="range-slider-wrap">
                    <input type="range" id="priceSlider"
                           min="0" max="10000" step="100" value="5000"
                           oninput="updateSlider(this)">
                </div>
                <div class="range-price-labels">
                    <span>₹0</span>
                    <span id="sliderLabel">₹5000</span>
                    <span>₹10000</span>
                </div>
            </div>

            <!-- SORT BY -->
            <div class="filter-group">
                <label>Sort By</label>
                <select name="sort" class="filter-select" id="sortSelect">
                    <option value=""        <%= "".equals(selSort)          ? "selected" : "" %>>Default</option>
                    <option value="price_asc"  <%= "price_asc".equals(selSort)  ? "selected" : "" %>>Price: Low → High</option>
                    <option value="price_desc" <%= "price_desc".equals(selSort) ? "selected" : "" %>>Price: High → Low</option>
                </select>
            </div>

            <button type="submit" class="btn-apply">Apply Filters</button>
            <button type="button" class="btn-clear" onclick="clearFilters()">Clear All</button>

        </form>

    </aside>

    <!-- ===== PRODUCTS AREA ===== -->
    <div class="products-area">

        <div class="products-header">
            <h1>All Products</h1>
            <span class="result-count"><%= count %> product<%= count != 1 ? "s" : "" %> found</span>
        </div>

        <!-- Active filter pills -->
        <% if (hasActiveFilter) { %>
        <div class="active-filters">
            <% if (selMin != null && !selMin.isEmpty()) { %>
                <span class="filter-pill">Min ₹<%= selMin %></span>
            <% } %>
            <% if (selMax != null && !selMax.isEmpty()) { %>
                <span class="filter-pill">Max ₹<%= selMax %></span>
            <% } %>
            <% if ("price_asc".equals(selSort))  { %><span class="filter-pill">Price ↑</span><% } %>
            <% if ("price_desc".equals(selSort)) { %><span class="filter-pill">Price ↓</span><% } %>
        </div>
        <% } %>

        <!-- Product Grid -->
        <div class="product-grid">

            <%
                if (products != null && !products.isEmpty()) {
                    for (Product p : products) {
            %>

            <div class="product-card">

                <div class="product-image">
                    <img src="${pageContext.request.contextPath}/<%= ImageUtil.getImageUrl(p) %>"
                         alt="<%= p.getProductName() %>">
                    <button class="wishlist-btn"
                            data-product-id="<%= p.getProductId() %>"
                            onclick="addToWishlist(event, this)">
                        🤍
                    </button>
                </div>

                <div class="product-info">
                    <h3><%= p.getProductName() %></h3>
                    <p class="price">₹ <%= p.getPrice() %></p>
                    <a href="${pageContext.request.contextPath}/product-details?id=<%= p.getProductId() %>"
                       class="btn">View Details</a>
                </div>

            </div>

            <%
                    }
                } else {
            %>
            <div class="no-products">
                <h3>No Products Found</h3>
                <p>Try adjusting your price range or clearing the filters.</p>
            </div>
            <%
                }
            %>

        </div><!-- end product-grid -->

    </div><!-- end products-area -->

</div><!-- end products-page -->

<jsp:include page="/WEB-INF/views/partials/footer.jsp" />

<script>
/* ===== PRICE SLIDER ===== */
function updateSlider(slider) {
    const val = parseInt(slider.value);
    document.getElementById('sliderLabel').textContent = '₹' + val.toLocaleString('en-IN');
    document.getElementById('maxPrice').value = val;

    // Update gradient fill
    const pct = (val / 10000) * 100;
    slider.style.background =
        `linear-gradient(to right, #7a0000 0%, #7a0000 ${pct}%, #e0e0e0 ${pct}%, #e0e0e0 100%)`;
}

// Initialise slider to reflect existing maxPrice value on page load
(function () {
    const maxInput = document.getElementById('maxPrice');
    const slider   = document.getElementById('priceSlider');
    if (maxInput && maxInput.value) {
        const v = parseInt(maxInput.value);
        if (!isNaN(v)) {
            slider.value = Math.min(v, 10000);
            updateSlider(slider);
        }
    }
})();

/* ===== CLEAR FILTERS ===== */
function clearFilters() {
    window.location.href = "${pageContext.request.contextPath}/products";
}

/* ===== SORT ON CHANGE ===== */
document.getElementById('sortSelect').addEventListener('change', function () {
    document.getElementById('filterForm').submit();
});

/* ===== WISHLIST ===== */
document.addEventListener("DOMContentLoaded", function() {
    let saved = localStorage.getItem('wishlistItems');
    let items = saved ? JSON.parse(saved) : [];
    document.querySelectorAll('.wishlist-btn').forEach(btn => {
        if (items.includes(btn.dataset.productId)) {
            btn.classList.add('active');
            btn.innerHTML = '❤️';
        }
    });
});

function addToWishlist(event, btn) {
    event.preventDefault();
    event.stopPropagation();

    let pid   = btn.dataset.productId;
    let saved = localStorage.getItem('wishlistItems');
    let items = saved ? JSON.parse(saved) : [];

    const isActive = btn.classList.toggle('active');
    btn.innerHTML  = isActive ? '❤️' : '🤍';

    if (isActive) {
        if (!items.includes(pid)) items.push(pid);
    } else {
        items = items.filter(id => id !== pid);
    }
    localStorage.setItem('wishlistItems', JSON.stringify(items));

    const countSpan = document.getElementById('wishlist-count');
    if (countSpan) countSpan.innerText = items.length;

    if (isActive) {
        const wishlistTarget = document.getElementById('navbar-wishlist');
        if (!wishlistTarget) return;
        const btnRect    = btn.getBoundingClientRect();
        const targetRect = wishlistTarget.getBoundingClientRect();

        const heart = document.createElement('div');
        heart.className = 'flying-heart';
        heart.innerHTML = '❤️';
        heart.style.left = btnRect.left + 'px';
        heart.style.top  = btnRect.top  + 'px';
        document.body.appendChild(heart);

        setTimeout(() => {
            heart.style.transform = `translate(${targetRect.left - btnRect.left}px, ${targetRect.top - btnRect.top}px) scale(0.6)`;
            heart.style.opacity   = '0';
        }, 10);
        setTimeout(() => {
            heart.remove();
            wishlistTarget.style.transition = 'transform 0.2s ease';
            wishlistTarget.style.transform  = 'scale(1.2)';
            setTimeout(() => wishlistTarget.style.transform = 'scale(1)', 200);
        }, 800);
    }
}
</script>

</body>
</html>