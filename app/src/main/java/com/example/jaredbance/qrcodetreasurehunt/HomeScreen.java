package com.example.jaredbance.qrcodetreasurehunt;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.Html;
import android.view.View;
import android.widget.TextView;

import java.util.concurrent.ExecutionException;

public class HomeScreen extends AppCompatActivity {

    String username;
    String password;
    TextView playerDataTV;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home_sreen);

        playerDataTV = (TextView) findViewById(R.id.homeScreenTextView);

        Bundle bundle = getIntent().getExtras();
        username = bundle.getString("username");
        password = bundle.getString("password");

        updatePlayerDetails();

    }

    @Override
    public void onResume(){
        super.onResume();
        updatePlayerDetails();
    }

    private void updatePlayerDetails() {
        String type = "getPlayerData";
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

        playerDataTV.setText(Html.fromHtml(results));

    }

    public void scan(View view){

        Intent intent = new Intent(HomeScreen.this, scanController.class);
        intent.putExtra("username", username);
        intent.putExtra("password", password);
        startActivity(intent);

        //startActivity(new Intent(HomeScreen.this, scanController.class));
    }

    public void globalLeaderBoard(View view) {
        startActivity(new Intent(HomeScreen.this, globalLeaderBoard.class));
    }



    public void friendsLeaderboard(View view) {
        Intent intent = new Intent(HomeScreen.this, friendsLeaderboard.class);
        intent.putExtra("username", username);
        startActivity(intent);
    }

    public void teamsLeaderboard(View view) {
        startActivity(new Intent(HomeScreen.this, teamLeaderboard.class));
    }

    public void yourTeam(View view) {
        Intent intent = new Intent(HomeScreen.this, yourTeam.class);
        intent.putExtra("username", username);
        startActivity(intent);
    }
}
