package com.example.ioptyu2.qrtest;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Button;

public class login extends AppCompatActivity {

    Button toRegister;

        float x1,x2,y1,y2;

        @Override
        protected void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            setContentView(R.layout.activity_login);
            setTitle("login");
        }

        @Override
        public void finish() {
            super.finish();
            overridePendingTransition(R.anim.slide_in_right,R.anim.slide_out_left);
        }
        public boolean onTouchEvent(MotionEvent event){
            switch(event.getAction()){
                case MotionEvent.ACTION_DOWN:
                    x1 = event.getX();
                    y1 = event.getY();
                    break;
                case MotionEvent.ACTION_UP:
                    x2 = event.getX();
                    y2 = event.getY();
                    if(x1 < x2){
                        swipeToCamera();
                    }
                    break;
            }
            return false;
        }
        public void swipeToCamera(){
            Intent i = new Intent(this, MainActivity.class);
            startActivity(i);
            overridePendingTransition(R.anim.slide_in_left, R.anim.slide_out_right);
        }
        public void buttonToCamera(View v){
            Intent i = new Intent(this, MainActivity.class);
            startActivity(i);
            overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left);
        }

//        public void buttonToRegister(View v){
//            Intent i = new Intent(this, register.class);
//            startActivity(i);
//        }


    }
