<html>
<body>
<?php

/* Get the name of the file uploaded to Apache */
$file_name = $_FILES['file']['name'];
$file_tmp =$_FILES['file']['tmp_name'];

/* Permanently save the file upload to the upload folder */
if ( move_uploaded_file($file_tmp,"upload/".$file_name) ) {
  echo "<p>Upload of <i>$file_name</i> <b>successful</b></p>";
} else {
  echo "<p>Upload of <i>$file_name</i> <b>failed</b></p>";
}

?>
</body>
</html>
