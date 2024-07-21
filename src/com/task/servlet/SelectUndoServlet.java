package com.task.servlet;

import com.task.dao.EmployeeDao;
import com.task.daoImpl.EmployeeDaoImpl;
import com.task.vo.Undo;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class SelectUndoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        int id = (int) session.getAttribute("id");
        String level = (String) session.getAttribute("level");
        int ifadmin=0;
        if (level.equals("admin")){
            ifadmin=1;
        }
        EmployeeDao ed = new EmployeeDaoImpl();
        ArrayList<Undo> undoArrayList = ed.selectUndo(id, ifadmin);
        req.setAttribute("undoList", undoArrayList);
        if (ifadmin==0){
            req.getRequestDispatcher("employee/employeeUndo.jsp").forward(req,resp);
        }else {
            req.getRequestDispatcher("admin/adminUndo.jsp").forward(req,resp);
        }



    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
