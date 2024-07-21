package com.task.servlet;

import com.task.dao.AdminDao;
import com.task.daoImpl.AdminDaoImpl;
import com.task.vo.Announce;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class SelectAnnounceByIdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        AdminDao ad = new AdminDaoImpl();
        Announce announce = ad.selectAnnounceById(id);
        req.setAttribute("announce",announce);
        req.getRequestDispatcher("admin/updateAnnounce.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
