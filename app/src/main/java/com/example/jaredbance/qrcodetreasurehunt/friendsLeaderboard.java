package com.example.jaredbance.qrcodetreasurehunt;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.text.Html;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

import java.util.concurrent.ExecutionException;

public class friendsLeaderboard extends AppCompatActivity {


    private TextView friendsLeaderBoardTV;
    private EditText friendText;
    String username;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_friends_leaderboard);

        Bundle bundle = getIntent().getExtras();
        username = bundle.getString("username");

        friendsLeaderBoardTV = (TextView) findViewById(R.id.friendsLeaderboardTextView);
        friendText = (EditText) findViewById(R.id.friendText);
        setUpFriendsLeaderboard();
    }

    private void setUpFriendsLeaderboard() {
        String type = "getFriendsLeaderboard";
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

        friendsLeaderBoardTV.setText(Html.fromHtml(results));
    }


    public void addFriend(View view) {

        String friend = String.valueOf(friendText.getText());

        String type = "addFriend";
        BackgroundWorker backgroundWorker = new BackgroundWorker(this);
        backgroundWorker.execute(type, username, friend);

        setUpFriendsLeaderboard();

    }
}
