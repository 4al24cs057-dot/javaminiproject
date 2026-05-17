<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hospital Management System</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background: linear-gradient(to right, #4facfe, #00f2fe);
            text-align: center;
        }

        .container {
            margin-top: 80px;
        }

        h1 {
            color: white;
            margin-bottom: 40px;
        }

        a {
            display: block;
            width: 260px;
            margin: 15px auto;
            padding: 12px;
            text-decoration: none;
            background-color: white;
            color: #333;
            font-size: 18px;
            border-radius: 6px;
            box-shadow: 0 5px 10px rgba(0,0,0,0.2);
            transition: 0.3s;
        }

        a:hover {
            background-color: #007bff;
            color: white;
        }
    </style>
</head>

<body>

<div class="container">
    <h1>Hospital Management System</h1>

    <a href="patientadd.jsp">Add Patient</a>
    <a href="patientdisplay.jsp">View Patients</a>
    <a href="patientdelete.jsp">Delete Patient</a>
    <a href="patientupdate.jsp">Update Patient</a>
    <a href="reports.jsp">Reports</a>
</div>

</body>
</html>