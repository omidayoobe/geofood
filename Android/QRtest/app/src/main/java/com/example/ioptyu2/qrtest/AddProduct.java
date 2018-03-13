package com.example.ioptyu2.qrtest;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;

public class AddProduct extends AppCompatActivity {
    EditText productName, quantity, type, source, target;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_addproduct);
        setTitle("Add Product");
        productName = (EditText)findViewById(R.id.productNameR);
        quantity = (EditText)findViewById(R.id.quantityR);
        type = (EditText)findViewById(R.id.typeR);
        source = (EditText)findViewById(R.id.sourceR);
        target = (EditText)findViewById(R.id.targetR);
    }

    public void onAddProduct(View v){
        String str_productName = productName.getText().toString();
        String str_quantity = quantity.getText().toString();
        String str_type = type.getText().toString();
        String str_source = source.getText().toString();
        String str_target = target.getText().toString();
        String type = "addProduct";
    }
}
