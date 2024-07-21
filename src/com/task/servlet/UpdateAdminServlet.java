package com.task.servlet;

import com.task.dao.AdminDao;
import com.task.daoImpl.AdminDaoImpl;
import com.task.vo.Admin;
import com.task.vo.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class UpdateAdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        int age = Integer.parseInt(req.getParameter("age"));
        String sex = req.getParameter("sex");
        String pwd = req.getParameter("password");
        String tel = req.getParameter("tel");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        String dept = req.getParameter("dept");
        String job = req.getParameter("job");
        int level = Integer.parseInt(req.getParameter("level"));
        Admin admin = new Admin(id,name,pwd,age,sex,tel,email,address,dept,job,level);
        AdminDao ad = new AdminDaoImpl();
        boolean b = ad.updateAdmin(admin);
        int all= Integer.parseInt(req.getParameter("all"));
        if (b && all==0){
            resp.sendRedirect("SelectById2Servlet?id="+id+"&flag=0");
        }
        else if (b &&all==1) {
            resp.sendRedirect("SelectAllAdminServlet");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
