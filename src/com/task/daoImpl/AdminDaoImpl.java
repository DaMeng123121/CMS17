package com.task.daoImpl;

import com.task.dao.AdminDao;
import com.task.db.DBConnection;
import com.task.vo.Admin;
import com.task.vo.Announce;
import com.task.vo.Employee;
import com.task.vo.Undo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AdminDaoImpl implements AdminDao {
    public Connection conn;
    //预处理
    public PreparedStatement pst;
    //结果
    public ResultSet rs;
    @Override
    public String adminLogin(int id, String password) {
        DBConnection dbConn = new DBConnection();
        conn = dbConn.getConn();
        String sql = "select * from admin where id=? and password=?";
        try {
            pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            pst.setString(2, password);
            rs= pst.executeQuery();
            if (rs.next()){
                return rs.getString("name");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return null;
    }

    @Override
    public Admin adminSelectById(int id) {
        Admin admin=new Admin();
        DBConnection dbConn = new DBConnection();
        conn= dbConn.getConn();
        String sql = "select * from admin where id=?";
        try {
            pst= conn.prepareStatement(sql);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            if (rs.next()){

                admin.setId(id);
                admin.setName(rs.getString("name"));
                admin.setAge(rs.getInt("age"));
                admin.setSex(rs.getString("sex"));
                admin.setAddress(rs.getString("address"));
                admin.setPassword(rs.getString("password"));
                admin.setEmail(rs.getString("email"));
                admin.setTel(rs.getString("tel"));
                admin.setJob(rs.getString("job"));
                admin.setDept(rs.getString("dept"));
                admin.setLevel(rs.getInt("level"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return admin;
    }

    @Override
    public boolean updateAdmin(Admin admin) {
        DBConnection dbConn = new DBConnection();
        conn=dbConn.getConn();
        String sql = "update admin set name=?,age=?,sex=?,password=?,tel=?,email=?,address=?,dept=?,job=?,level=? where id=?";
        try {
            pst= conn.prepareStatement(sql);
            pst.setString(1,admin.getName());

            pst.setInt(2,admin.getAge());
            pst.setString(3, admin.getSex());
            pst.setString(4, admin.getPassword());
            pst.setString(5, admin.getTel());
            pst.setString(6, admin.getEmail());
            pst.setString(7, admin.getAddress());
            pst.setString(8, admin.getDept());
            pst.setString(9, admin.getJob());
            pst.setInt(10,admin.getLevel());
            pst.setInt(11,admin.getId());
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
    public boolean adminToEmployee(Admin admin){
        DBConnection dbConn = new DBConnection();
        conn=dbConn.getConn();
        String sql = "insert into employee values(id,?,?,?,?,?,?,?,?,?,0)";
        try {
            pst = conn.prepareStatement(sql);
            pst.setString(1, admin.getName());
            pst.setInt(2, admin.getAge());
            pst.setString(3, admin.getSex());
            pst.setString(4, admin.getPassword());
            pst.setString(5, admin.getTel());
            pst.setString(6, admin.getEmail());
            pst.setString(7, admin.getAddress());
            pst.setString(8, admin.getDept());
            pst.setString(9, admin.getJob());
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
    public boolean deleteAdmin(int id) {
        DBConnection dbConn = new DBConnection();
        conn=dbConn.getConn();
        String sql = "delete from admin where id=?";
        try {
            pst= conn.prepareStatement(sql);
            pst.setInt(1,id);
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
    public boolean addAdmin(Admin admin) {
        DBConnection dbConn = new DBConnection();
        conn = dbConn.getConn();
        String sql = "insert into admin values(id,?,?,?,?,?,?,?,?,?,?)";
        try {
            pst = conn.prepareStatement(sql);
            pst.setString(1, admin.getName());
            pst.setInt(2, admin.getAge());
            pst.setString(3, admin.getSex());
            pst.setString(4, admin.getPassword());
            pst.setString(5, admin.getTel());
            pst.setString(6, admin.getEmail());
            pst.setString(7, admin.getAddress());
            pst.setString(8, admin.getDept());
            pst.setString(9, admin.getJob());
            pst.setInt(10,admin.getLevel());
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
    public ArrayList<Admin> selectAllAdmin(int level) {
        DBConnection dbConn = new DBConnection();
        conn = dbConn.getConn();
        String sql = "select * from admin where level<?";
        ArrayList<Admin> adminList = new ArrayList<>();
        Admin admin;
        try {
            pst= conn.prepareStatement(sql);
            pst.setInt(1,level);
            rs = pst.executeQuery();
            while (rs.next()){
                admin = new Admin();
                admin.setId(rs.getInt("id"));
                admin.setName(rs.getString("name"));
                admin.setAge(rs.getInt("age"));
                admin.setSex(rs.getString("sex"));
                admin.setAddress(rs.getString("address"));
                admin.setPassword(rs.getString("password"));
                admin.setEmail(rs.getString("email"));
                admin.setTel(rs.getString("tel"));
                admin.setJob(rs.getString("job"));
                admin.setDept(rs.getString("dept"));
                admin.setLevel(rs.getInt("level"));
                adminList.add(admin);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return adminList;
    }

    @Override
    public boolean adminAddAnnounce(String content, String time, String publisher) {
        DBConnection dbConn = new DBConnection();
        conn = dbConn.getConn();
        String sql = "insert into announcement values(id,?,?,?)";
        try {
            pst = conn.prepareStatement(sql);
            pst.setString(1, content);
            pst.setString(2, time);
            pst.setString(3, publisher);
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
    public boolean adminDeleteAnnounce(int id) {
        DBConnection dbConn = new DBConnection();
        conn = dbConn.getConn();
        String sql = "delete from announcement where id=?";
        try {
            pst= conn.prepareStatement(sql);
            pst.setInt(1,id);
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
    public boolean adminUpdateAnnounce(Announce announce) {
        DBConnection dbConn = new DBConnection();
        conn = dbConn.getConn();
        String sql = "update announcement set content=?,time=?,publisher=? where id=?";
        try {
            pst = conn.prepareStatement(sql);
            pst.setString(1, announce.getContent());
            pst.setString(2, announce.getTime());
            pst.setString(3, announce.getPublisher());
            pst.setInt(4,announce.getId());
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
    public Announce selectAnnounceById(int id) {
        DBConnection dbConn = new DBConnection();
        conn = dbConn.getConn();
        Announce announce =new Announce();
        String sql ="select * from announcement where id=?";
        try {
            pst = conn.prepareStatement(sql);
            pst.setInt(1,id);
            rs = pst.executeQuery();
            if (rs.next()){
                announce.setId(id);
                announce.setContent(rs.getString("content"));
                announce.setTime(rs.getString("time"));
                announce.setPublisher(rs.getString("publisher"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return announce;
    }

    @Override
    public ArrayList<Employee> selectAllEmployee() {
        DBConnection dbConn = new DBConnection();
        conn = dbConn.getConn();
        ArrayList<Employee> employeeList = new ArrayList<>();
        String sql = "select * from employee where ifon=1";
        try {
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            Employee employee;
            while (rs.next()){
                employee = new Employee();
                employee.setId(rs.getInt("id"));
                employee.setName(rs.getString("name"));
                employee.setAge(rs.getInt("age"));
                employee.setSex(rs.getString("sex"));
                employee.setAddress(rs.getString("address"));
                employee.setPassword(rs.getString("password"));
                employee.setTel(rs.getString("tel"));
                employee.setEmail(rs.getString("email"));
                employee.setDept(rs.getString("dept"));
                employee.setJob(rs.getString("job"));
                employee.setIfon(rs.getInt("ifon"));
                employeeList.add(employee);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return employeeList;
    }

    @Override
    public boolean deleteEmployeeById(int id) {
        DBConnection dbConn = new DBConnection();
        conn = dbConn.getConn();
        String sql = "update employee set ifon=0 where id=?";
        try {
            pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
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
    public boolean addEmployee(Employee employee) {
        DBConnection dbConn = new DBConnection();
        conn = dbConn.getConn();
        String sql = "insert into employee values(id,?,?,?,?,?,?,?,?,?,1)";
        try {
            pst = conn.prepareStatement(sql);
            pst.setString(1, employee.getName());
            pst.setInt(2, employee.getAge());
            pst.setString(3, employee.getSex());
            pst.setString(4, employee.getPassword());
            pst.setString(5, employee.getTel());
            pst.setString(6, employee.getEmail());
            pst.setString(7, employee.getAddress());
            pst.setString(8, employee.getDept());
            pst.setString(9, employee.getJob());
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
    public boolean updateEmployee(Employee employee) {
        DBConnection dbConn = new DBConnection();
        conn = dbConn.getConn();
        String sql = "update employee set name=?,age=?,sex=?,password=?,tel=?,email=?,address=?,dept=?,job=?,ifon=? where id=?";
        try {
            pst = conn.prepareStatement(sql);
            pst.setString(1, employee.getName());
            pst.setInt(2, employee.getAge());
            pst.setString(3, employee.getSex());
            pst.setString(4, employee.getPassword());
            pst.setString(5, employee.getTel());
            pst.setString(6, employee.getEmail());
            pst.setString(7, employee.getAddress());
            pst.setString(8, employee.getDept());
            pst.setString(9, employee.getJob());
            pst.setInt(10, employee.getIfon());
            pst.setInt(11, employee.getId());
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
    public boolean addUndo(Undo undo) {
        DBConnection dbConn = new DBConnection();
        conn = dbConn.getConn();
        String sql = "insert into undo1 values(id,?,?,?,?,?)";
        try {
            pst= conn.prepareStatement(sql);
            pst.setInt(1,undo.getEmployeeId());
            pst.setInt(2,undo.getIfAdmin());
            pst.setString(3, undo.getTaskContent());
            pst.setString(4, undo.getStartTime());
            pst.setString(5,undo.getEndTime());
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
    public boolean updateUndo(Undo undo) {
        DBConnection dbConn = new DBConnection();
        conn = dbConn.getConn();
        String sql = "update undo1 set employeeid=?,ifadmin=?,taskcontent=?,starttime=?,endtime=? where id=?";
        try {
            pst= conn.prepareStatement(sql);
            pst.setInt(1,undo.getEmployeeId());
            pst.setInt(2,undo.getIfAdmin());
            pst.setString(3, undo.getTaskContent());
            pst.setString(4, undo.getStartTime());
            pst.setString(5,undo.getEndTime());
            pst.setInt(6,undo.getId());
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
    public Undo selectUndoById(int id) {
        DBConnection dbConn = new DBConnection();
        conn = dbConn.getConn();
        Undo undo=new Undo();
        String sql = "select * from undo1 where id=?";
        try {
            pst = conn.prepareStatement(sql);
            pst.setInt(1,id);
            rs= pst.executeQuery();
            if (rs.next()){
                undo.setId(id);
                undo.setIfAdmin(rs.getInt("ifadmin"));
                undo.setEmployeeId(rs.getInt("employeeid"));
                undo.setTaskContent(rs.getString("taskcontent"));
                undo.setStartTime(rs.getString("starttime"));
                undo.setEndTime(rs.getString("endtime"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return undo;
    }

    @Override
    public ArrayList<Undo> selectAllUndo() {
        DBConnection dbConn = new DBConnection();
        conn = dbConn.getConn();
        ArrayList<Undo> undoList = new ArrayList<>();
        Undo undo;
        String sql = "select * from undo1";
        try {
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()){
                undo = new Undo();
                undo.setId(rs.getInt("id"));
                undo.setEmployeeId(rs.getInt("employeeid"));
                undo.setTaskContent(rs.getString("taskcontent"));
                undo.setIfAdmin(rs.getInt("ifadmin"));
                undo.setStartTime(rs.getString("starttime"));
                undo.setEndTime(rs.getString("endtime"));
                undoList.add(undo);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return undoList;
    }
}
