package com.example.ioptyu2.qrtest;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;

public class register extends AppCompatActivity {
    EditText username, password, confirmPassword, email;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);
        setTitle("Register");
        username = (EditText)findViewById(R.id.usernameR);
        password = (EditText)findViewById(R.id.passwordR);
        confirmPassword = (EditText)findViewById(R.id.confPassR);
        email = (EditText)findViewById(R.id.emailR);
    }
    public void returnToLogin(View v){
        Intent i = new Intent(this, login.class);
        startActivity(i);
    }
    public void onRegister(View v){
        String str_username = username.getText().toString();
        String str_password = password.getText().toString();
        String str_confirmPassword = confirmPassword.getText().toString();
        String str_email = email.getText().toString();
        String type = "register";
        if(str_password.equals(str_confirmPassword)) {
            BackgroundWorker backgroundWorker = new BackgroundWorker(this);
            backgroundWorker.execute(type, str_username, str_password, str_email);
        }
    }
}
