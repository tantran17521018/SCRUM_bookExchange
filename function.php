<?php
session_start();
include "connection.php";

function get_all_book($conn) {
    $sql = "SELECT USERID,BOOKID,TITLE,PUBLISHER FROM books WHERE STATUS='available' ORDER BY TITLE DESC";
    $result = mysqli_query($conn, $sql);
    return $result;
}

function get_search($conn, $string_search){
    // $sql = 'select * from books where status="available" and title like "%'.$string_search.'%"';
    $sql = 'select * from books where status="available"';

    $result = mysqli_query($conn, $sql);
    return $result;
}

function login($conn){
    $sql = 'select * from user where username ="'.$_POST['username'].'" and password ="'.$_POST['password'].'"';
    $result = mysqli_query($conn, $sql);

    if(mysqli_num_rows ($result) > 0){
        // create session 
        $_SESSION['id_user'] = $result[0][0];
        $_SESSION['user'] = $_POST['username'];
        return true;
    }else{
        return false;
    }
} 

function get_current_book($conn){
    $sql = "select * from books where USERID = '".$_SESSION['id_user']."' and bookid not in( select bookid1 from exchange where userid1= '".$_SESSION['id_user']."')";
    $result = mysqli_query($conn, $sql);

    return $result;
}

function get_change_book($conn){
    $sql = "select * from books where USERID = '".$_SESSION['id_user']."' and bookid in( select bookid1 from exchange where userid1= '".$_SESSION['id_user']."')";
    $result = mysqli_query($conn, $sql);

    return $result;
}

function logout($conn){
    unset($_SESSION['user']);
    return true;
}



?>