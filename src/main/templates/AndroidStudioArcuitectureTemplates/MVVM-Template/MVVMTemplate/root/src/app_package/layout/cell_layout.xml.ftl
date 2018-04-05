<?xml version="1.0" encoding="utf-8"?>
<android.support.constraint.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="100dp"
    android:minHeight="20dp">

    <TextView
        android:id="@+id/${classNameLowercase}TextView"
        android:layout_width="0dp"
        android:layout_height="wrap_content"
        android:layout_marginBottom="0dp"
        android:layout_marginLeft="0dp"
        android:layout_marginRight="0dp"
        android:layout_marginTop="0dp"
        android:padding="8dp"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintLeft_toLeftOf="parent"
        app:layout_constraintRight_toLeftOf="@+id/${classNameLowercase}DeleteButton"
        app:layout_constraintTop_toTopOf="parent"
        tools:text="Sample text" />

    <ImageButton
        android:id="@+id/${classNameLowercase}DeleteButton"
        android:layout_width="44dp"
        android:layout_height="match_parent"
        android:layout_marginTop="0dp"
        android:background="@android:color/transparent"
        app:layout_constraintRight_toRightOf="parent"
        app:layout_constraintTop_toTopOf="parent"
        app:srcCompat="@drawable/button_delete"
        tools:ignore="ContentDescription" />
</android.support.constraint.ConstraintLayout>