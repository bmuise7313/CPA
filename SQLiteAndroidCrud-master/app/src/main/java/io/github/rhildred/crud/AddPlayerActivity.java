package io.github.rhildred.crud;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class AddPlayerActivity extends AppCompatActivity {
    private EditText oNameEdit;
    private Button oNameInsert;
    private TextView oTxtView;
    private PlayerDB db;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_player);
        db = new PlayerDB(this);
        oNameEdit = (EditText) findViewById(R.id.txtName);
        oNameInsert = (Button) findViewById(R.id.btnInsert);
        oTxtView = (TextView) findViewById(R.id.txtNewName);
    }
    protected void onClick(View v){
        if(v.getId() == R.id.btnInsert){
            String sNewPlayer = oNameEdit.getText().toString();
            try {
                db.insertPlayer(sNewPlayer);
                oNameEdit.setText("");
                oTxtView.setText("Player " + sNewPlayer + " added!");
            }
            catch(Exception e){
                e.printStackTrace();
            }
        }
    }
}
