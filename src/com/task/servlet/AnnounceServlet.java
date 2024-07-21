package com.task.servlet;

import com.task.dao.EmployeeDao;
import com.task.daoImpl.EmployeeDaoImpl;
import com.task.vo.Announce;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class AnnounceServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        EmployeeDao ed = new EmployeeDaoImpl();
        ArrayList<Announce> announceList = ed.selectAnnounce();
        req.setAttribute("announceList", announceList);
        int flag = Integer.parseInt(req.getParameter("flag"));
        if (flag == 1){
            req.getRequestDispatcher("employee/announce.jsp").forward(req,resp);
        }else if(flag==2){
            req.getRequestDispatcher("employee/employeeAnnounceList.jsp").forward(req,resp);
        } else if (flag == 3) {
            req.getRequestDispatcher("admin/adminAnnounceList.jsp").forward(req,resp);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
