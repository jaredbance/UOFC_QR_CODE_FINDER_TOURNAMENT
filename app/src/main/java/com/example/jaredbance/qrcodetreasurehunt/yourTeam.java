package com.example.jaredbance.qrcodetreasurehunt;

import android.os.Bundle;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.text.Html;
import android.view.Gravity;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

import java.util.concurrent.ExecutionException;

public class yourTeam extends AppCompatActivity {

    private TextView yourTeamTV;
    private String username;
    private EditText teamET;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_your_team);

        yourTeamTV = (TextView) findViewById(R.id.yourTeamTextView);
        teamET = (EditText) findViewById(R.id.teamEditText);

        Bundle bundle = getIntent().getExtras();
        username = bundle.getString("username");

        setUpYourTeam();
    }

    private void setUpYourTeam() {
        String type = "getTeam";
        BackgroundWorker backgroundWorker = new BackgroundWorker(this);
        backgroundWorker.execute(type, username);

        String results = "";
        try {
            results = backgroundWorker.get();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }

        yourTeamTV.setTextSize(20);
        yourTeamTV.setGravity(Gravity.CENTER);
        yourTeamTV.setText(Html.fromHtml(results));
    }

    public void leaveTeam(View view) {
        String type = "leaveTeam";
        BackgroundWorker backgroundWorker = new BackgroundWorker(this);
        backgroundWorker.execute(type, username);

        setUpYourTeam();
    }

    public void joinTeam(View view) {
        String team = String.valueOf(teamET.getText());
        String type = "joinTeam";
        BackgroundWorker backgroundWorker = new BackgroundWorker(this);
        backgroundWorker.execute(type, username, team);


        String results = "";
        try {
            results = backgroundWorker.get();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }

        AlertDialog alertDialog;
        alertDialog = new AlertDialog.Builder(this).create();
        alertDialog.setTitle("Join Status:");
        alertDialog.setMessage(results);
        alertDialog.show();

        setUpYourTeam();
    }

    public void createTeam(View view) {
        String team = String.valueOf(teamET.getText());
        String type = "createTeam";
        BackgroundWorker backgroundWorker = new BackgroundWorker(this);
        backgroundWorker.execute(type, username, team);

        String results = "";
        try {
            results = backgroundWorker.get();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }

        AlertDialog alertDialog;
        alertDialog = new AlertDialog.Builder(this).create();
        alertDialog.setTitle("Team Creation Status:");
        alertDialog.setMessage(results);
        alertDialog.show();

        setUpYourTeam();

    }
}
