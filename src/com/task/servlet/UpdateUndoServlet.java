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

public class UpdateUndoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(req.getParameter("id"));
        int ifAdmin = Integer.parseInt(req.getParameter("ifadmin"));
        int employeeId = Integer.parseInt(req.getParameter("employeeid"));
        String taskContent = req.getParameter("taskcontent");
        String startTime = req.getParameter("starttime");
        String endTime = req.getParameter("endtime");
        Undo undo = new Undo(id,taskContent,startTime,endTime,ifAdmin,employeeId);
        AdminDao ad = new AdminDaoImpl();
        boolean b = ad.updateUndo(undo);
        if (b){
            resp.sendRedirect("SelectAllUndoServlet");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
