<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reports</title>
</head>

<body>

<h2>Reports</h2>

<!-- Search By Ailment -->
<form action="ReportServlet" method="post">
    <input type="hidden" name="criteria" value="ailment">
    Enter Ailment:
    <input type="text" name="ailment">
    <input type="submit" value="Search">
</form>

<br><br>

<!-- Search By Doctor -->
<form action="ReportServlet" method="post">
    <input type="hidden" name="criteria" value="doctor">
    Enter Doctor:
    <input type="text" name="doctor">
    <input type="submit" value="Search">
</form>

<br><br>

<!-- Search By Date Range -->
<form action="ReportServlet" method="post">
    <input type="hidden" name="criteria" value="dateRange">
    From:
    <input type="date" name="startDate">
    To:
    <input type="date" name="endDate">
    <input type="submit" value="Search">
</form>

</body>
</html>