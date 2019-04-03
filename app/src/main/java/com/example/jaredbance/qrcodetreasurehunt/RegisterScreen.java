package com.example.jaredbance.qrcodetreasurehunt;

import android.os.Bundle;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class RegisterScreen extends AppCompatActivity {


    private Button submitButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.registerscreen);




        submitButton = (Button) findViewById(R.id.submitButton);
        submitButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                //
                //Need to check that username is unique 
                //

                startActivity(new Intent(RegisterScreen.this, HomeScreen.class));

            }
        });
    }
}
