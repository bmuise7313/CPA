package io.github.rhildred.crud;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class HomeActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);
        Button btnStart = (Button) findViewById(R.id.btnStartGame);
        Button btnScoreBoard = (Button) findViewById(R.id.btnScoreBoard);
        Button btnSelectPlayer1 = (Button) findViewById(R.id.btnSelect1);
        Button btnSelectPlayer2 = (Button) findViewById(R.id.btnSelect2);
        Button btnAdd = (Button) findViewById(R.id.btnAddPlayer);

        btnStart.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(HomeActivity.this, gameEmulatorActivity.class));
            }
        });

        btnScoreBoard.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(HomeActivity.this, ScoreBoardActivity.class));
            }
        });
        btnSelectPlayer1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(HomeActivity.this, SelectPlayer1Activity.class));
            }
        });
        btnSelectPlayer2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(HomeActivity.this, SelectPlayer2Activity.class));
            }
        });
        btnAdd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(HomeActivity.this, AddPlayerActivity.class));
            }
        });

    }
}
