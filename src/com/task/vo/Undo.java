package com.task.vo;

public class Undo {
    private Integer id;
    private String taskContent;
    private String startTime;
    private String endTime;
    private Integer ifAdmin;
    private Integer employeeId;

    public Undo(int id, String tackContent, String startTime, String endTime, Integer ifAdmin,Integer employeeId) {
        this.id = id;
        this.taskContent = tackContent;
        this.startTime = startTime;
        this.endTime = endTime;
        this.ifAdmin = ifAdmin;
        this.employeeId=employeeId;
    }

    public Undo() {
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTaskContent() {
        return taskContent;
    }

    public void setTaskContent(String taskContent) {
        this.taskContent = taskContent;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public Integer getIfAdmin() {
        return ifAdmin;
    }

    public void setIfAdmin(Integer ifAdmin) {
        this.ifAdmin = ifAdmin;
    }

    public Integer getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Integer employeeId) {
        this.employeeId = employeeId;
    }
}


