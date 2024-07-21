package com.task.servlet;

import com.task.dao.AdminDao;
import com.task.daoImpl.AdminDaoImpl;
import com.task.vo.Admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class SelectAllAdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        int id = (int) session.getAttribute("id");
        AdminDao ad = new AdminDaoImpl();
        Admin admin = ad.adminSelectById(id);
        int level = admin.getLevel();
        ArrayList<Admin> adminList = ad.selectAllAdmin(level);
        req.setAttribute("adminList",adminList);
        req.getRequestDispatcher("admin/allAdminInfo.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
