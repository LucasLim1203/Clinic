<?php

include '../components/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
   header('location:login.php');
};

if(isset($_POST['submit'])){

   $name = $_POST['name'];
   $name = filter_var($name, FILTER_SANITIZE_STRING);
   $email = $_POST['email'];
   $email = filter_var($email, FILTER_SANITIZE_STRING);
   $phone = $_POST['phone'];
   $phone = filter_var($phone, FILTER_SANITIZE_STRING);

   $empty_pass = 'da39a3ee5e6b4b0d3255bfef95601890afd80709';
   $prev_pass = $_POST['prev_pass'];
   $old_pass = sha1($_POST['old_pass']);
   $old_pass = filter_var($old_pass, FILTER_SANITIZE_STRING);
   

}

if(isset($_POST['submit'])){

  $empty_pass = 'da39a3ee5e6b4b0d3255bfef95601890afd80709';
  $prev_pass = $_POST['prev_pass'];
  $old_pass = sha1($_POST['old_pass']);
  $old_pass = filter_var($old_pass, FILTER_SANITIZE_STRING);
  $new_pass = sha1($_POST['new_pass']);
  $new_pass = filter_var($new_pass, FILTER_SANITIZE_STRING);
  $cpass = sha1($_POST['cpass']);
  $cpass = filter_var($cpass, FILTER_SANITIZE_STRING);

  if($old_pass == $empty_pass){
     $message[] = 'Please enter old password!';
  }elseif($old_pass != $prev_pass){
     $message[] = 'Old password not matched!';
  }elseif($new_pass != $cpass){
     $message[] = 'Confirm password not matched!';
  }else{
     if($new_pass != $empty_pass){
        $update_admin_pass = $conn->prepare("UPDATE `users` SET password = ? WHERE id = ?");
        $update_admin_pass->execute([$cpass, $user_id]);
        $message[] = 'Update successfull !';
     }else{
        $message[] = 'Please enter new password !';
     }
  }


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
            <li class="breadcrumb-item active" aria-current="page">Profile</li>
          </ol>
        </nav>
        <h1 class="font-weight-normal">Profile</h1>
      </div> <!-- .container -->
    </div> <!-- .banner-section -->
  </div> <!-- .page-banner -->

  <div class="page-section">
    <div class="container">

      <form class="contact-form mt-5" method="post">
        <input type="hidden" name="prev_pass" value="<?= $fetch_profile["password"]; ?>">
        <div class="row mb-3">
        <div class="col-sm-6 py-2 wow fadeInUp">

            <label for="fullName">Name</label>
            <input type="text" id="Name" name="name" class="form-control" placeholder="Name" value="<?= $fetch_profile["name"]; ?>">
          </div>
          <div class="col-sm-6 py-2 wow fadeInUp">
            <label for="emailAddress">E-mail</label>
            <input type="text" id="email" name="email" class="form-control" placeholder="E-mail address" value="<?= $fetch_profile["email"]; ?>">
          </div>
          <div class="col-12 py-2 wow fadeInUp">
            <label for="phone">Phone Number</label>
            <input type="text" id="phone" name="phone" class="form-control" placeholder="Phone number" value="<?= $fetch_profile["phone"]; ?>">
          </div>
         
          <div class="col-12 py-2 wow fadeInUp">
            <label for="old pass">Old Password</label>
            <input type="text" id="oldpassword" name="old_pass" class="form-control" placeholder="Enter old password" >
          </div>
          <div class="col-12 py-2 wow fadeInUp">
            <label for="new pass">New Password</label>
            <input type="text" id="newpass" name="new_pass" class="form-control" placeholder="New password">
          </div>
          <div class="col-12 py-2 wow fadeInUp">
            <label for="comfirm pass">Confirm Password</label>
            <input type="text" id="comfirmpassword" name="cpass" class="form-control" placeholder="Comfirm new password">
          </div>
          
        </div>
        <button type="submit" name="submit" class="btn btn-primary wow fadeInUp">Update Profile</button>
      </form>
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