<?php

include 'db.php';
session_start();
$fid = $_SESSION['fid'];

if (!isset($_SESSION['fid'])) {         // condition Check: if session is not set. 
   header('location: test.php');   // if not set the user is sendback to login page.
 }
?>

<!DOCTYPE html>
<html lang="en">
<head>
<link rel="icon" type="image/jpg" href="images/123.jpg">
	
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>home</title>

    <!-- custom css file link  -->
    <link rel="stylesheet" href="styleprofile.css">

</head>
<body>
   
<div class="container" data-aos="fade-up" class="div" data-aos-duration="2000">

   <div class="profile">
   <?php

         $select = mysqli_query($conn, "SELECT * FROM `farmer` WHERE fid = '$fid'") or mysqli_query($conn, "SELECT * FROM `buyer` WHERE bid = '$id'") or die('query failed');
         if(mysqli_num_rows($select) > 0){
            $_SESSION= mysqli_fetch_assoc($select);
         }
         if($_SESSION['picExt'] == ''){
            echo '<img src="images/default-avatar.png">';
         }else{
            echo '<img src="images/'.$_SESSION['picExt'].'">';
         }
      ?>

      <h3><?php echo $_SESSION['fname']; ?>
      <br>
      <b><font size="+1" color="black">RATINGS : </font></b><?php echo $_SESSION['frating']; ?>
      <br>
      <br>
      <b><font size="+1" color="black">Email ID : </font></b><?php echo $_SESSION['femail']; ?>
      <br>
      <br>
      <b><font size="+1" color="black">Mobile No : </font></b><?php echo $_SESSION['fmobile']; ?>
      </h3>
      <div class="btn-1" data-aos="fade-right" data-aos-anchor-placement="center-bottom" class="div" data-aos-duration="2000">
                                        <a href="esp-weather-station.php">Sensor-details</a>
                                    </div>
    <div class="btn-2" data-aos="fade-left" data-aos-anchor-placement="center-bottom" class="div" data-aos-duration="2000">
                                        <a href="weather.html">Weather-details</a>
                                    </div>
   <div class="btn-3" data-aos="fade-right" data-aos-anchor-placement="center-bottom" class="div" data-aos-duration="2000">
                                        <a href="uploadProduct.php">Upload Product</a>
                                    </div>
   <div class="btn-4" data-aos="fade-left" data-aos-anchor-placement="center-bottom" class="div" data-aos-duration="2000">
                                        <a href="changePassword.php">Change Password</a>
                                    </div>
                                    
                  <div class="btn-5" data-aos="fade-down" data-aos-anchor-placement="center-bottom" class="div" data-aos-duration="2000">
      <a href="update_profile.php">update profile</a>
      </div>
      <a href="Login/logout.php" class="delete-btn">logout</a>
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