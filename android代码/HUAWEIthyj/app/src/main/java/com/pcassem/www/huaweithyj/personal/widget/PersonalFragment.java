package com.pcassem.www.huaweithyj.personal.widget;


import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.pcassem.www.huaweithyj.R;

public class PersonalFragment extends Fragment {


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_personal,container,false);
        initView(view);
        return view;
    }

    private void initView(View view){
    }

}
