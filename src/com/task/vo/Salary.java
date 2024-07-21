package com.task.vo;

public class Salary {
    private Integer month;
    private Integer employeeId;
    private String name;
    private Integer ifAdmin;
    private Integer baseSalary;
    private Integer fullWork;
    private Integer overTime;
    private Integer salarySum;
    public Salary(Integer month,Integer employeeId,String name,Integer ifAdmin,Integer baseSalary,Integer fullWork,Integer overTime, Integer salarySum){
        this.month=month;
        this.employeeId=employeeId;
        this.name=name;
        this.ifAdmin=ifAdmin;
        this.baseSalary=baseSalary;
        this.fullWork=fullWork;
        this.overTime=overTime;
        this.salarySum=salarySum;
    }
    public Salary(){}

    public Integer getMonth() {
        return month;
    }

    public void setMonth(Integer month) {
        this.month = month;
    }

    public Integer getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Integer employeeId) {
        this.employeeId = employeeId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getIfAdmin() {
        return ifAdmin;
    }

    public void setIfAdmin(Integer ifAdmin) {
        this.ifAdmin = ifAdmin;
    }

    public Integer getBaseSalary() {
        return baseSalary;
    }

    public void setBaseSalary(Integer baseSalary) {
        this.baseSalary = baseSalary;
    }

    public Integer getFullWork() {
        return fullWork;
    }

    public void setFullWork(Integer fullWork) {
        this.fullWork = fullWork;
    }

    public Integer getOverTime() {
        return overTime;
    }

    public void setOverTime(Integer overTime) {
        this.overTime = overTime;
    }

    public Integer getSalarySum() {
        return salarySum;
    }

    public void setSalarySum(Integer salarySum) {
        this.salarySum = salarySum;
    }
}
