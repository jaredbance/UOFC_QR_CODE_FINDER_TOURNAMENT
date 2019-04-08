package com.example.jaredbance.qrcodetreasurehunt;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.text.Html;
import android.widget.TextView;

import java.util.concurrent.ExecutionException;

public class globalLeaderBoard extends AppCompatActivity {

    private TextView globalLeaderBoardTV;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_global_leader_board);

        globalLeaderBoardTV = (TextView) findViewById(R.id.globalLeaderboardTextView);
        setUpGlobalLeaderBoard();

    }

    private void setUpGlobalLeaderBoard() {
        String type = "getGlobalLeaderboard";
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

        globalLeaderBoardTV.setText(Html.fromHtml(results));


    }




}
