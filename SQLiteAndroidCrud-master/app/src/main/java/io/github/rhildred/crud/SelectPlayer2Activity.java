package io.github.rhildred.crud;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.HashMap;

public class SelectPlayer2Activity extends AppCompatActivity {
    private ListView itemsListView;
    private PlayerDB db;
    Intent intent = new Intent(this, gameEmulatorActivity.class);
    private static final String TAG = SelectPlayer2Activity.class.getSimpleName();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_select_player2);
        itemsListView = (ListView) findViewById(R.id.lstPlayers);
        itemsListView.setOnItemClickListener(new AdapterView.OnItemClickListener() {

            public void onItemClick(AdapterView<?> parent, View view,
                                    int position, long id) {
                TextView textView = (TextView) view.findViewById(R.id.list_content);
                String text = itemsListView.getItemAtPosition(position).toString().trim();
                String segments[] = text.split(",");
                String name = segments[2];
                String segments2[] = name.split("=");
                String name2 = segments2[1];
                intent.putExtra("player2", name2);
                System.out.println("Chosen Name = : " + intent.getStringExtra("player2"));
                startActivity(intent);

            }});

        db = new PlayerDB(this);
        updateDisplay();
    }



    private void updateDisplay() {
        // create a List of Map<String, ?> objects
        ArrayList<HashMap<String, String>> data = db.getPlayers();

        // create the resource, from, and to variables
        int resource = R.layout.listview_item;
        String[] from = {"name", "wins", "losses", "ties"};
        int[] to = {R.id.nameTextView, R.id.winsTextView, R.id.lossesTextView, R.id.tiesTextView};

        // create and set the adapter
        SimpleAdapter adapter =
                new SimpleAdapter(this, data, resource, from, to);
        itemsListView.setAdapter(adapter);

    }
}
