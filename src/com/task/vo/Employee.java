package com.task.vo;


public class Employee {
    private Integer id;
    private String name;
    private String password;
    private Integer age;
    private String sex;
    private String tel;
    private String email;
    private String address;
    private String dept;
    private String job;
    private Integer ifon;
    public Employee(int id,String name, String password, int age, String sex, String tel, String email, String address, String dept, String job, int ifon){
        this.id=id;
        this.name=name;
        this.password=password;
        this.age=age;
        this.sex=sex;
        this.tel=tel;
        this.email=email;
        this.address=address;
        this.dept=dept;
        this.job=job;
        this.ifon=ifon;
    }
    public Employee(){}
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public int getIfon() {
        return ifon;
    }

    public void setIfon(int ifon) {
        this.ifon = ifon;
    }
}
