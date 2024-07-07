<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>ログインページ | 時間割</title>
  <!-- Bootstrap CSS link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    body {
      background-image: url('a.png');
      background-size: cover;
      background-repeat: no-repeat;
      background-position: center center;
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .login-form {
      background-color: rgba(255, 255, 255, 0.8);
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
  </style>
  <script>
    function redirectToSite(event) {
      event.preventDefault();
      const username = document.getElementById('usernameInput').value;
      if (username) {
    	  location.href='list.jsp';
      } else {
        alert('ユーザー名を入力してください');
      }
    }
  </script>
</head>
<body>
  <div class="login-form">
    <form onsubmit="redirectToSite(event)">
      <div class="form-group">
        <label for="usernameInput" class="form-label">ユーザー名</label>
        <input type="text" id="usernameInput" name="username" class="form-control">
      </div>
      <div class="form-group mt-3">
        <button type="submit" class="btn btn-primary btn-block">ログイン</button>
      </div>
    </form>
  </div>
</body>
</html>



