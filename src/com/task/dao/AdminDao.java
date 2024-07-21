package com.task.dao;

import com.task.vo.Admin;
import com.task.vo.Announce;
import com.task.vo.Employee;
import com.task.vo.Undo;

import java.util.ArrayList;

public interface AdminDao {
    public String adminLogin(int id, String password);
    public Admin adminSelectById(int id);
    public boolean updateAdmin(Admin admin);
    public boolean adminToEmployee(Admin admin);
    public boolean deleteAdmin(int id);
    public boolean addAdmin(Admin admin);
    public ArrayList<Admin> selectAllAdmin(int level);
    public boolean adminAddAnnounce(String content, String time, String publisher);
    public boolean adminDeleteAnnounce(int id);//删除公告
    public boolean adminUpdateAnnounce(Announce announce);
    public Announce selectAnnounceById(int id);
    public ArrayList<Employee> selectAllEmployee();
    public boolean deleteEmployeeById(int id);
    public boolean addEmployee(Employee employee);
    public boolean updateEmployee(Employee employee);
    public boolean addUndo(Undo undo);
    public boolean updateUndo(Undo undo);
    public Undo selectUndoById(int id);
    public ArrayList<Undo> selectAllUndo();

}
