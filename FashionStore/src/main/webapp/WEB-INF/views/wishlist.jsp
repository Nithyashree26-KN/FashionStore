<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fashionstore.model.Product" %>
<%@ page import="com.fashionstore.utils.ImageUtil" %>

<!DOCTYPE html>
<html>
<head>
    <title>My Wishlist - FashionStore</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
</head>

<body>

<jsp:include page="/WEB-INF/views/partials/navbar.jsp" />

<div class="container">

    <h1 class="section-title">My Wishlist</h1>

    <div class="product-grid" id="wishlist-grid">

        <%
            List<Product> products = (List<Product>) request.getAttribute("wishlistProducts");
            if(products != null && !products.isEmpty()){
                for(Product p : products){
        %>

        <div class="product-card" id="wishlist-item-<%= p.getProductId() %>">

            <div class="product-image">
                <img src="${pageContext.request.contextPath}/<%= ImageUtil.getImageUrl(p) %>" alt="Product Image" />
                <button class="wishlist-btn active" data-product-id="<%= p.getProductId() %>" onclick="removeFromWishlist(event, this, <%= p.getProductId() %>)">
                    ❤️
                </button>
            </div>

            <div class="product-info">
                <h3><%= p.getProductName() %></h3>
                <p class="price">
                    ₹ <%= p.getPrice() %>
                </p>
                <a href="${pageContext.request.contextPath}/product-details?id=<%= p.getProductId() %>" class="btn">
                    View Details
                </a>
            </div>

        </div>

        <%
                }
            } else {
        %>

        <p id="empty-msg" style="text-align:center; grid-column:1/-1; color:#777; font-size: 18px; margin-top: 40px;">
            Your wishlist is empty. Start adding some ❤️ to your favorite items!
        </p>

        <%
            }
        %>

    </div>

</div>

<jsp:include page="/WEB-INF/views/partials/footer.jsp" />

<script>
function removeFromWishlist(event, btn, productId) {
    event.preventDefault();
    event.stopPropagation();
    
    // Remove from localStorage
    let savedWishlist = localStorage.getItem('wishlistItems');
    if (savedWishlist) {
        let items = JSON.parse(savedWishlist);
        items = items.filter(id => id !== String(productId));
        localStorage.setItem('wishlistItems', JSON.stringify(items));
        
        // Update navbar count
        const countSpan = document.getElementById('wishlist-count');
        if (countSpan) {
            countSpan.innerText = items.length;
        }
    }
    
    // Remove the card from the UI
    const card = document.getElementById('wishlist-item-' + productId);
    if (card) {
        card.style.transition = "opacity 0.3s ease";
        card.style.opacity = "0";
        setTimeout(() => {
            card.remove();
            
            // Show empty message if grid is empty
            const grid = document.getElementById('wishlist-grid');
            if (grid && grid.querySelectorAll('.product-card').length === 0) {
                grid.innerHTML = '<p id="empty-msg" style="text-align:center; grid-column:1/-1; color:#777; font-size: 18px; margin-top: 40px;">Your wishlist is empty. Start adding some ❤️ to your favorite items!</p>';
            }
        }, 300);
    }
}
</script>

</body>
</html>
