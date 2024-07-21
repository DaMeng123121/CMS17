package com.task.servlet;

import com.task.dao.AdminDao;
import com.task.daoImpl.AdminDaoImpl;
import com.task.vo.Admin;
import com.task.vo.Undo;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddUndoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int employeeId = Integer.parseInt(req.getParameter("employeeId"));
        int ifAdmin = Integer.parseInt(req.getParameter("ifAdmin"));
        String taskContent = req.getParameter("taskContent");
        String startTime = req.getParameter("startTime");
        String endTime = req.getParameter("endTime");
        Undo undo = new Undo(1,taskContent,startTime,endTime,ifAdmin,employeeId);
        AdminDao ad = new AdminDaoImpl();
        boolean b = ad.addUndo(undo);
        if (b){
            resp.sendRedirect("SelectAllUndoServlet");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
