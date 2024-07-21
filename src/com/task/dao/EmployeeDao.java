package com.task.dao;

import com.task.vo.Announce;
import com.task.vo.Employee;
import com.task.vo.Salary;
import com.task.vo.Undo;

import java.util.ArrayList;

public interface EmployeeDao {
    public String employeeLogin(int id, String password);
    public ArrayList<Announce> selectAnnounce();//查询公告
    public Employee employeeSelectById(int id);
    public ArrayList<Undo> selectUndo(int id, int ifAdmin);
    public boolean deleteUndo(int id);
    public Salary selectSalary(int id,int ifAdmin);
    public boolean addSalary(Salary salary);
    public boolean deleteSalary(int id,int ifAdmin);
    public boolean updateSalary(Salary salary);


}
