<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reset Password</title>
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
        <link href="assets/css/ResetPass.css" rel="stylesheet" type="text/css" />
    </head>

    <body>
        <div class="login">        
            <form action="resetpass" method="post">
                <div class="into">
                    <div class="top">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlaNPJJz7CPZDMTf9zRt_v0MZ4B5TWIp2pFA&usqp=CAU"
                             alt="">
                        <h2>Password Reset</h2>
                        <p>Enter new password and then repeat it</p>
                    </div>
                    <p class="pass">New Password</p>
                    <div class="box">

                        <div class="lock"><i class="fa fa-lock" aria-hidden="true"></i></div>
                        <input type="password" name="password" id="password" onkeyup="validate_password()">
                    </div>
                    <p class="pass">Confirm Password</p>
                    <div class="box">

                        <div class="lock">
                            <i class="fa fa-lock" aria-hidden="true"></i>
                        </div>
                        <input type="password" name="confirm_password" id="confirm_password" onkeyup="validate_password()">
                    </div>
                    <span id="wrong_pass_alert"></span>
                    <div>
                        <input type="submit" class="btnLogin" value="Save" id="create" onclick="wrong_pass_alert()" disabled="true">
                    </div>
                </div>
                <input type="hidden" name="token" value="${requestScope.token}">            
            </form>
        </div>
    </body>
    <script>
        function validate_password() {

            var pass = document.getElementById('password').value;
            var confirm_pass = document.getElementById('confirm_password').value;
            if (pass != confirm_pass) {
                document.getElementById('wrong_pass_alert').style.color = 'red';
                document.getElementById('wrong_pass_alert').innerHTML
                        = 'Use same password';
                document.getElementById('create').disabled = true;
                document.getElementById('create').style.opacity = (0.4);
            } else {
                document.getElementById('wrong_pass_alert').style.color = 'green';
                document.getElementById('wrong_pass_alert').innerHTML =
                        'Password Matched';
                document.getElementById('create').disabled = false;
                document.getElementById('create').style.opacity = (1);
            }
        }

        function wrong_pass_alert() {
            if (document.getElementById('password').value != "" &&
                    document.getElementById('confirm_password').value != "") {
                alert("Your response is submitted");
            } else {
                alert("Please fill all the fields");
            }
        }
    </script>

</html>