<?php
include("start.php") ;
include("navbar.php") ;
?>

<?php 

$connection = mysqli_connect('localhost' , 'root' , '' , 'center_manger') ;
$sql = "SELECT * FROM groups WHERE id > 0 " ;
$group_data = mysqli_query($connection , $sql) ;
echo  $teacher = $_SESSION['teacher_id'] ; 

$sql_teacher = "SELECT * FROM classes WHERE teacher_id = '$teacher'  ORDER BY id DESC LIMIT 1 " ;
$query_teacher = mysqli_query($connection , $sql_teacher) ;
$assoc_teacher = mysqli_fetch_assoc($query_teacher) ;
$last_studnet_for_teacher = $assoc_teacher['student_id'] ;
echo  '<br>' .  $last_id = $assoc_teacher['student_id'];

if(isset($last_studnet_for_teacher)){



  // echo $last_id ."<br>";
  $sql_class = "SELECT * FROM classes WHERE student_id = '$last_id' AND teacher_id = '$teacher' " ;
  $class_info = mysqli_query($connection , $sql_class) ;
  $class_data = mysqli_fetch_assoc($class_info) ;
  $group_id = $class_data['group_id'] ;
  // echo $group_id ."<br>";
  $sql_group = "SELECT * FROM groups WHERE id = '$group_id'" ;
  $group_info = mysqli_query($connection , $sql_group) ;
  $group_data_last = mysqli_fetch_assoc($group_info) ;
  // print_r($group_data_last) ;
  

}

if (isset($_POST['fname'])){
  $fname = $_POST['fname'] ;
  $lname = $_POST['lname'] ; 
  $phone = $_POST['phone'] ;
  $group = $_POST['group'] ;
  echo   $group ;
  $student_sql = "INSERT INTO students (first_name , last_name ,  phone  ) VALUE ('$fname' , '$lname'  , '$phone') " ;
  $student_data = mysqli_query($connection, $student_sql);
  $last_id2 = $last_id+1 ;

  // print_r($student_id_array) ;
  $sql_classes = "INSERT INTO classes (student_id , teacher_id , group_id) VALUE ('$last_id2' , '$teacher' , '$group')" ;
  $class_data = mysqli_query($connection, $sql_classes);
  header("Location:student_add.php") ;

// $group_sql = "SELECT * FROM groups WHERE id = $group" ;
// $group_name_data = mysqli_query($connection , $group_sql) ;
// $group_info = mysqli_fetch_assoc($group_name_data) ;
// $group_name =$group_info['name'] ;

}

if (isset($last_id) ){
  $sql2 = "SELECT * FROM students where id = '$last_id' ";
  $last_data = mysqli_query($connection, $sql2);
  $last_studnet = mysqli_fetch_assoc($last_data) ;
}
else{
  $null = array("first_name"=> " لا يوجد طالب", "last_name"=> "لا يوجد طالب ", "phone"=>" لا يوجد طالب");
  $last_studnet = $null ;

}
//////////////////////// مهم فشخولا

// $result = mysqli_query($connection , "SELECT * FROM `students` WHERE teacher_id = $teacher_id");
// $storeArray = Array();
// while ($row = mysqli_fetch_assoc($result)) {
//     $storeArray[] =  $row['id'];  
// }
// $last_id =  end($storeArray); ;
// // echo $last_id ;
// // echo $teacher_id ;

//////////////////////// مهم فشخولا
?>

<?php


?>
<div class="container box arabic">
  <div class="row">
    <div class="col-lg-6 col-sm-12 ">
        <form action="student_add.php" method="post">

            <h1 class=" font-weight-bold text-success mt-5">اضافه طالب</h1>

              <div class="form-group col-lg-10 mt-4" >
                <label for="fname" >اسم الطالب :</label>
                <input class="form-control mt-2" id="fname" name="fname" type="text" required >
              </div>

              <div class="form-group col-lg-10 mt-4" >
                <label for="lname" >اسم ولي الامر :</label>
                <input class="form-control mt-2" id="lname" name="lname" type="text" required >
              </div>

              <div class="form-group col-lg-10 mt-4" >
                <label for="teacher" >المدرس :</label>  
                <input class="form-control mt-2" id="lname" name="teacher" type="text" placeholder="<?php echo $teacher_full_name ;?>" disabled >
              </div>

              <div class="form-group col-lg-10 mt-4" >
                <label for="group" >المجموعه :</label>  
                <select class="form-select mt-2" name='group'>
                  <option value='0' selected>اختيار مجموعة</option>
                  <?php while ($group_info = mysqli_fetch_assoc($group_data)) {?>
                  <option value="<?php if(isset($group_info)){ echo $group_info['id'] ; } ?>"><?php if(isset($group_info)){ echo $group_info['name'] ; } ?></option>
                  <?php }; ?>
                </select>
              </div>

              <div class="form-group col-lg-10 mt-4" >
                <label for="phone" >رقم ولي الامر :</label>
                <input type="number"  class="form-control mt-2" id="phone" name="phone" required >
              </div>

              <div class="form-group col-lg-10 mt-4" >
              <button type="submit"  class="btn btn-success col-12">إنشاء</button>
              </div>
        </form>
    </div>
    <div class="col-lg-6 col-sm-12 ">
        <h1 class=" font-weight-bold text-danger mt-5">معلومات اخر طالب</h1>

          <div class="form-group col-lg-9 mt-4" >
            <label for="fname2" >اسم الطالب :</label>
            <input class="form-control mt-2"type="text"  placeholder="<?php echo $last_studnet['first_name'] ; ?>" disabled   >
          </div>

          <div class="form-group col-lg-9 mt-4" >
            <label for="lname2" >اسم ولي الامر :</label>
            <input class="form-control mt-2" type="text" placeholder="<?php echo $last_studnet['last_name'] ; ?>" disabled  >
          </div>

          <div class="form-group col-lg-9 mt-4" >
            <label for="teacher2" >المدرس :</label>  
            <input class="form-control mt-2" type="text" placeholder="<?php if(isset($teacher_full_name)){ echo $teacher_full_name ; } ?>" disabled >
          </div>

          <div class="form-group col-lg-9 mt-4" >
                <label for="group" >المجموعه :</label>  
                <input class="form-control mt-2" type="text" placeholder="<?php if(isset($group_data_last)){ echo $group_data_last["name"] ; } ?>" disabled  >
              </div>

          <div class="form-group col-lg-9 mt-4" >
            <label for="phone2" >رقم ولي الامر :</label>
            <input class="form-control mt-2" type="text" placeholder="<?php echo $last_studnet['phone'] ; ?>" disabled  >
          </div>
          <div class="form-group col-lg-12 mt-4 d-flex justify-content-center" >
              <a href="students.php" class="btn btn-primary m-1 col-6">جميع الطلاب</a>
              <a href="student_edit.php?id=<?php echo $last_id ; ?>" class="btn btn-danger  m-1 col-6">تعديل</a>
              </div>
        </div>
      </div>
</div>
<?php
include("end.php") ;

?>

