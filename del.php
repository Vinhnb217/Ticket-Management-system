
<?php
//including the database connection file
session_start();
include("config.php");
 
//getting id of the data from url
$id = $_GET['id'];
$studentid = $_SESSION['id'];
//check status
$getinfoticket = mysqli_query($mysqli,"SELECT * FROM `ticket` WHERE ID=$id");
while($res = mysqli_fetch_array($getinfoticket)) {         
  
    $StatusID = $res['StatusID'];

}

//kiểm tra status có đang ở trạng thái chò xử lý hay không
If($StatusID == 1 || $StatusID == 2 ){
    //deleting the row from table
    $result = mysqli_query($mysqli, "DELETE FROM ticket WHERE ID=$id");
    //Lưu logs
    $sqlLogs = mysqli_query($mysqli,"INSERT INTO tickethistory (TicketID,Activity,UserID) VALUES ('$id','Xóa ticket','$studentid')"); 
    //redirecting to the display page (index.php in our case)
   header("Location:ListTicket.php");
}
else
{
    echo "Bạn không thể xóa ticket này !";
}



?>