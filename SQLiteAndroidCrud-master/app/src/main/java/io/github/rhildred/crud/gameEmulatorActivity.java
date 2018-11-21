package io.github.rhildred.crud;

import android.content.ContentValues;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;

public class gameEmulatorActivity extends AppCompatActivity {
    private TextView player1Text;
    private TextView player2Text;
    private Button player1Button;
    private Button player2Button;
    private Button btnTie;
    private String selectedPlayer1;
    private String selectedPlayer2;
    private int ID1;
    private int ID2;
    private PlayerDB db;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_game_emulator);
        player1Text = (TextView) findViewById(R.id.txtPlayer1);
        player2Text = (TextView) findViewById(R.id.txtPlayer2);
        Bundle intentExtras = getIntent().getExtras();
        if( intentExtras !=null)
        {
            selectedPlayer1 = intentExtras.getString("player1");
            selectedPlayer2 = getIntent().getExtras().getString("player2");
        }
        System.out.println("Chosen Name = : " + selectedPlayer1);
            player1Text.setText(selectedPlayer1);
            player2Text.setText(selectedPlayer2);
            //The key argument here must match that used in the other activity
        btnTie = (Button) findViewById(R.id.btnTie);

    }
    protected void onClickPlay1(){
        String sName = selectedPlayer1;
        try {
            db.player1Wins(sName);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
