<?php
    session_start();
    
include('../smtp/PHPMailerAutoload.php');

if ($_SERVER["REQUEST_METHOD"] == "POST")
{
	$name = dataFilter($_POST['name']);
	$mobile = dataFilter($_POST['mobile']);
	$user = dataFilter($_POST['uname']);
	$email = dataFilter($_POST['email']);
	$pass =	dataFilter(password_hash($_POST['pass'], PASSWORD_BCRYPT));
	$hash = dataFilter( md5( rand(0,1000) ) );
	$category = dataFilter($_POST['category']);
    $addr = dataFilter($_POST['addr']);

	$_SESSION['Email'] = $email;
    $_SESSION['Name'] = $name;
    $_SESSION['Password'] = $pass;
    $_SESSION['Username'] = $user;
    $_SESSION['Mobile'] = $mobile;
    $_SESSION['Category'] = $category;
    $_SESSION['Hash'] = $hash;
    $_SESSION['Addr'] = $addr;
    $_SESSION['Rating'] = 0;
}


require '../db.php';

$length = strlen($mobile);

if($length != 10)
{
	$_SESSION['message'] = "Invalid Mobile Number !!!";
	header("location: error.php");
	die();
}

if($category == 1)
{
    $sql = "SELECT * FROM farmer WHERE femail='$email'";

    $result = mysqli_query($conn, "SELECT * FROM farmer WHERE femail='$email'") or die($mysqli->error());

    if ($result->num_rows > 0 )
    {
        $_SESSION['message'] = "User with this email already exists!";
        //echo $_SESSION['message'];
        header("location: error.php");
    }
    else
    {
        $code = rand(999999, 111111);
 $status= "notverified";
    	$sql = "INSERT INTO farmer (fname, fusername, fpassword, fhash, fmobile, femail, faddress,code,status)
    			VALUES ('$name','$user','$pass','$hash','$mobile','$email','$addr','$code','$status')";

    	if (mysqli_query($conn, $sql))
    	{
    	    $_SESSION['Active'] = 0;
            $_SESSION['logged_in'] = true;

            $_SESSION['picStatus'] = 0;
           // $_SESSION['picExt'] = png;

            $sql = "SELECT * FROM farmer WHERE femail='$email'";
            $result = mysqli_query($conn, $sql);
            $User = $result->fetch_assoc();
            $_SESSION['id'] = $User['fid'];

            if($_SESSION['picStatus'] == 0)
            {
                $_SESSION['picId'] = 0;
                $_SESSION['picName'] = "profile0.png";
            }
            else
            {
                $_SESSION['picId'] = $_SESSION['id'];
                $_SESSION['picName'] = "profile".$_SESSION['picId'].".".$_SESSION['picExt'];
            }

            $_SESSION['message'] =

                     "Confirmation link has been sent to $email, please verify
                     your account by clicking on the link in the message!";

            $to      = $email;
            $subject = "Account Verification";
            
            $sender = "From: maniarkrish2004@gmail.com";
            $msg = "
            Hello '$user',

Thank you for signing up!

Please put this code to activate your account:
             
             <b>Verification code = </b>".$code;
             
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
		echo $mail->ErrorInfo;
	}else{
        header("location: ../user-otp.php");
		return 'Sent';
	}
}

echo smtp_mailer($to,$subject,$msg);

 	}
    	else
    	{
    	    //echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    	    $_SESSION['message'] = "Registration failed!";
            header("location: error.php");
    	}
    }
}

else
{
    $sql = "SELECT * FROM buyer WHERE bemail='$email'";

    $result = mysqli_query($conn, "SELECT * FROM buyer WHERE bemail='$email'") or die($mysqli->error());

    if ($result->num_rows > 0 )
    {
        $_SESSION['message'] = "User with this email already exists!";
        //echo $_SESSION['message'];
        header("location: error.php");
    }
    else
    {
        $code = rand(999999, 111111);
 $status= "notverified";
    	$sql = "INSERT INTO buyer(bname, busername, bpassword, bhash, bmobile, bemail, baddress,code,status)
    			VALUES ('$name','$user','$pass','$hash','$mobile','$email','$addr','$code','$status')";

    	if (mysqli_query($conn, $sql))
    	{
    	    $_SESSION['Active'] = 0;
            $_SESSION['logged_in'] = true;

            $_SESSION['picStatus'] = 0;
           // $_SESSION['picExt'] = png;

            $sql = "SELECT * FROM buyer WHERE bemail='$email'";
            $result = mysqli_query($conn, $sql);
            $User = $result->fetch_assoc();
            $_SESSION['id'] = $User['bid'];

            if($_SESSION['picStatus'] == 0)
            {
                $_SESSION['picId'] = 0;
                $_SESSION['picName'] = "profile0.png";
            }
            else
            {
                $_SESSION['picId'] = $_SESSION['id'];
                $_SESSION['picName'] = "profile".$_SESSION['picId'].".".$_SESSION['picExt'];
            }

            $_SESSION['message'] =

                     "Confirmation code has been sent to $email, please verify
                     your account by clicking on the link in the message!";

            $to      = $email;
            $subject = "Account Verification";
            
            $sender = "From: maniarkrish2004@gmail.com";
            $msg = "
            Hello '$user',
<br>
                Thank you for signing up!
<br>
        Please put this code to activate your account:
    <br>         
             <b>Verification code = </b>".$code;
             
             
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
		echo $mail->ErrorInfo;
	}else{
        header("location: ../user-otp.php");
		return 'Sent';
	}
}

echo smtp_mailer($to,$subject,$msg);

}
    	else
    	{
    	    //echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    	    $_SESSION['message'] = "Registration can't be done and failed!";
            header("location: error.php");
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

