<?php

include 'db.php';
session_start();


if(isset($_POST['update_profile'])){
    

   $update_name = mysqli_real_escape_string($conn, $_POST['update_name']);
   $update_email = mysqli_real_escape_string($conn, $_POST['update_email']);
   $update_mobile = mysqli_real_escape_string($conn, $_POST['update_mobile']);

   $id = $_SESSION['bid'];
   $sql= "UPDATE `buyer` SET bname = '$update_name', bemail = '$update_email',bmobile = '$update_mobile'  WHERE bid = '$id'";
   $result = mysqli_query($conn, $sql);
   if($result)
   {
       $_SESSION['message'] = "Profile Updated successfully !!!";
      }
      
   $update_image = $_FILES['update_image']['name'];
   $update_image_size = $_FILES['update_image']['size'];
   $update_image_tmp_name = $_FILES['update_image']['tmp_name'];
   $update_image_folder = 'images/'.$update_image;

   if(!empty($update_image)){
      if($update_image_size > 2000000){
         $message[] = 'image is too large';
      }else{
         $image_update_query = mysqli_query($conn, "UPDATE `buyer`SET picStatus=1, picExt='$update_image' WHERE bid = '$id'") or die('query failed');
         if($image_update_query){
            move_uploaded_file($update_image_tmp_name, $update_image_folder);
         }
        
         $message[] = 'image updated succssfully!';
         header("Location: test.php");
      }
   }

}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>update profile</title>
   <link rel="icon" type="image/jpg" href="images/123.jpg">
	
   <!-- custom css file link  -->
   <link rel="stylesheet" href="styleprofile.css">

</head>
<body>
   
<div class="update-profile">



   <form action="" method="post" enctype="multipart/form-data">
      <?php
         if($_SESSION['picExt'] == ''){
            echo '<img src="images/default-avatar.png">';
         }else{
            echo '<img src="images/'.$_SESSION['picExt'].'">';
         }
         if(isset($message)){
            foreach($message as $message){
               echo '<div class="message">'.$message.'</div>';
            }
         }
      ?>
      <div class="flex">
         <div class="inputBox">
            <span>username :</span>
            <input type="text" name="update_name" value="" class="box" placeholder="update username" required>
            <span>your email :</span>
            <input type="email" name="update_email" value="" class="box" placeholder="Update email address" required>
            <span>update your mobile number:</span>
             <input type="tel" name="update_mobile"  maxlength="10"  min="0000000000" minlength="10" min="1" max="9999999999" oninput="maxLengthCheck(this)"value="" class="box" placeholder="update mobile number" required>
            <span>update your pic :</span>
          	<input type="file" name="update_image" accept="image/jpg, image/jpeg, image/png" class="box">
         </div>
         
      </div>
      <input type="submit" value="update profile" name="update_profile" class="btn">
      
      <a href="profileView.php" class="delete-btn">go back</a>
   </form>

</div>
<script>
	function maxLengthCheck(object){
		if(object.value.length> object.max.length)
		object.value=object.value.slice(0,object.max.length)
	}
    const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
container.classList.remove("right-panel-active");
});
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