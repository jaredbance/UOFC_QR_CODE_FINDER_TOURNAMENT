package com.example.jaredbance.qrcodetreasurehunt;

import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;

import java.util.concurrent.ExecutionException;

public class AdminHomeScreen extends AppCompatActivity {

    private EditText codeET;
    private EditText valueET;
    private EditText playerET;
    private String username;
    private String password;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_admin_home_screen);

        Bundle bundle = getIntent().getExtras();
        username = bundle.getString("username");
        password = bundle.getString("password");

        codeET = findViewById(R.id.codeEditText);
        valueET = findViewById(R.id.valueEditText);
        playerET = findViewById(R.id.playerEditText);
    }

    public void createCode(View view) {
        String code = codeET.getText().toString();
        String value = valueET.getText().toString();
        if (code.equals("") | value.equals("")){
            return;
        }

        String type = "createCode";
        BackgroundWorker backgroundWorker = new BackgroundWorker(this);
        backgroundWorker.execute(type, code, value, username);

        String results = "";
        try {
            results = backgroundWorker.get();
            System.out.println(results);
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }

        AlertDialog alertDialog;
        alertDialog = new AlertDialog.Builder(this).create();
        alertDialog.setTitle("Code Creation Status");
        alertDialog.setMessage(results);
        alertDialog.show();
    }


    public void deleteCode(View view) {
        String code = codeET.getText().toString();
        if (code.equals("")){
            return;
        }

        String type = "deleteCode";
        BackgroundWorker backgroundWorker = new BackgroundWorker(this);
        backgroundWorker.execute(type, code);

        String results = "";
        try {
            results = backgroundWorker.get();
            System.out.println(results);
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }

        AlertDialog alertDialog;
        alertDialog = new AlertDialog.Builder(this).create();
        alertDialog.setTitle("Code Deletion Status");
        alertDialog.setMessage(results);
        alertDialog.show();
    }

    public void deletePlayer(View view) {
        String player = playerET.getText().toString();
        if (player.equals("")){
            return;
        }

        String type = "deletePlayer";
        BackgroundWorker backgroundWorker = new BackgroundWorker(this);
        backgroundWorker.execute(type, player);

        String results = "";
        try {
            results = backgroundWorker.get();
            System.out.println(results);
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }

        AlertDialog alertDialog;
        alertDialog = new AlertDialog.Builder(this).create();
        alertDialog.setTitle("Player Deletion Status");
        alertDialog.setMessage(results);
        alertDialog.show();
    }
}
