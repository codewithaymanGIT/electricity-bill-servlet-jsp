package com.electricitybill;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/calculate")
public class BillServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String unitsParam = request.getParameter("units");
        String error = null;
        Double bill = null;
        Double units = null;

        try {
            units = Double.parseDouble(unitsParam);
            if (units < 0) {
                error = "Please enter a valid, non-negative number of units.";
            } else {
                bill = calculateBill(units);
            }
        } catch (NumberFormatException | NullPointerException e) {
            error = "Please enter a valid, non-negative number of units.";
        }

        request.setAttribute("units", unitsParam);
        request.setAttribute("bill", bill);
        request.setAttribute("error", error);

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    private double calculateBill(double units) {
        double total;

        if (units <= 50) {
            total = units * 3.50;
        } else if (units <= 150) {
            total = (50 * 3.50) + ((units - 50) * 4.00);
        } else if (units <= 250) {
            total = (50 * 3.50) + (100 * 4.00) + ((units - 150) * 5.20);
        } else {
            total = (50 * 3.50) + (100 * 4.00) + (100 * 5.20) + ((units - 250) * 6.50);
        }

        return Math.round(total * 100.0) / 100.0;
    }
}