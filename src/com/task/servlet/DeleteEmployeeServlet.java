package com.task.servlet;

import com.task.dao.AdminDao;
import com.task.daoImpl.AdminDaoImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class DeleteEmployeeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        AdminDao ad = new AdminDaoImpl();
        int id = Integer.parseInt(req.getParameter("id"));
        boolean ifDelete = ad.deleteEmployeeById(id);
        if (ifDelete){
            resp.sendRedirect("SelectAllEmployeeServlet");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
