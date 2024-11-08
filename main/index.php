<?php

include '../components/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
};


?>


<!DOCTYPE html>
<html lang="en">
<body style="background-color:E2DFDE;">  

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <meta http-equiv="X-UA-Compatible" content="ie=edge">

  <meta name="copyright" content="MACode ID, https://macodeid.com/">

  <title>L-Clinic</title>

  <link rel="stylesheet" href="../assets/css/maicons.css">

  <link rel="stylesheet" href="../assets/css/bootstrap.css">

  <link rel="stylesheet" href="../assets/vendor/owl-carousel/css/owl.carousel.css">

  <link rel="stylesheet" href="../assets/vendor/animate/animate.css">

  <link rel="stylesheet" href="../assets/css/theme.css">
</head>
<body>

  <!-- Back to top button -->
  <div class="back-to-top"></div>

  <?php include '../components/header.php'; ?>
  <div class="page-hero bg-image overlay-dark" style="background-image: url(../assets/img/background.jpg);">
    <div class="hero-section">
      <div class="container text-center wow zoomIn">
      <span class="subhead">Your Beauty is our Priority</span>
        <h2 class="display-4">Welcome to L - Clinic</h2>
        
      </div>
    </div>
  </div>

    <div class="page-section pb-0">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-lg-6 py-3 wow fadeInUp">
            <h1>Welcome to Aesthetic L-Clinic <br> Center</h1>
            &nbsp;
            <p class="text-grey mb-4">Thank you for choosing L-Clinic. Your Beauty is our priority.
              We are available service for Face, Skin, and Body Treatment. Our Clinic also provide aesthetic products.</p>
            <a href="about.php" class="btn btn-primary">Learn More</a>
          </div>
          <div class="col-lg-6 wow fadeInRight" data-wow-delay="400ms">
            <div class="img-place custom-img-1">
              <img src="../assets/img/home.png" alt="">
            </div>
          </div>
        </div>
      </div>
    </div> <!-- .bg-light -->
  </div> <!-- .bg-light -->

  <div class="page-section">
    <div class="container">
      <h1 class="text-center mb-5 wow fadeInUp">Our Medical Team</h1>

      <div class="owl-carousel wow fadeInUp" id="doctorSlideshow">

          <?php
                  $select_doctor= $conn->prepare("SELECT * FROM `users` WHERE role_id = 2 ORDER BY id ");
                  $select_doctor->execute();
                  if($select_doctor->rowCount() > 0){
                     while($fetch_doctor = $select_doctor->fetch(PDO::FETCH_ASSOC)){
            ?>

          <div class="item">
          <div class="card-doctor">
            <div class="header">
              <img src="<?php echo $fetch_doctor['avatar'];?>" alt="">
            
            </div>
            <div class="body">
              <p class="text-xl mb-0"><?php echo $fetch_doctor['dname'];?></p>
              
            </div>
          </div>
        </div>
            <?php }
            
                     }
            ?>
        

        
      </div>
    </div>
  </div>

  
 
  <?php include '../components/footer.php'; ?>


<script src="../assets/js/jquery-3.5.1.min.js"></script>

<script src="../assets/js/bootstrap.bundle.min.js"></script>

<script src="../assets/vendor/owl-carousel/js/owl.carousel.min.js"></script>

<script src="../assets/vendor/wow/wow.min.js"></script>

<script src="../assets/js/theme.js"></script>
  
</body>
</html>