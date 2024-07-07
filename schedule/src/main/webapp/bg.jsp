<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>背景色の設定</title>
</head>
<body>
    <h1>背景色を選択してください</h1>
    <form method="post" action="SetBackgroundColorServlet">
        <label>
            <input type="radio" name="bgColor" value="#ffffff" <% if ("#ffffff".equals(session.getAttribute("bgColor"))) out.print("checked"); %>> 白
        </label>
        <label>
            <input type="radio" name="bgColor" value="#ffcccc" <% if ("#ffcccc".equals(session.getAttribute("bgColor"))) out.print("checked"); %>> ピンク
        </label>
        <label>
            <input type="radio" name="bgColor" value="#ccffcc" <% if ("#ccffcc".equals(session.getAttribute("bgColor"))) out.print("checked"); %>> 緑
        </label>
        <label>
            <input type="radio" name="bgColor" value="#ccccff" <% if ("#ccccff".equals(session.getAttribute("bgColor"))) out.print("checked"); %>> 青
        </label>
        <button type="submit">設定</button>
    </form>
    <button onclick="location.href='entry.jsp'">戻る</button>
</body>
</html>
