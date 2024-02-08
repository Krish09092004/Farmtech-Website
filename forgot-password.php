<?php 
session_start();
require "db.php";
include('smtp/PHPMailerAutoload.php');

$errors = array();
?>
<?php
if ($_SERVER["REQUEST_METHOD"] == "POST")
{
	$category = dataFilter($_POST['category']);
    $_SESSION['Category'] = $category;
}

 if(isset($_POST['check-email'])){
        if($category == 1){
        $email = mysqli_real_escape_string($conn, $_POST['email']);
        $check_email = "SELECT * FROM farmer WHERE femail='$email'";
        $run_sql = mysqli_query($conn, $check_email);
        if(mysqli_num_rows($run_sql) > 0){
            $code = rand(999999, 111111);
            $insert_code = "UPDATE farmer SET code = $code WHERE femail = '$email'";
            $run_query =  mysqli_query($conn, $insert_code);
            if($run_query){
                $to=$email;
                $subject = "Password Reset Code";
                $msg = "Your password reset code is $code";
                $sender = "From: maniarkrish2004@gmail.com";
                function smtp_mailer($to,$subject, $msg){
                    $mail = new PHPMailer(); 
                    $mail->IsSMTP(); 
                    $mail->SMTPAuth = true; 
                    $mail->SMTPSecure = 'tls'; 
                    $mail->Host = "smtp.gmail.com";
                    $mail->Port = 587; 
                    $mail->IsHTML(true);
                    $mail->CharSet = 'UTF-8';
                    //$mail->SMTPDebug = 2; 
                    $mail->Username = "maniarkrish2004@gmail.com";
                    $mail->Password = "mnsu jqzh dmnd bloe";
                    $mail->SetFrom("maniarkrish2004@gmail.com");
                    $mail->Subject = $subject;
                    $mail->Body =$msg;
                    $mail->AddAddress($to);
                    $mail->SMTPOptions=array('ssl'=>array(
                        'verify_peer'=>false,
                        'verify_peer_name'=>false,
                        'allow_self_signed'=>false
                    ));
                    if(!$mail->Send()){
                        $errors['otp-error'] = "Failed while sending code!";
                        echo $mail->ErrorInfo;
                    }else{
                        $info = "We've sent a passwrod reset otp to your email - $email";
                        $_SESSION['info'] = $info;
                        $_SESSION['email'] = $email;
                        header('location: reset-code.php');
                        exit();
                    }
                }
                
                echo smtp_mailer($to,$subject,$msg);
                
            }else{
                $errors['db-error'] = "Something went wrong!";
            }
        }else{
            $errors['email'] = "This email address does not exist!";
        }
    }
    else if($category == 0){ 
        $email = mysqli_real_escape_string($conn, $_POST['email']);
        $check_email = "SELECT * FROM buyer WHERE bemail='$email'";
        $run_sql = mysqli_query($conn, $check_email);
        if(mysqli_num_rows($run_sql) > 0){
            $code = rand(999999, 111111);
            $insert_code = "UPDATE buyer SET code = $code WHERE bemail = '$email'";
            $run_query =  mysqli_query($conn, $insert_code);
            if($run_query){
                $to = $email;
                $subject = "Password Reset Code";
                $msg = "Your password reset code is $code";
                $sender = "From: maniarkrish2004@gmail.com";
function smtp_mailer($to,$subject, $msg){
	$mail = new PHPMailer(); 
	$mail->IsSMTP(); 
	$mail->SMTPAuth = true; 
	$mail->SMTPSecure = 'tls'; 
	$mail->Host = "smtp.gmail.com";
	$mail->Port = 587; 
	$mail->IsHTML(true);
	$mail->CharSet = 'UTF-8';
	//$mail->SMTPDebug = 2; 
	$mail->Username = "maniarkrish2004@gmail.com";
	$mail->Password = "mnsu jqzh dmnd bloe";
	$mail->SetFrom("maniarkrish2004@gmail.com");
	$mail->Subject = $subject;
	$mail->Body =$msg;
	$mail->AddAddress($to);
	$mail->SMTPOptions=array('ssl'=>array(
		'verify_peer'=>false,
		'verify_peer_name'=>false,
		'allow_self_signed'=>false
	));
	if(!$mail->Send()){
        $errors['otp-error'] = "Failed while sending code!";
		echo $mail->ErrorInfo;
	}else{
        $info = "We've sent a passwrod reset otp to your email - $email";
        $_SESSION['info'] = $info;
        $_SESSION['email'] = $email;
        header('location: reset-code.php');
        exit();
	}
}

echo smtp_mailer($to,$subject,$msg);
            }else{
                $errors['db-error'] = "Something went wrong!";
            }
        }else{
            $errors['email'] = "This email address does not exist!";
        }
       }
}
function dataFilter($data)
{
	$data = trim($data);
 	$data = stripslashes($data);
	$data = htmlspecialchars($data);
  	return $data;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="icon" type="image/jpg" href="images/123.jpg">
	
    <meta charset="UTF-8">
    <title>Forgot Password</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="stylecode.css">
    
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
</head>

<body>
    <div class="container" >
        <div class="row"  data-aos="zoom-in" class="div" data-aos-duration="1000" >
            <div class="col-md-4 offset-md-4 form">
                <form action="forgot-password.php" method="POST" autocomplete=""  >
                    <h2 class="text-center">Forgot Password</h2>
                    <?php 
                    if(isset($_SESSION['info'])){
                        ?>
                        <div class="alert alert-success text-center" style="padding: 0.4rem 0.4rem">
                            <?php echo $_SESSION['info']; ?>
                        </div>
                        <?php
                    }
                    ?>
                    <?php
                    if(count($errors) > 0){
                        ?>
                        <div class="alert alert-danger text-center">
                            <?php
                            foreach($errors as $showerror){
                                echo $showerror;
                            }
                            ?>
                        </div>
                        <?php
                    }
                    ?>
                    <p class="text-center" >Enter your email address</p>
                    <div class="form-group">
                        <input class="form-control" type="email" name="email" placeholder="Enter email address" required>
                    </div>
                    <b>Category : </b>
&nbsp;&nbsp;&nbsp;		    <input type="radio" id="farmer" name="category" value="1" checked >
            <label for="farmer">Farmer</label>
            &nbsp;&nbsp;&nbsp; <input type="radio" id="buyer" name="category" value="0" >
		   <label for="buyer">Buyer</label>
				<br>
                <br>
		            <div class="form-group" >
                        <input class="form-control button" type="submit" name="check-email" value="Continue">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
 <script>
  AOS.init();
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