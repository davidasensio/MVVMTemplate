<?xml version="1.0" encoding="utf-8"?>
<android.support.v4.widget.SwipeRefreshLayout
    xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/${classNameLowercase}SwipeLayout"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context="${packageName}.${className}Activity">

    <android.support.constraint.ConstraintLayout
        android:layout_width="match_parent"
        android:layout_height="match_parent">

        <TextView
            android:id="@+id/titleTextView"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_marginTop="30dp"
            android:text="List"
            android:textSize="28sp"
            app:layout_constraintLeft_toLeftOf="parent"
            app:layout_constraintRight_toRightOf="parent"
            app:layout_constraintTop_toTopOf="parent" />

        <android.support.v7.widget.RecyclerView
            android:id="@+id/${classNameLowercase}RecyclerView"
            android:layout_width="0dp"
            android:layout_height="0dp"
            app:layout_constraintBottom_toTopOf="@+id/editText"
            app:layout_constraintLeft_toLeftOf="parent"
            app:layout_constraintRight_toRightOf="parent"
            app:layout_constraintTop_toBottomOf="@+id/titleTextView" />

        <ProgressBar
            android:id="@+id/${classNameLowercase}LoadingView"
            style="?android:attr/progressBarStyleLarge"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            app:layout_constraintBottom_toBottomOf="parent"
            app:layout_constraintEnd_toEndOf="@+id/${classNameLowercase}RecyclerView"
            app:layout_constraintStart_toStartOf="parent"
            app:layout_constraintTop_toTopOf="parent"/>

        <EditText
            android:id="@+id/editText"
            android:layout_width="0dp"
            android:layout_height="wrap_content"
            android:layout_marginBottom="-1dp"
            android:layout_marginLeft="0dp"
            android:layout_marginRight="0dp"
            android:layout_marginTop="0dp"
            android:ems="10"
            android:hint="Enter text"
            android:imeOptions="actionGo"
            android:inputType="text"
            android:padding="10dp"
            app:layout_constraintBottom_toBottomOf="parent"
            app:layout_constraintLeft_toLeftOf="parent"
            app:layout_constraintRight_toLeftOf="@+id/inputButton"
            app:layout_constraintTop_toTopOf="@+id/inputButton" />

        <ImageButton
            android:id="@+id/inputButton"
            android:layout_width="44dp"
            android:layout_height="44dp"
            android:layout_marginBottom="0dp"
            android:background="@android:color/transparent"
            app:layout_constraintBottom_toBottomOf="parent"
            app:layout_constraintRight_toRightOf="parent"
            app:srcCompat="@drawable/button_forward"
            tools:ignore="ContentDescription" />

    </android.support.constraint.ConstraintLayout>
</android.support.v4.widget.SwipeRefreshLayout>