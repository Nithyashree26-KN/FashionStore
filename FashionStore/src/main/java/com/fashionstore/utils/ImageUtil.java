package com.fashionstore.utils;

import com.fashionstore.model.Product;

public class ImageUtil {

    public static String getImageUrl(Product p) {
        String imageName = "default.jpg";
        if (p == null || p.getProductName() == null) {
            return "assets/images/products/" + imageName;
        }

        String name = p.getProductName();
        
        if (name.equalsIgnoreCase("Black Casual Shirt")) {
            imageName = "black_shirt.jpg";
        } else if (name.equalsIgnoreCase("Blue Slim Fit Jeans")) {
            imageName = "blue_jeans.jpg";
        } else if (name.equalsIgnoreCase("White Polo T-Shirt")) {
            imageName = "white_polo.jpg";
        } else if (name.equalsIgnoreCase("Floral Summer Dress")) {
            imageName = "floral_dress.jpg";
        } else if (name.equalsIgnoreCase("Pink Kurti")) {
            imageName = "pink_kurti.jpg";
        } else if (name.equalsIgnoreCase("Black High Waist Jeans")) {
            imageName = "black_waist_jeans.jpg";
        } else if (name.equalsIgnoreCase("Boys Checked Shirt")) {
            imageName = "boys_checked_shirt.jpg";
        } else if (name.equalsIgnoreCase("Girls Party Dress")) {
            imageName = "girls_party_dress.jpg";
        } else if (name.equalsIgnoreCase("Leather Belt")) {
            imageName = "leather_belt.jpg";
        } else if (name.equalsIgnoreCase("Women Handbag")) {
            imageName = "women_handbag.jpg";
        } else if (name.equalsIgnoreCase("Unisex Cap")) {
            imageName = "unisex_cap.jpg";
        } else if (name.equalsIgnoreCase("Green Hoodie")) {
            imageName = "green_hoodie.jpg";
        } else if (p.getImageUrl() != null && !p.getImageUrl().isEmpty()) {
            // Fallback to database URL if no manual match
            return p.getImageUrl();
        }

        return "assets/images/products/" + imageName;
    }
}
