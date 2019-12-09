package com.sparkerz.pakfarmers.fragments.sellfragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.sparkerz.pakfarmers.R;
import com.sparkerz.pakfarmers.fragments.sellfragment.SellAdFragment.OnListFragmentInteractionListener;
import com.sparkerz.pakfarmers.fragments.sellfragment.dummy.DummyContent.DummyItem;

import java.util.List;

import androidx.recyclerview.widget.RecyclerView;

/**
 * {@link RecyclerView.Adapter} that can display a {@link DummyItem} and makes a call to the
 * specified {@link OnListFragmentInteractionListener}.
 * TODO: Replace the implementation with code for your data type.
 */
public class MySellAdRecyclerViewAdapter extends RecyclerView.Adapter<MySellAdRecyclerViewAdapter.ViewHolder> {

    private final List<DummyItem> mValues;
    private final OnListFragmentInteractionListener mListener;

    public MySellAdRecyclerViewAdapter(List<DummyItem> items, OnListFragmentInteractionListener listener) {
        mValues = items;
        mListener = listener;
    }

    @Override
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.fragment_sellad, parent, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(final ViewHolder holder, int position) {
        holder.mItem = mValues.get(position);
        holder.txtBrokerName.setText("Asim Nadeem");
        holder.txtPhoneNumber.setText("0300-1234567");

        holder.mView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (null != mListener) {
                    // Notify the active callbacks interface (the activity, if the
                    // fragment is attached to one) that an item has been selected.
                    mListener.onListFragmentInteraction(holder.mItem);
                }
            }
        });
    }

    @Override
    public int getItemCount() {
        return mValues.size();
    }

    public class ViewHolder extends RecyclerView.ViewHolder {
        public final View mView;
        public final TextView txtBrokerName;
        public final TextView txtPhoneNumber;
        public DummyItem mItem;

        public ViewHolder(View view) {
            super(view);
            mView = view;
            txtBrokerName = view.findViewById(R.id.txtBrokerName);
            txtPhoneNumber = view.findViewById(R.id.txtBrokerPhoneNumber);
        }

        @Override
        public String toString() {
            return super.toString() + " '" + txtBrokerName.getText() + "'";
        }
    }
}
