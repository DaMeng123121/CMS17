package com.task.vo;

import java.security.PrivateKey;

public class Announce {
    private Integer id;
    private String content;
    private String time;
    private String publisher;
    public Announce(Integer id, String content, String time, String publisher){
        this.id=id;
        this.content=content;
        this.time=time;
        this.publisher=publisher;
    }
    public Announce(){}


    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }
}
