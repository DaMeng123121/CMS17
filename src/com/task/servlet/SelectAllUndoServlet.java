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
import java.util.List;

public class SelectAllUndoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        AdminDao ad = new AdminDaoImpl();
        List<Undo> undoList = ad.selectAllUndo();
        req.setAttribute("undoList",undoList);
        req.getRequestDispatcher("admin/allUndo.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
