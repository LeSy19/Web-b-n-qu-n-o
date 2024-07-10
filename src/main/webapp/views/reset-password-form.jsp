<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reset Password</title>
    <style type="text/css">
        * {
            font-family: 'Poppins', sans-serif;
        }

        body {
           
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            background-attachment: fixed;
        }

        .box {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 90vh;
        }

        .container {
            width: 350px;
            display: flex;
            flex-direction: column;
            padding: 0 15px 0 15px;
        }

        header {
            color: #6096B4;
            font-size: 30px;
            display: flex;
            justify-content: center;
            padding: 0 0 15px 0;
        }

        .input-field {
            display: flex;
            flex-direction: column;
            margin-bottom: 15px;
            color: #fff;
        }

        .input-field .input {
            height: 45px;
            width: 87%;
            border: none;
            outline: none;
            border-radius: 30px;
            color: #fff;
            padding: 0 0 0 42px;
            background: #B8E7E1;
        }

        .input-field .submit {
            color: #fff;
        }

        ::-webkit-input-placeholder {
            color: #fff;
        }

        .submit {
            border: none;
            border-radius: 30px;
            font-size: 15px;
            height: 45px;
            outline: none;
            width: 100%;
            background: #B8E7E1;
            cursor: pointer;
            transition: .3s;
        }

        .submit:hover {
            box-shadow: 1px 5px 7px 1px rgba(0, 0, 0, 0.2);
        }

        p {
            color: #6096B4;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="box">
    <div class="container">
        <div class="top-header">
            <header>RESET PASSWORD</header>
        </div>
        <form action="/reset-password" method="post">
    <div class="input-field">
        <input type="email" id="email" name="email" class="input" placeholder="Enter your email" required autocomplete="off">
    </div>
    <div class="input-field">
        <input type="text" id="code" name="code" class="input" placeholder="Enter verification code in your email" required autocomplete="off">
    </div>
    <div class="input-field">
        <input type="password" id="newPassword" name="newPassword" class="input" placeholder="New Password" required autocomplete="off">
    </div>
    <div class="input-field">
        <input type="submit" class="submit" value="Submit">
    </div>
    <!-- Display message and error -->
    <p>${message}</p>
    <p>${errorMessage}</p>
</form>

    </div>
</div>
</body>
</html>