<?php

include '../components/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
   header('location:login.php');
};




?>

<!DOCTYPE html>
<html lang="en">
<head >
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <title>Clinic</title>

  <link rel="stylesheet" href="../assets/css/maicons.css">

  <link rel="stylesheet" href="../assets/css/bootstrap.css">

  <link rel="stylesheet" href="../assets/vendor/owl-carousel/css/owl.carousel.css">

  <link rel="stylesheet" href="../assets/vendor/animate/animate.css">

  <link rel="stylesheet" href="../assets/css/theme.css">

  <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
   
   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   
   
  <!-- custom css file link  -->
  <link rel="stylesheet" href="../assets/css/style.css">
  
<div style="font-size : 162.25%"><?php include '../components/header.php'; ?></div>

<body >

  <!-- Back to top button -->
  <div class="back-to-top"></div>
  <div class="page-banner overlay-dark bg-image" style="background-image: url(../assets/img/background.jpg); ">
    <div class="banner-section">
      <div class="container text-center wow fadeInUp">
        <nav aria-label="Breadcrumb">
          <ol class="breadcrumb breadcrumb-dark bg-transparent justify-content-center py-0 mb-2">
            <li class="breadcrumb-item"><a href="index.php">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">Orders</li>
          </ol>
        </nav>
        <h1 class="font-weight-normal">Orders</h1>
      </div> <!-- .container -->
    </div> <!-- .banner-section -->
  </div> <!-- .page-banner -->

  
  <section class="orders">

<div class="box-container">
<div class="box">
<div class="container mt-5">
        <div class="d-flex justify-content-center row">
            <div class="col-md-10">
                <div class="rounded">
                    <div class="table-responsive table-borderless">
                        <table class="table" style="font-size:15px">
                            <thead>
                                <tr>
                                    <th class="text-center">
                                        <div class="toggle-btn">
                                            <div class="inner-circle"></div>
                                        </div>
                                    </th>
                                    <th>Order #</th>
                                    
                                    <th>status</th>
                                    <th>Total</th>
                                    <th>Created</th>
                                    <th></th>
                                </tr>
                            </thead>
                            
                            <tbody class="table-body">
                            <?php
                                      if($user_id == ''){
                                          echo '<p class="empty">Please login to view orders</p>';
                                      }else{
                                          $select_orders = $conn->prepare("SELECT * FROM `orders` WHERE user_id = ?");
                                          $select_orders->execute([$user_id]);
                                          if($select_orders->rowCount() > 0){
                                            while($fetch_orders = $select_orders->fetch(PDO::FETCH_ASSOC)){
                                    ?>
                                <tr class="cell-1">
                                    <td class="text-center">
                                        <div class="toggle-btn">
                                            <div class="inner-circle"></div>
                                        </div>
                                    </td>
                                    
                                    <td><a href="orders_details.php?reference_number=<?= $fetch_orders['reference_number']; ?>"><?= $fetch_orders['reference_number']; ?></a></td>                    
                                    <td><span class="badge <?php if($fetch_orders['status'] == '1'){ echo 'badge-success'; }else{ echo 'badge-warning'; }; ?>"><?php if($fetch_orders['status'] == '1'){ echo 'Done'; }else{ echo 'Pending'; }; ?></span></td>

                                    <td>RM<?= $fetch_orders['total_price']; ?></td>
                                    <td><?= $fetch_orders['placed_on']; ?></td>
                                    <td><a href="orders_details.php?reference_number=<?= $fetch_orders['reference_number']; ?>"><i class="fa fa-ellipsis-h text-black-50"></i></a></td>
                                </tr>
                                <?php
                                    
                                    }
                                    }
                                    }
                                  ?>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
  </div>
  </div> 


</section>



<section class="orders">

  </section>
  <?php include '../components/footer.php'; ?>

<script src="../assets/js/jquery-3.5.1.min.js"></script>

<script src="../assets/js/bootstrap.bundle.min.js"></script>

<script src="../assets/vendor/owl-carousel/js/owl.carousel.min.js"></script>

<script src="../assets/vendor/wow/wow.min.js"></script>

<script src="../assets/js/theme.js"></script>
  

<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>




</body>
</html>