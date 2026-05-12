package com.fashionstore.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.fashionstore.dao.ProductDAO;
import com.fashionstore.dao.impl.ProductDAOImpl;
import com.fashionstore.model.Product;
import com.fashionstore.model.CartItem;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private ProductDAO productDAO = new ProductDAOImpl();

    @SuppressWarnings("unchecked")
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

    	String action = request.getParameter("action");

    	HttpSession session = request.getSession();

    	List<CartItem> cart =
    	        (List<CartItem>) session.getAttribute("cart");

    	if(cart == null){
    	    cart = new ArrayList<>();
    	}

    	if("add".equals(action)){

    	    int productId =
    	            Integer.parseInt(request.getParameter("id"));

    	    Product product =
    	            productDAO.getProductById(productId);

    	    boolean found = false;

    	    for(CartItem item : cart){

    	        if(item.getProduct().getProductId() == productId){

    	            item.setQuantity(item.getQuantity() + 1);

    	            found = true;
    	            break;
    	        }
    	    }

    	    if(!found){

    	        cart.add(new CartItem(product, 1));
    	    }

    	    session.setAttribute("cart", cart);
    	}

    	else if("increase".equals(action)){

    	    int productId =
    	            Integer.parseInt(request.getParameter("id"));

    	    for(CartItem item : cart){

    	        if(item.getProduct().getProductId() == productId){

    	            item.setQuantity(item.getQuantity() + 1);

    	            break;
    	        }
    	    }

    	    session.setAttribute("cart", cart);
    	}

    	else if("decrease".equals(action)){

    	    int productId =
    	            Integer.parseInt(request.getParameter("id"));

    	    for(CartItem item : cart){

    	        if(item.getProduct().getProductId() == productId){

    	            if(item.getQuantity() > 1){

    	                item.setQuantity(item.getQuantity() - 1);
    	            }

    	            break;
    	        }
    	    }

    	    session.setAttribute("cart", cart);
    	}

    	request.setAttribute("cartItems", cart);

    	request.getRequestDispatcher("/WEB-INF/views/cart.jsp")
    	        .forward(request, response);    }
}