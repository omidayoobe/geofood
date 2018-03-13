package com.example.ioptyu2.qrtest;

import android.app.Application;

    //this class is for storing runtime variables such as ID and the type of user for the sake of being used to know what things to show on screen.

public class MyApplication extends Application {
    private static int ID;
    private String userType = "guest";

    public static int getID(){
        return ID;
    }
    public String getUserType(){
        return userType;
    }

    public void setID(int id){
        this.ID = id;
    }
    public void setUserType(String _userType){
        this.userType = _userType;
    }
}
