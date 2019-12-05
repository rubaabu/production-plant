<?php 
ob_start();
session_start();
require '../function.php';
require '../db.php';

if( !isset($_SESSION['user' ]) && !isset($_SESSION['director']) && !isset($_SESSION['eng']) && !isset($_SESSION['dealer']) ) {
    header("Location: login.php");
    exit;
    }


   if(isset($_SESSION['director'])){
      
     $var = $_SESSION['director'];

   } else if (isset($_SESSION['eng'])){
        header('Location: engpage.php');
    $var = $_SESSION['eng'];

   } else if (isset($_SESSION['acc'])){
    header('Location: accPage.php');
$var = $_SESSION['acc'];

}else if (isset($_SESSION['dealer'])){
    header('Location: dealerpage.php');
    $var = $_SESSION['dealer'];

}
   else {
 

    $var = $_SESSION['user'];

   }

   //select the user that he is logged in
   $result=mysqli_query($conn, "SELECT * FROM users WHERE user_id=".$var);

   //to know what is the proplem if there are one
   if (!$result) { 
    printf("Error: %s\n", mysqli_error($conn));
    exit();
}
   $userRow=mysqli_fetch_array($result, MYSQLI_ASSOC);
  

$employ = new DBsetup;
$error = '';

if($_POST['type']==""){
    $error = $employ->assembleError($error,"please choose a type","type");
}

if($_POST['message']==""){
    $error = $employ->assembleError($error,"please Write your message","message");
}




if(!$error){

    $employ_data = array(
    
        'fk_type_id'            =>$_POST['type'],
        'employment_message'    =>$_POST['message'],
     
        'fk_user_from'          =>$_SESSION['user'],

    );

    echo $employ->employmentApp($employ_data);

}
echo $error;

?>

<!DOCTYPE html>
<html lang="en">
<head>
<?php require '../header.php'; ?>
<style>
   .body{
       background-color: #d0ecf0
   }
 #ru .container #ru-row #ru-column #ru-box {
    
  margin-top: 50px;
  max-width: 600px;
  height: 200px;
  border: 1px solid #9C9C9C;
  background-color: #176d81;
  margin-bottom: 400px;
}
#ru .container #ru-row #ru-column #ru-box #ru-form {
  padding: 20px;
}
#ru .container #ru-row #ru-column #ru-box #ru-form #register-link {
  margin-top: -85px;
}

   
</style>

</head>

<body class="body">

<a href="../applyJob.php"><button type='button' class='btn btn-info'>back</button></a>



 <div id="ru">
      
      <div class="container">
     
          <div id="ru-row" class="row justify-content-center align-items-center">
              <div id="ru-column" class="col-md-6">
                  <div id="ru-box" class="col-md-12"> <br>
                  <h2 style="color: #0d3446" >Upload CV</h2><br>
                  <label for="type" style=" color: #d0ecf0">Upload your CV and cover letter</label><br>

                   <button class="btn btn-info btn-md"><a style="color: black" href="upload.php">upload</a></button>

                    
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php require '../footer.php'; ?>

</body>
</html>