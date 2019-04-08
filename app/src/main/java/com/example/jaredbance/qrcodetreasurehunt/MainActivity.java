package com.example.jaredbance.qrcodetreasurehunt;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Switch;

import java.util.concurrent.ExecutionException;


public class MainActivity extends AppCompatActivity {

    private Button loginButton;
    private EditText usernameEt;
    private EditText passwordEt;
    private Switch adminSwitch;
    public String username;
    public String password;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.loginscreen);

        usernameEt = (EditText) findViewById(R.id.usernameTextBox);
        passwordEt = (EditText) findViewById(R.id.passwordTextBox);
        adminSwitch = (Switch) findViewById(R.id.adminSwitch);

       //loginButton = (Button) findViewById(R.id.loginButton);
        //loginButton.setOnClickListener(new View.OnClickListener() {
            //@Override
            //public void onClick(View view) {
                //
                // DO LOGIN VERIFICATION
                //

                //startActivity(new Intent(MainActivity.this, HomeScreen.class));

            //}
        //});


    }

    // Called when login button is clicked
    public void OnLogin(View view) {

        if (adminSwitch.isChecked()){ // sign in as admin
            String username = usernameEt.getText().toString();
            String password = passwordEt.getText().toString();
            String type = "adminLogin";
            BackgroundWorker backgroundWorker = new BackgroundWorker(this);
            backgroundWorker.execute(type, username, password);

            String results = "";
            try {
                results = backgroundWorker.get();
                System.out.println(results);
            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (ExecutionException e) {
                e.printStackTrace();
            }

            if (results != null) {
                if (results.equals("admin login success")) {
                    //startActivity(new Intent(MainActivity.this, HomeScreen.class));
                    Intent intent = new Intent(MainActivity.this, AdminHomeScreen.class);
                    intent.putExtra("username", username);
                    intent.putExtra("password", password);
                    startActivity(intent);
                } else {
                    AlertDialog alertDialog;
                    alertDialog = new AlertDialog.Builder(this).create();
                    alertDialog.setTitle("Admin Login Status");
                    alertDialog.setMessage(results);
                    alertDialog.show();
                }
            }
        }
        else {
            String username = usernameEt.getText().toString();
            String password = passwordEt.getText().toString();
            String type = "login";
            BackgroundWorker backgroundWorker = new BackgroundWorker(this);
            backgroundWorker.execute(type, username, password);

            String results = "";
            try {
                results = backgroundWorker.get();
                System.out.println(results);
            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (ExecutionException e) {
                e.printStackTrace();
            }

            if (results != null) {
                if (results.equals("login success")) {
                    //startActivity(new Intent(MainActivity.this, HomeScreen.class));
                    Intent intent = new Intent(MainActivity.this, HomeScreen.class);
                    intent.putExtra("username", username);
                    intent.putExtra("password", password);
                    startActivity(intent);
                } else {
                    AlertDialog alertDialog;
                    alertDialog = new AlertDialog.Builder(this).create();
                    alertDialog.setTitle("Login Status");
                    alertDialog.setMessage(results);
                    alertDialog.show();
                }
            }
        }
    }

    // Called when register button is clicked
    public void OnRegister(View view) {
        String username = usernameEt.getText().toString();
        String password = passwordEt.getText().toString();

        if (username.equals("") | password.equals("")){
            return;
        }

        String type = "register";
        BackgroundWorker backgroundWorker = new BackgroundWorker(this);
        backgroundWorker.execute(type, username, password);

        String results = "";
        try {
            results = backgroundWorker.get();
            System.out.println(results);
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }

        if (results != null) {
            AlertDialog alertDialog;
            alertDialog = new AlertDialog.Builder(this).create();
            alertDialog.setTitle("Register Status");
            alertDialog.setMessage(results);
            alertDialog.show();
        }
    }


}
