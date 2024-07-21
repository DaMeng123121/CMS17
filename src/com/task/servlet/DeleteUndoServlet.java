package com.task.servlet;

import com.task.dao.EmployeeDao;
import com.task.daoImpl.EmployeeDaoImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class DeleteUndoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        int id = Integer.parseInt(req.getParameter("id"));
        EmployeeDao ed = new EmployeeDaoImpl();
        boolean b = ed.deleteUndo(id);
        int flag = Integer.parseInt(req.getParameter("flag"));
        if (b && flag == 2){
            resp.sendRedirect("SelectAllUndoServlet");
        } else if (b && flag == 0) {
            resp.sendRedirect("SelectUndoServlet");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
