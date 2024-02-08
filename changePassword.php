<?php

session_start();

include("db.php");
if (isset($_POST['register'])) {
    $id=$_SESSION['id'];
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $password = mysqli_real_escape_string($conn, $_POST['password']);
    $confirmpassword = mysqli_real_escape_string($conn, $_POST['pass']);

    $query = "select * from farmer where femail = '$email'";
    $run_query = mysqli_query($conn, $query);
    $count_rows = mysqli_num_rows($run_query);

    $ciphering = "AES-128-CTR";
    $iv_length = openssl_cipher_iv_length($ciphering);
    $options = 0;
    $encryption_iv = '2345678910111211';
    $encryption_key = "DE";

    $encryption = openssl_encrypt(
        $password,
        $ciphering,
        $encryption_key,
        $options,
        $encryption_iv
    );

    if (strcmp($password, $pass) == 0) {
        if ($count_rows != 0) {
            $update_query = "update farmer set fpassword = '$encryption' 
                                    where fid= '$id'";

            $run_query = mysqli_query($conn, $update_query);

            echo "<script>alert('Password Updated Successfully');</script>";
            echo "<script>window.open('test.php','_self')</script>";
        } else if ($count_rows == 0) {
            $update_query = "update buyer set bpassword = '$encryption' 
            where bid = '$id'";

$run_query = mysqli_query($conn, $update_query);

echo "<script>alert('Password Updated Successfully');</script>";
echo "<script>window.open('test.php','_self')</script>";
        }
        else{
           
echo "<script>alert('Please enter valid');</script>";
echo "<script>window.open('test.php','_self')</script>";
        }
    } else {
        echo "<script>alert('Please Enter Valid Details');</script>";
    }
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Forgot Password</title>
      
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <a href="https://icons8.com/icon/83325/roman-soldier"></a>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <script src="https://kit.fontawesome.com/c587fc1763.js" crossorigin="anonymous"></script>
    <style>
        h3 {
            background-color: transparent;
            font-family:  sans-serif;
            text-align: center;
            cursor: pointer;
            /* color: rgb(0, 61, 153); */
            color:black;
        }

        .box {
            color: rgb(6, 36, 7);
            width: 370px;
            line-height: 40px;
            margin: auto;
            text-align: center;
            margin-top: 50px;
            padding: 5px;
            border-style: outset;
            border-width: 5px;
            border-radius: 16px;
            /* border-color: rgb(0, 172, 230); */
            border-color:black;
        }

        body {
            /* background-image: url(Images/Website/FarmerLogin.jpg); */
            /* background: black; */
            /* background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            background-color: white;
            background-image: url(../Images/Website/BuyerLogin.jpeg); */
            border: chartreuse;
        }

        form {
            margin: 10px;
            padding: 20px;
            background-color: rgb(247, 248, 247);

        }

        .inp {
            padding: 5px;
            margin: 20px;
            /* border-color: rgb(0, 172, 230); */
            display: inline-block;
            border-radius: 16px;
            width:80%;
            text-align: center;
        }

        .ins {
            padding: 5px;
            margin: 10px;
            /* border-color: rgb(0, 172, 230); */
            display: inline-block;
            border-radius: 16px;
            width:80%;
            text-align: center;
        }
        .ins-2 {
            padding: 5px;
            margin: 10px;
            /* border-color: rgb(0, 172, 230); */
            display: inline-block;
            border-radius: 16px;
            width:80%;
            text-align: center;
            margin-top:-20px;
            font-weight:600;
        }

        input[type="submit"] {
            cursor: pointer;
            font-size: 17px;
         padding-left:5%;
         padding-right:5%;
            font-weight: bold;
            color: goldenrod;
            background-color:#292b2c;
            border-radius: 16px;
            border-color:black;
            width: auto;
        }
/*   input[type="submit"]:hover {
            background-color: rgb(0, 153, 255);
            outline: none;
            color: rgb(255, 255, 255);
            border-radius: 20%;
            border-style: outset;
            border-color: rgb(0, 57, 230);
            font-weight: bolder;
            width: 54%;
            font-size: 18px;
*/
        .myfooter {
        background-color: #292b2c;

        color: goldenrod;
        margin-top: 15px;
    }

    .aligncenter {
        text-align: center;
    }

    a {
        color: goldenrod;
    }

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    nav {
        background-color: #292b2c;
    }

    .navbar-custom {
        background-color: #292b2c;
    }

    /* change the brand and text color */
    .navbar-custom .navbar-brand,
    .navbar-custom .navbar-text {
        background-color: #292b2c;
    }

    .navbar-custom .navbar-nav .nav-link {
        background-color: #292b2c;
    }

    .navbar-custom .nav-item.active .nav-link,
    .navbar-custom .nav-item:hover .nav-link {
        background-color: #292b2c;
    }


    .mybtn {
        border-color: green;
        border-style: solid;
    }


    .right {
        display: flex;
    }

    .left {
        display: none;
    }

    .cart {
        /* margin-left:10px; */
        margin-right: -9px;
    }

    .profile {
        margin-right: 2px;

    }

    .login {
        margin-right: -2px;
        margin-top: 12px;
        display: none;
    }

    .searchbox {
        width: 60%;
    }

    .lists {
        display: inline-block;
    }

    .moblists {
        display: none;
    }

    .logins {
        text-align: center;
        margin-right: -30%;
        margin-left: 35%;
    }
    @media only screen and (min-device-width:320px) and (max-device-width:480px) {
        /* .mycarousel {
            display: none;
        }

        .firstimage {
            height: auto;
            width: 90%;
        }

        .card {
            width: 80%;
            margin-left: 10%;
            margin-right: 10%;

        }

        .col {
            margin-top: 20px;
        } */

        .right {
            display: none;
            background-color: #ff5500;
        }

        /* 
            .settings{
            margin-left:79%;
        } */
        .left {
            display: flex;
        }

        .moblogo {
            display: none;
        }

        .logins {
            text-align: center;
            margin-right: 35%;
            padding: 15px;
        }

        .searchbox {
            width: 95%;
            margin-right: 5%;
            margin-left: 0%;
        }

        .moblists {
            display: inline-block;
            text-align: center;
            width: 100%;
        }
        /* .pic{
        height:auto;
    } */
    
    /* .mobtext{
        display:none;
    }
    .destext{
        display:inline-block;
        width:90%;
        margin-left: 5%;
        margin-right: 5%;
    } */
    }

    .input-box{
width:290px;
max-width:98%;
position:relative;
}

input-box input{
width:100%;
height:60px;
padding:0 20px;
border:1px solid #ccc;
outline:none;
color:#fff;
background:transparent;
}

#message{
position:absolute;
button:-30px;
color:#fff;
font-size:15px;
display:none;
}

::placeholder{
font-size:15px;
}


    </style>
    <link rel="icon" type="image/jpg" href="images/123.jpg">
	
</head>

<body>


    <div class="box">
        <form action="Profile/changePass.php" method="post">
            <h3>CHANGE PASSWORD</h3>
     
            <br>
            <input type="email"  class="inp" name="email" placeholder="Email-address" required><br>
           <div class="input-box">
            <input type="password" name="password" class="ins" id="password" placeholder="Password" required><br>
            <p id="message" class="ins-2">Password is <span id="strength"></span></p>
        </div>
            <input type="password" class="inp" name="pass" placeholder="Confirm Password" required><br><br>
            <span style=" display:block;  margin-bottom: .75em; "></span>
        <br>
            <input type="submit" name="register" value="Update Password">
        </form>
    </div>
    <script>
	var pass = document.getElementById("password");
	var msg = document.getElementById("message");
	var str = document.getElementById("strength");

	pass.addEventListener('input',() => {
		if(pass.value.length > 0){
			msg.style.display = "block";
		}
		else{
			msg.style.display = "none";
		}	
		if(pass.value.length < 4){
			str.innerHTML = "weak";
			pass.style.borderColor = "#ff5925";
			msg.style.color = "#ff5925";
		}
		else if(pass.value.length >= 4 && pass.value.length <8){
			str.innerHTML = "medium";
			pass.style.borderColor = "#8B8000";
			msg.style.color = "#8B8000";
		}
		else if(pass.value.length >= 8){
			str.innerHTML = "strong";
			pass.style.borderColor = "#26d730";
			msg.style.color = "#26d730";
		}
	})

</script>
<script>
 document.addEventListener('DOMContentLoaded',() => {

var disclaimer= document.querySelector("img[alt='www.000webhost.com']");
if(disclaimer){
disclaimer.remove();
}
});
</script>
</body>

</html>

