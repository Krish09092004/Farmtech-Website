<?php

@include 'db.php';

session_start();

$bid = $_SESSION['bid'];
if(isset($_POST['add_to_cart'])){
   $pid = $_POST['pid'];
   $pid = filter_var($pid, FILTER_SANITIZE_STRING);
   $product = $_POST['product'];
   $product = filter_var($product, FILTER_SANITIZE_STRING);
   $price = $_POST['price'];
   $price = filter_var($price, FILTER_SANITIZE_STRING);
   $pimage = $_POST['pimage'];
   $pimage = filter_var($pimage, FILTER_SANITIZE_STRING);
   $p_qty = $_POST['p_qty'];
   $p_qty = filter_var($p_qty, FILTER_SANITIZE_STRING);

   $show_products = mysqli_query($conn, "SELECT * FROM `cart`  WHERE product = '$product' AND bid = '$bid' ")or die('query failed');
   if(mysqli_num_rows($show_products) > 0){
      $message[] = 'already added to cart!';
   }else{
      
$bid = $_SESSION['bid'];
	  $insert_cart = "INSERT INTO `cart`(bid, pid, product, price, quantity, pimage) VALUES('$bid', '$pid', '$product', '$price', '$p_qty',' $pimage')";
	  $result = mysqli_query($conn, $insert_cart);
	  if($result)
	  {
	  $message[] = 'added to cart!';
   }
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
   <title>shop</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="stylestore.css">

</head>
<body>
   
<?php include 'headerstore.php'; ?>

<section class="p-category">

   <a href="category.php?category=fruits" data-aos="fade-down-right" class="div" data-aos-duration="1000">fruits</a>
   <a href="category.php?category=vegitables" data-aos="fade-down" class="div" data-aos-duration="1000">vegitables</a>
   <a href="category.php?category=grains" data-aos="fade-down-left" class="div" data-aos-duration="1000">grains</a>

</section>

<section class="products">

   <h1 class="title">latest products</h1>

   <div class="box-container" data-aos="zoom-in-up" class="div" data-aos-duration="1500">

   <?php
     $show_products = mysqli_query($conn, "SELECT * FROM `fproduct` ")or die('query failed');
       
	 if(mysqli_num_rows($show_products) > 0){
		while($row= mysqli_fetch_assoc($show_products)){  
			?>
   <form action="" class="box" method="POST">
      <div class="price"><span><?php echo $row['price']; ?></span>/-</div>
      <a href="view_page.php?pid=<?php echo $row['pid']; ?>" class="fas fa-eye"></a>
      <img src="images/<?php echo $row['pimage']; ?>" alt="">
      <div class="name"><?php echo $row['product']; ?></div>
      <input type="hidden" name="pid" value="<?php echo $row['pid']; ?>">
      <input type="hidden" name="product" value="<?php echo $row['product']; ?>">
      <input type="hidden" name="price" value="<?php echo $row['price']; ?>">
      <input type="hidden" name="pimage" value="<?php echo $row['pimage']; ?>">
      <input type="number" min="1" value="1" name="p_qty" class="qty">
      <input type="submit" value="add to cart" class="btn" name="add_to_cart">
   </form>
   <?php
      }
   }else{
      echo '<p class="empty">no products added yet!</p>';
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