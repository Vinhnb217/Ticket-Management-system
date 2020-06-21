<?php

session_start();
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
include 'library.php'; // include the library file
require 'vendor/autoload.php';
$mail = new PHPMailer(true);            


//including the database connection file
include_once("config.php");

          

//fetching data in descending order (lastest entry first)
//$result = mysql_query("SELECT * FROM users ORDER BY id DESC"); // mysql_query is deprecated
//$result = mysqli_query($mysqli, "SELECT * from ticketcategories join ticket on ticketcategories.ID = ticket.CatID where ticketcategories.DeptID = $deptID"); // using mysqli_query instead
?>

<html>

<head>
    <title>Homepage</title>
</head>

<body>
    <?php

        $result = mysqli_query($mysqli,"SELECT ticket.ID, ticket.StatusID, DATEDIFF(CURDATE(), ticket.CreateAt) AS SoNgay FROM ticket where ticket.StatusID=2");
?>
   
    <br />
    
   
    <table width='80%' border=0>
        <tr bgcolor='#CCCCCC'>
            <td>Ticket ID</td>
            <td>StatusID</td>
            <td>SoNgay</td>
           
        </tr>
        <?php 
        //while($res = mysql_fetch_array($result)) { // mysql_fetch_array is deprecated, we need to use mysqli_fetch_array 
        while($res = mysqli_fetch_array($result)) {         
            $ticketID = $res['ID'];
            $ticketStatusID = $res['StatusID'];
            $SoNgay = $res['SoNgay'];

            echo "<tr>";
            echo "<td>".$res['ID']."</td>";
            echo "<td>".$res['StatusID']."</td>";
            echo "<td>".$res['SoNgay']."</td>";    
            
            if($SoNgay > 2)
            {
                try {
                    //Server settings
                    $mail->CharSet = "UTF-8";
                    $mail->SMTPDebug = 0;                                 // Enable verbose debug output
                    $mail->isSMTP();                                      // Set mailer to use SMTP
                    $mail->Host = SMTP_HOST;  // Specify main and backup SMTP servers
                    $mail->SMTPAuth = true;                               // Enable SMTP authentication
                    $mail->Username = SMTP_UNAME;                 // SMTP username
                    $mail->Password = SMTP_PWORD;                           // SMTP password
                    $mail->SMTPSecure = 'ssl';                            // Enable TLS encryption, `ssl` also accepted
                    $mail->Port = SMTP_PORT;                                    // TCP port to connect to
                    //Recipients
                    $mail->setFrom(SMTP_UNAME, "Hệ thống quản lý ticket");
                    $mail->addAddress('Vinhnguyenba217@gmail.com', 'Trưởng phòng CTSV');  // Add a recipient | name is option
                    $mail->addReplyTo(SMTP_UNAME, 'Hệ thống quản lý ticket');
                    $mail->isHTML(true);                                  // Set email format to HTML
                    $mail->Subject = 'Ticket số #'.$ticketID. ' đang trễ hạn xử lý' ;
                    $mail->Body = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
                    <html xmlns="http://www.w3.org/1999/xhtml">
                    <head>
                    <meta name="viewport" content="width=device-width" />
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                    <title>Eliteadmin Responsive web app kit</title>
                    </head>
                    <body style="margin:0px; background: #f8f8f8; ">
                    <div width="100%" style="background: #f8f8f8; padding: 0px 0px; font-family:arial; line-height:28px; height:100%;  width: 100%; color: #514d6a;">
                      <div style="max-width: 700px; padding:50px 0;  margin: 0px auto; font-size: 14px">
                        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; margin-bottom: 20px">
                          <tbody>
                           
                          </tbody>
                        </table>
                        <div style="padding: 40px; background: #fff;">
                          <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                            <tbody>
                              <tr>
                                <td><b>Dear Sir/Madam/Customer,</b>
                                  <p>Ticket số #'.$ticketID.' đang quá hạn, vui lòng click nút bên dưới để phê duyệt</p>
                                  <a href="javascript: void(0);" style="display: inline-block; padding: 11px 30px; margin: 20px 0px 30px; font-size: 15px; color: #fff; background: #00c0c8; border-radius: 60px; text-decoration:none;"> Xem ticket </a>
                                  <p>This email template can be used for Create Account, Change Password, Login Information and other informational things.</p>
                                  <b>- Trân trọng cảm ơn</b> </td>
                              </tr>
                            </tbody>
                          </table>
                        </div>
                        <div style="text-align: center; font-size: 12px; color: #b2b2b5; margin-top: 20px">
                          <p> Powered by Themedesigner.in <br>
                            <a href="javascript: void(0);" style="color: #b2b2b5; text-decoration: underline;">Unsubscribe</a> </p>
                        </div>
                      </div>
                    </div>
                    </body>
                    </html>
                    ';
                    $mail->AltBody = $_POST['content']; //None HTML
                    $result = $mail->send();
                    if (!$result) {
                        $error = "Có lỗi xảy ra trong quá trình gửi mail";
                    }
                } catch (Exception $e) {
                    echo 'Message could not be sent. Mailer Error: ', $mail->ErrorInfo;
                }
            }
            
        }
        ?>
    </table>
    <br /><br />
   


</body>

</html>
