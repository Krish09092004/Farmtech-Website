<?php

@include 'db.php';

session_start();

$aid = $_SESSION['aid'];

if(isset($_POST['add_product'])){

   $name = $_POST['name'];
   $name = filter_var($name, FILTER_SANITIZE_STRING);
   $price = $_POST['price'];
   $price = filter_var($price, FILTER_SANITIZE_STRING);
   $category = $_POST['category'];
   $category = filter_var($category, FILTER_SANITIZE_STRING);
   $details = $_POST['details'];
   $details = filter_var($details, FILTER_SANITIZE_STRING);

   $image = $_FILES['image']['name'];
   $image = filter_var($image, FILTER_SANITIZE_STRING);
   $image_size = $_FILES['image']['size'];
   $image_tmp_name = $_FILES['image']['tmp_name'];
   $image_folder = 'images/'.$image;
	$select_products = "SELECT * FROM `fproducts` WHERE product = '$name'";
   	$result = mysqli_query($conn, $select_products);
		
   if(mysqli_num_rows($result)>0){
      $message[] = 'product name already exist!';
   }else{
      $insert_products = "INSERT INTO `fproduct`(product, pcat, pinfo, price, pimage) VALUES('$name','$category','$details','$price','$image')";
      $result = mysqli_query($conn, $insert_products);
      if($insert_products){
         if($image_size > 2000000){
            $message[] = 'image size is too large!';
         }else{
            move_uploaded_file($image_tmp_name, $image_folder);
            $message[] = 'new product added!';
         }

      }

   }

};

if(isset($_GET['delete'])){

   $delete_id = $_GET['delete'];
   $select_delete_image = "SELECT image FROM `fproduct` WHERE pid ='$delete_id'";
   $result = mysqli_query($conn, $select_delete_image);
   $delete_products = "DELETE FROM `fproduct` WHERE pid='$delete_id';";
		$result = mysqli_query($conn, $delete_products);
      $delete_cart = "DELETE FROM  `cart` WHERE pid='$delete_id';";
		$result = mysqli_query($conn, $delete_cart);
	if($result){
      header('location:admin_products.php');
   }
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
   <title>products</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/admin_style.css">

</head>
<body>
   
<?php include 'admin_header.php'; ?>

<section class="add-products">

   <h1 class="title" data-aos="fade-down" class="div" data-aos-duration="1500">add new product</h1>

   <form action="" method="POST" enctype="multipart/form-data" data-aos="zoom-in-down" class="div" data-aos-duration="1000">
      <div class="flex">
         <div class="inputBox">
         <input type="text" name="name" class="box" required placeholder="enter product name">
         <select name="category" class="box" required>
            <option value="" selected disabled>select category</option>
               <option value="vegitables">vegitables</option>
               <option value="fruits">fruits</option>
               <option value="grains">grains</option>
         </select>
         </div>
         <div class="inputBox">
         <input type="number" min="0" name="price" class="box" required placeholder="enter product price">
         <input type="file" name="image" required class="box" accept="image/jpg, image/jpeg, image/png">
         </div>
      </div>
      <textarea name="details" class="box" required placeholder="enter product details" cols="30" rows="10"></textarea>
      <input type="submit" class="btn" value="add product" name="add_product">
   </form>

</section>

<section class="show-products">

   <h1 class="title" data-aos="fade-up" class="div" data-aos-duration="2000">products added</h1>

   <div class="box-container" >

   <?php
    $show_products = mysqli_query($conn, "SELECT * FROM `fproduct`")or die('query failed');
       
	 if(mysqli_num_rows($show_products) > 0){
		while($row= mysqli_fetch_assoc($show_products)){  
     
   ?>
   <div class="box" data-aos="fade-up" class="div" data-aos-duration="2000">
      <div class="price"><?php echo $row['price']; ?>/-</div>
      <img src="images/<?php echo $row['pimage']; ?>" alt="">
      <div class="name"><?php echo $row['product']; ?></div>
      <div class="cat"><?php echo $row['pcat']; ?></div>
      <div class="details"><?php echo $row['pinfo']; ?></div>
      <div class="flex-btn">
         <a href="admin_update_product.php?update=<?php echo $row['pid']; ?>" class="option-btn">update</a>
         <a href="admin_products.php?delete=<?php echo $row['pid']; ?>" class="delete-btn" onclick="return confirm('delete this product?');">delete</a>
      </div>
   </div>
   <?php
      }
   }else{
      echo '<p class="empty">now products added yet!</p>';
   }
   ?>

   </div>

</section>










<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
 <script>
  AOS.init();
  </script>
<script src="storescript.js"></script>
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