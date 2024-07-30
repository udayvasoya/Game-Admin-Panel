<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 27-05-2024
  Time: 16:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login Page</title>
    <link
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
            rel="stylesheet"
    />
    <style>
        body,
        html {
            height: 100%;
            margin: 0;
        }
        .container-fluid {
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .left-side {
            background-color: #3a86ff;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100%;
            width: 50%;
            position: relative;
        }
        .left-side h1 {
            font-size: 48px;
        }
        .right-side {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100%;
            width: 50%;
        }
        .login-box {
            width: 100%;
            max-width: 400px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            background-color: white;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="left-side">
        <h1>Welcome, Login!!</h1>
    </div>
    <div class="right-side">
        <div class="login-box">
            <form action="adminLoginServlet" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="username">AdminName</label>
                    <input
                            type="text"
                            class="form-control"
                            id="username"
                            placeholder="AdminName"
                            name="name"
                    />
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input
                            type="password"
                            class="form-control"
                            id="password"
                            placeholder="Password"
                            name="password"
                    />
                </div>
                <button type="submit" class="btn btn-primary btn-block">
                    Sign in
                </button>
                <div class="text-center mt-3">
                    <a href="#">Forgot password?</a>
                </div>

            </form>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
