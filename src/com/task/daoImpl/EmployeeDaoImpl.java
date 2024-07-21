package com.task.daoImpl;

import com.task.dao.EmployeeDao;
import com.task.db.DBConnection;
import com.task.vo.Announce;
import com.task.vo.Employee;
import com.task.vo.Salary;
import com.task.vo.Undo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class EmployeeDaoImpl implements EmployeeDao {
    public Connection conn;
    //预处理
    public PreparedStatement pst;
    //结果
    public ResultSet rs;
    @Override
    public String employeeLogin(int id, String password) {
        DBConnection dbConn = new DBConnection();
        conn = dbConn.getConn();
        String sql = "select * from employee where id=? and password=?";
        try {
            pst= conn.prepareStatement(sql);
            pst.setInt(1, id);
            pst.setString(2, password);
            rs = pst.executeQuery();
            if (rs.next()){
                return rs.getString("name");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return null;
    }

    @Override
    public ArrayList<Announce> selectAnnounce() {
        DBConnection dbConn = new DBConnection();
        conn = dbConn.getConn();
        String sql = "select * from announcement";
        ArrayList<Announce> announceList = new ArrayList<>();
        try {
            pst= conn.prepareStatement(sql);
            rs= pst.executeQuery();
            Announce announce;
            while (rs.next()){
                int id= rs.getInt("id");
                String content = rs.getString("content");
                String time = rs.getString("time");
                String publisher = rs.getString("publisher");
                announce = new Announce(id, content,time, publisher);
                announceList.add(announce);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return announceList;
    }

    @Override
    public Employee employeeSelectById(int id) {
        DBConnection dbConn = new DBConnection();
        conn = dbConn.getConn();
        String sql = "select * from employee where id=?";
        Employee employee= new Employee();
        try {
            pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()){
                employee.setId(id);
                employee.setName(rs.getString("name"));
                employee.setPassword(rs.getString("password"));
                employee.setAge(rs.getInt("age"));
                employee.setSex(rs.getString("sex"));
                employee.setAddress(rs.getString("address"));
                employee.setTel(rs.getString("tel"));
                employee.setEmail(rs.getString("email"));
                employee.setDept(rs.getString("dept"));
                employee.setJob(rs.getString("job"));
                employee.setIfon(rs.getInt("ifon"));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return employee;
    }

    @Override
    public ArrayList<Undo> selectUndo(int id, int ifAdmin) {
        DBConnection dbConn = new DBConnection();
        conn = dbConn.getConn();
        String sql="select * from undo1 where employeeid=? and ifadmin=?";
        ArrayList<Undo> undoArrayList = new ArrayList<>();
        try {
            pst=conn.prepareStatement(sql);
            pst.setInt(1, id);
            pst.setInt(2, ifAdmin);
            rs = pst.executeQuery();
            Undo undo ;
            while (rs.next()){
                undo = new Undo();
                undo.setId(rs.getInt("id"));
                undo.setEmployeeId(rs.getInt("employeeid"));
                undo.setIfAdmin(rs.getInt("ifadmin"));
                undo.setTaskContent(rs.getString("taskcontent"));
                undo.setStartTime(rs.getString("starttime"));
                undo.setEndTime(rs.getString("endtime"));
                undoArrayList.add(undo);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return undoArrayList;
    }

    @Override
    public boolean deleteUndo(int id) {
        DBConnection dbConn = new DBConnection();
        conn=dbConn.getConn();
        String sql = "delete from undo1 where id=?";
        try {
            pst = conn.prepareStatement(sql);
            pst.setInt(1, id);

            int flag = pst.executeUpdate();
            if (flag>0){
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    @Override
    public Salary selectSalary(int id, int ifAdmin) {
        DBConnection dbConn = new DBConnection();
        conn=dbConn.getConn();
        String sql = "select * from salary where employeeid=? and ifadmin=?";
        Salary salary= new Salary();
        try {
            pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            pst.setInt(2,ifAdmin);
            rs = pst.executeQuery();
            if (rs.next()){
                salary.setMonth(rs.getInt("month"));
                salary.setEmployeeId(id);
                salary.setIfAdmin(ifAdmin);
                salary.setBaseSalary(rs.getInt("basesalary"));
                salary.setFullWork(rs.getInt("fullwork"));
                salary.setOverTime(rs.getInt("overtime"));
                salary.setSalarySum(rs.getInt("salarysun"));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return salary;
    }

    @Override
    public boolean addSalary(Salary salary) {
        DBConnection dbConn = new DBConnection();
        conn=dbConn.getConn();
        String sql = "insert into salary values(?,?,?,?,?,?,?,?)";
        try {
            pst=conn.prepareStatement(sql);
            pst.setInt(1,salary.getMonth());
            pst.setInt(2,salary.getEmployeeId());
            pst.setString(3,salary.getName());
            pst.setInt(4,salary.getIfAdmin());
            pst.setInt(5,salary.getBaseSalary());
            pst.setInt(6,salary.getFullWork());
            pst.setInt(7,salary.getOverTime());
            pst.setInt(8,salary.getSalarySum());
            int i = pst.executeUpdate();
            if (i>0){
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    @Override
    public boolean deleteSalary(int id, int ifAdmin) {
        DBConnection dbConn = new DBConnection();
        conn=dbConn.getConn();
        String sql = "delete from salary where id=? and ifadmin=?";
        try {
            pst=conn.prepareStatement(sql);
            pst.setInt(1,id);
            pst.setInt(2,ifAdmin);
            int i = pst.executeUpdate();
            if (i>0){
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    @Override
    public boolean updateSalary(Salary salary) {
        DBConnection dbConn = new DBConnection();
        conn=dbConn.getConn();
        String sql = "update salary set month=?,basesalary=?,fullwork=?,overtime=?,salarysum=? where employeeid=? and ifadmin=?";
        try {
            pst=conn.prepareStatement(sql);
            int month = salary.getMonth();
            int baseSalary= salary.getBaseSalary();
            int fullWork=salary.getFullWork();
            int overTime=salary.getOverTime();

            pst.setInt(1,month);
            pst.setInt(2,baseSalary);
            pst.setInt(3,fullWork);
            pst.setInt(4,overTime);
            pst.setInt(5,baseSalary+fullWork+overTime);
            pst.setInt(6,salary.getEmployeeId());
            pst.setInt(7,salary.getIfAdmin());
            int i = pst.executeUpdate();
            if (i>0){
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }
}
