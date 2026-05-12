package com.fashionstore.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.fashionstore.util.DBConnection;

@WebServlet("/test-db")
public class TestDBServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Connection conn = DBConnection.getConnection();

            if (conn != null && !conn.isClosed()) {
                out.println("<h2>✅ Database Connected Successfully</h2>");
            } else {
                out.println("<h2>❌ Database Connection Failed</h2>");
            }

        } catch (Exception e) {
            out.println("<h2>❌ Error: " + e.getMessage() + "</h2>");
            e.printStackTrace();
        }
    }
}