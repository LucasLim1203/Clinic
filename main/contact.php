<?php

include '../components/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
};


if(isset($_POST['submit'])){
  
  
  $name = $_POST['name'];

  $subject = $_POST['subject'];

  $email = $_POST['email'];

  $messages = $_POST['message'];

  
  $insert_order = $conn->prepare("INSERT INTO `messages`(name, subject, email, message ) VALUES(?,?,?,?)");
  $insert_order->execute([$name,$subject,$email,$messages]);

  $message[] = 'Message send successfully!';
  

}


?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <title>Clinic</title>

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

  <div class="page-banner overlay-dark bg-image" style="background-image: url(../assets/img/background.jpg);">
    <div class="banner-section">
      <div class="container text-center wow fadeInUp">
        <nav aria-label="Breadcrumb">
          <ol class="breadcrumb breadcrumb-dark bg-transparent justify-content-center py-0 mb-2">
            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">Contact</li>
          </ol>
        </nav>
        <h1 class="font-weight-normal">Contact Us</h1>
      </div> <!-- .container -->
    </div> <!-- .banner-section -->
  </div> <!-- .page-banner -->

  <div class="page-section">
    <div class="container">

      <form class="contact-form mt-5" method="post">
        <div class="row mb-3">
          <div class="col-sm-6 py-2">
            <label for="fullName">Name</label>
            <input type="text" id="fullName" name="name" class="form-control" placeholder="Full name..">
          </div>
          <div class="col-sm-6 py-2">
            <label for="emailAddress">Email</label>
            <input type="text" id="emailAddress" name="email" class="form-control" placeholder="Email address..">
          </div>
          <div class="col-12 py-2">
            <label for="subject">Subject</label>
            <input type="text" id="subject" name="subject" class="form-control" placeholder="Enter subject..">
          </div>
          <div class="col-12 py-2">
            <label for="message">Message</label>
            <textarea id="message" class="form-control" name="message" rows="8" placeholder="Enter Message.."></textarea>
          </div>
        </div>
        <button type="submit" name="submit" class="btn btn-primary">Send Message</button>
      </form>
    </div>
  </div>


  <?php include '../components/footer.php'; ?>


<script src="../assets/js/jquery-3.5.1.min.js"></script>

<script src="../assets/js/bootstrap.bundle.min.js"></script>

<script src="../assets/vendor/owl-carousel/js/owl.carousel.min.js"></script>

<script src="../assets/vendor/wow/wow.min.js"></script>

<script src="../assets/js/google-maps.js"></script>

<script src="../assets/js/theme.js"></script>

  
</body>
</html>