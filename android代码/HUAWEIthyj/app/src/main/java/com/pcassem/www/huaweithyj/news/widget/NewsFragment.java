package com.pcassem.www.huaweithyj.news.widget;


import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v7.widget.DividerItemDecoration;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.pcassem.www.huaweithyj.R;
import com.pcassem.www.huaweithyj.adapter.NewsAdapter;
import com.pcassem.www.huaweithyj.news.SearchActivity;

import java.util.ArrayList;
import java.util.List;

import static android.content.ContentValues.TAG;

public class NewsFragment extends Fragment implements View.OnClickListener {

    private ImageView ivLogo;
    private TextView tvTitle;
    private Toolbar mToolbar;
    private ImageView mSearch;
    private RecyclerView mRecyclerView;
    private NewsAdapter mNewsAdapter;
    private List<String> mData;
    private SwipeRefreshLayout mSwipeRefreshLayout;


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_news,container,false);

        initView(view);
        initEvent();
        return view;
    }

    private void initView(View view){

        ivLogo = view.findViewById(R.id.logo);
        tvTitle = view.findViewById(R.id.toolbar_title);
        mSearch = view.findViewById(R.id.search);

        mToolbar = view.findViewById(R.id.my_toolbar);

        mRecyclerView = view.findViewById(R.id.recycler_view);
        mRecyclerView.setHasFixedSize(true);
        mRecyclerView.setLayoutManager(new LinearLayoutManager(getContext()));
        mRecyclerView.addItemDecoration(new DividerItemDecoration(getContext(),DividerItemDecoration.VERTICAL));
        mData = new ArrayList<String>();
        mData.add("中南大学");
        mData.add("中南大学");
        mData.add("中南大学");
        mData.add("中南大学");
        mNewsAdapter = new NewsAdapter(getContext(),mData);
        mRecyclerView.setAdapter(mNewsAdapter);
    }

    private void initEvent(){
        mSearch.setOnClickListener(this);
    }

    @Override
    public void onClick(View view) {
        switch (view.getId()){
            case R.id.search:
                Intent intent = new Intent(getActivity(),SearchActivity.class);
                startActivity(intent);
                break;
        }
    }
}

