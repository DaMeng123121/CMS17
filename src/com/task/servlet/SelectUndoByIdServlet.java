package com.task.servlet;

import com.task.dao.AdminDao;
import com.task.daoImpl.AdminDaoImpl;
import com.task.vo.Undo;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class SelectUndoByIdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id= Integer.parseInt(req.getParameter("id"));
        AdminDao ad = new AdminDaoImpl();
        Undo undo = ad.selectUndoById(id);
        req.setAttribute("undo",undo);
        req.getRequestDispatcher("admin/updateUndo.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
