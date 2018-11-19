package com.pcassem.www.huaweithyj.main;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import com.pcassem.www.huaweithyj.R;
import com.pcassem.www.huaweithyj.news.widget.NewsFragment;
import com.pcassem.www.huaweithyj.personal.widget.PersonalFragment;
import com.pcassem.www.huaweithyj.view.BottomBar;
import com.pcassem.www.huaweithyj.work.widget.WorkFragment;

public class MainActivity extends AppCompatActivity {

    private BottomBar mBottomBar;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        initView();

        initBottomBar();
    }

    private void initView(){
        mBottomBar = findViewById(R.id.bottom_bar);
    }

    private void initBottomBar(){
        mBottomBar.setContainer(R.id.fl_container)
                .setTitleBeforeAndAfterColor("#A4A5A8", "#4590E9")
                .addItem(NewsFragment.class,
                        "消息",
                        R.mipmap.item1_before,
                        R.mipmap.item1_after)
                .addItem(WorkFragment.class,
                        "办公",
                        R.mipmap.item2_before,
                        R.mipmap.item2_after)
                .addItem(PersonalFragment.class,
                        "我的",
                        R.mipmap.item3_before,
                        R.mipmap.item3_after)
                .build();
    }
}
