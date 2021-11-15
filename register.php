<?php include 'db_connect.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <style>
        #myDiv
    {
     height: 104px;
    width: 140px;
}
    #myDiv img
{
     max-width: 100%;
    max-height: 100%;
    margin: auto;
    display: block;
}</style>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Register</title>
  <link href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.8.95/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/login.css">
</head>
<body>
  <main class="d-flex align-items-center min-vh-100 py-3 py-md-0">
    <div class="container">
      <div class="card login-card">
        <div class="row no-gutters">
          <div class="col-md-5">
            <img src="assets/images/login1.jpg" alt="login" class="login-card-img">
          </div>
          <div class="col-md-7">
            <div class="card-body">
            <div id="myDiv">
                <center><img alt="Client Logo" title="Client Logo" src="assets/images/logo1.jpeg" /></center>
                </div><br><br>
              <p class="login-card-description">Sign Up!</p>
              <form method="post">
                  <div class="form-group">
                    <label for="nama" class="sr-only">Nama</label>
                    <input type="text" name="nama" id="nama" class="form-control" placeholder="Nama" required>
                  </div>
                  <div class="form-group">
                    <label for="email" class="sr-only">Email</label>
                    <input type="email" name="email" id="email" class="form-control" placeholder="Email" required>
                  </div>
                  <div class="form-group">
                    <label for="password" class="sr-only">Password</label>
                    <input type="password" name="password" id="password" class="form-control" placeholder="Password" required>
                  </div>
                  <div class="form-group">
                    <label for="password" class="sr-only">No. HP</label>
                    <input type="text" name="telepon" id="telepon" class="form-control" placeholder="No. Handphone" required>
                  </div>
                  <div class="form-group">
                    <label for="alamat" class="sr-only">Alamat</label>
                    <input type="text" name="alamat" id="alamat" class="form-control" placeholder="Alamat" required>
                  </div>
                  <button class="btn btn-primary" name="daftar">Daftar</button>
                </form>
                <a href="#!" class="forgot-password-link">Forgot password?</a>
                <p class="login-card-footer-text">Already have an account? <a href="login.php" class="text-reset">Sign in</a></p>
                <nav class="login-card-footer-nav">
                  <a href="#!">Terms of use.</a>
                  <a href="#!">Privacy policy</a>
                </nav>
            </div>
          </div>
        </div>
      </div>
      <!-- <div class="card login-card">
        <img src="assets/images/login.jpg" alt="login" class="login-card-img">
        <div class="card-body">
          <h2 class="login-card-title">Login</h2>
          <p class="login-card-description">Sign in to your account to continue.</p>
          <form action="#!">
            <div class="form-group">
              <label for="email" class="sr-only">Email</label>
              <input type="email" name="email" id="email" class="form-control" placeholder="Email">
            </div>
            <div class="form-group">
              <label for="password" class="sr-only">Password</label>
              <input type="password" name="password" id="password" class="form-control" placeholder="Password">
            </div>
            <div class="form-prompt-wrapper">
              <div class="custom-control custom-checkbox login-card-check-box">
                <input type="checkbox" class="custom-control-input" id="customCheck1">
                <label class="custom-control-label" for="customCheck1">Remember me</label>
              </div>              
              <a href="#!" class="text-reset">Forgot password?</a>
            </div>
            <input name="login" id="login" class="btn btn-block login-btn mb-4" type="button" value="Login">
          </form>
          <p class="login-card-footer-text">Don't have an account? <a href="#!" class="text-reset">Register here</a></p>
        </div>
      </div> -->
    </div>
  </main>
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

  <?php
  //jika ada tombol daftar
  if (isset($_POST["daftar"]))
  {
      //mengambil nama, email, dll
      $nama = $_POST["nama"];
      $email = $_POST["email"];
      $password = $_POST["password"];
      $telepon = $_POST["telepon"];
      $alamat = $_POST["alamat"];

      //cek email apakah sudah digunakan
        $ambil = $conn->query("SELECT * FROM pelanggan
            WHERE email_user='$email'");
        $yangcocok = $ambil->num_rows;
        if ($yangcocok==1)
        {
            echo "<script>alert('Pendaftaran gagal, email sudah digunakan');</script>";
            echo "<script>location='register.php';</script>";
        }
        else
        {
            //query insert ke tabel pelanggan
            $conn->query("INSERT INTO pelanggan
                (email_user, password_user, nama_user, kontak_user, alamat_user)
                VALUES('$email','$password','$nama','$telepon','$alamat') ");

                echo "<script>alert('Registrasi berhasil, silahkan login');</script>";
                echo "<script>location='login.php';</script>";
        }
  }

?>

</body>
</html>