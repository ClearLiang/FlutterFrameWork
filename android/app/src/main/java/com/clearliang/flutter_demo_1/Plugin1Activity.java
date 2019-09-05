package com.clearliang.flutter_demo_1;

import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

/**
 * Created by ClearLiang on 2019/5/29
 * <p>
 * Function :
 */
public class Plugin1Activity extends AppCompatActivity {
    private TextView tv1;
    private Button btn1;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_plugin1);
        initView();
    }

    private void initView() {
        tv1 = (TextView) findViewById(R.id.tv_1);
        btn1 = (Button) findViewById(R.id.btn_1);

        btn1.setOnClickListener(v -> {
            Toast.makeText(Plugin1Activity.this, "Toast提示", Toast.LENGTH_LONG).show();
            startActivity(new Intent(Plugin1Activity.this, MainActivity.class));
        });
    }
}
