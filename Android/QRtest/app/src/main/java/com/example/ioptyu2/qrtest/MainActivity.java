package com.example.ioptyu2.qrtest;

import android.*;
import android.Manifest;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.support.annotation.NonNull;
import android.support.v4.app.ActivityCompat;
import android.support.v4.view.GestureDetectorCompat;
import android.support.v7.app.ActionBar;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.util.SparseArray;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.gms.vision.CameraSource;
import com.google.android.gms.vision.Detector;
import com.google.android.gms.vision.barcode.Barcode;
import com.google.android.gms.vision.barcode.BarcodeDetector;

import java.io.IOException;

public class MainActivity extends AppCompatActivity {
    float x1,x2,y1,y2;

    //DatabaseHelper db;
    EditText e1,e2,e3;
    Button b1;



    SurfaceView cameraPreview;
    TextView txtResult;
    BarcodeDetector barcodeDetector;
    CameraSource cameraSource;
    final int RequestCameraPermissionID = 1001;

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        switch (requestCode) {
            case RequestCameraPermissionID: {
                if (grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    if (ActivityCompat.checkSelfPermission(this, Manifest.permission.CAMERA) != PackageManager.PERMISSION_GRANTED) {
                         return;
                    }
                    try {
                        cameraSource.start(cameraPreview.getHolder());
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
            break;
        }
    }



    @Override
    public void finish() {
        super.finish();
        overridePendingTransition(R.anim.slide_in_left,R.anim.slide_out_right);


    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

//        db = new DatabaseHelper(this);
//
//        e1 = (EditText) findViewById(R.id.emailR);
//        e2 = (EditText) findViewById(R.id.passwordR);
//        e3 = (EditText) findViewById(R.id.confPassR);
//        b1 = (Button) findViewById(R.id.register_btn);





        cameraPreview = (SurfaceView)findViewById(R.id.cameraPreview);
        txtResult = (TextView)findViewById(R.id.txtResult);

        barcodeDetector = new BarcodeDetector.Builder(this)
                .setBarcodeFormats(Barcode.QR_CODE)
                .build();
        cameraSource = new CameraSource
                .Builder(this,barcodeDetector)
                .setRequestedPreviewSize(640,480)
                .build();
        cameraPreview.getHolder().addCallback(new SurfaceHolder.Callback() {
            @Override
            public void surfaceCreated(SurfaceHolder surfaceHolder) {
                if(ActivityCompat.checkSelfPermission(getApplicationContext(), android.Manifest.permission.CAMERA)!= PackageManager.PERMISSION_GRANTED) {
                    ActivityCompat.requestPermissions(MainActivity.this,
                            new String[]{Manifest.permission.CAMERA}, RequestCameraPermissionID);
                    return;
                }
                try {
                    cameraSource.start(cameraPreview.getHolder());
                } catch(IOException e){
                    e.printStackTrace();
                }
            }

            @Override
            public void surfaceChanged(SurfaceHolder surfaceHolder, int i, int i1, int i2) {

            }

            @Override
            public void surfaceDestroyed(SurfaceHolder surfaceHolder) {
                cameraSource.stop();

            }
        });
//        //for the database
//        b1.setOnClickListener(new View.OnClickListener() {
//
//            @Override
//            public void onClick(View v){
//                String s1 = e1.getText().toString();
//                String s2 = e2.getText().toString();
//                String s3 = e3.getText().toString();
//                if(s1.equals("")||s2.equals("")||s3.equals("")){
//                    Toast.makeText(getApplicationContext(),"Fill the fields you farmer",Toast.LENGTH_SHORT).show();
//                }else{
//                    if(s2.equals(s3)){
//                        Boolean checkEmail = db.checkEmail(s1);
//                        if(checkEmail == true){
//                            Boolean insert = db.insert(s1,s2);
//                            if(insert== true){
//                                Toast.makeText(getApplicationContext(),"You are among the greenyz!",Toast.LENGTH_SHORT).show();
//                            }
//                        }
//                        else{
//                            Toast.makeText(getApplicationContext(),"Wake up you are already among us", Toast.LENGTH_SHORT).show();
//                        }
//                    }
//                    Toast.makeText(getApplicationContext(),"Wrong password, not enough veggies mate!",Toast.LENGTH_SHORT).show();
//                }
//            }
//        });//end database

        barcodeDetector.setProcessor(new Detector.Processor<Barcode>(){
            @Override
            public void release(){
            }

            @Override
            public void receiveDetections(Detector.Detections<Barcode> detections) {
                final SparseArray<Barcode> qrcodes = detections.getDetectedItems();
                if (qrcodes.size() != 0) {
                    txtResult.post(new Runnable() {
                        @Override
                        public void run() {
                            txtResult.setText(qrcodes.valueAt(qrcodes.size()-1).displayValue);
                        }
                    });
                }
            }
        });
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
                    swipeToOptions();
                }else{
                    swipeToLogin();
                }
                break;
        }
        return false;
    }
    public void swipeToLogin(){
        Intent i = new Intent(this, login.class);
        startActivity(i);
        overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left);
    }

//    public void buttonToRegister(){
//        Intent i = new Intent(this, register.class);
//        startActivity(i);
//    }

    public void swipeToOptions(){
        Intent i = new Intent(this, menu.class);
        startActivity(i);
        overridePendingTransition(R.anim.slide_in_left, R.anim.slide_out_right);
    }
    public void buttonToOptions(View v){
        Intent i = new Intent(this, menu.class);
        startActivity(i);
        overridePendingTransition(R.anim.slide_in_left, R.anim.slide_out_right);
    }


}
