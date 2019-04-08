package com.example.jaredbance.qrcodetreasurehunt;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.Html;
import android.widget.TextView;

import java.util.concurrent.ExecutionException;

public class teamLeaderboard extends AppCompatActivity {

    private TextView teamsLeaderBoardTV;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_team_leaderboard);

        teamsLeaderBoardTV = (TextView) findViewById(R.id.teamsLeaderboardTextView);
        setUpTeamsLeaderBoard();
    }

    private void setUpTeamsLeaderBoard() {
        String type = "getTeamsLeaderboard";
        BackgroundWorker backgroundWorker = new BackgroundWorker(this);
        backgroundWorker.execute(type);

        String results = "";
        try {
            results = backgroundWorker.get();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }

        teamsLeaderBoardTV.setText(Html.fromHtml(results));


    }
}
