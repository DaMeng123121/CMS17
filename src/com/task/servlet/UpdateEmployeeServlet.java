package com.task.servlet;

import com.task.dao.AdminDao;
import com.task.daoImpl.AdminDaoImpl;
import com.task.vo.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class UpdateEmployeeServlet extends HttpServlet {
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
        int ifon = 1;
        int all = Integer.parseInt(req.getParameter("all"));

        Employee employee = new Employee(id,name,pwd,age,sex,tel,email,address,dept,job,ifon);
        System.out.println(id+"#"+name+"#"+age+"#"+sex+"#"+pwd+"#"+tel+"#"+email+"#"+address+"#"+dept+"#"+job+"#");
        AdminDao ad = new AdminDaoImpl();
        boolean b = ad.updateEmployee(employee);
        if (b && all==0){
            resp.sendRedirect("SelectByIdServlet?id="+id+"&flag=0");
        } else if (b && all == 1) {
            resp.sendRedirect("SelectAllEmployeeServlet");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
