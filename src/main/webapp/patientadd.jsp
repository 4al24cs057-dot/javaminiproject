<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Add Patient | MediCare HMS</title>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
  <style>
    :root {
      --navy: #0a1628; --teal: #0d9488; --teal-light: #14b8a6;
      --green: #10b981; --muted: #64748b; --danger: #ef4444;
    }
    * { margin:0; padding:0; box-sizing:border-box; }
    body {
      font-family: 'DM Sans', sans-serif;
      background: var(--navy); min-height: 100vh;
      display: flex; flex-direction: column;
    }
    .bg-pattern {
      position: fixed; inset: 0; z-index: 0;
      background: radial-gradient(ellipse 70% 50% at 10% 20%, rgba(13,148,136,0.15) 0%, transparent 55%), var(--navy);
    }
    nav {
      position: relative; z-index: 10;
      padding: 18px 40px;
      display: flex; align-items: center; gap: 12px;
      border-bottom: 1px solid rgba(255,255,255,0.07);
    }
    .logo { font-family:'Playfair Display',serif; font-size:20px; color:white; }
    .logo span { color: var(--teal-light); }
    .back-btn {
      margin-left: auto; text-decoration: none;
      color: var(--muted); font-size: 14px; transition: color 0.2s;
    }
    .back-btn:hover { color: white; }

    .page-body {
      position: relative; z-index: 10; flex: 1;
      display: flex; align-items: center; justify-content: center; padding: 40px 20px;
    }
    .form-card {
      background: rgba(255,255,255,0.04);
      border: 1px solid rgba(255,255,255,0.1);
      border-radius: 24px; padding: 40px 48px;
      width: 100%; max-width: 540px;
      backdrop-filter: blur(12px);
    }
    .form-header { margin-bottom: 28px; }
    .form-header .icon {
      width: 52px; height: 52px;
      background: rgba(16,185,129,0.15); border-radius: 14px;
      display: flex; align-items: center; justify-content: center;
      font-size: 24px; margin-bottom: 14px;
    }
    .form-header h2 {
      font-family: 'Playfair Display', serif;
      font-size: 26px; color: white; margin-bottom: 6px;
    }
    .form-header p { color: var(--muted); font-size: 14px; }

    /* Error banner */
    .error-box {
      background: rgba(239,68,68,0.1);
      border: 1px solid rgba(239,68,68,0.3);
      border-radius: 10px; padding: 12px 16px;
      color: #fca5a5; font-size: 14px; margin-bottom: 20px;
      display: none;
    }
    .error-box.show { display: block; }

    .form-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 16px; }
    .form-group { display: flex; flex-direction: column; gap: 7px; }
    .form-group.full { grid-column: 1 / -1; }

    label {
      font-size: 12px; font-weight: 600; letter-spacing: 0.8px;
      color: var(--muted); text-transform: uppercase;
    }
    input, select {
      background: rgba(255,255,255,0.07);
      border: 1px solid rgba(255,255,255,0.1);
      border-radius: 10px; padding: 11px 14px;
      color: white; font-family: 'DM Sans', sans-serif; font-size: 15px;
      outline: none; transition: all 0.2s; width: 100%;
    }
    input::placeholder { color: rgba(255,255,255,0.25); }
    input:focus, select:focus {
      border-color: var(--teal);
      background: rgba(13,148,136,0.1);
      box-shadow: 0 0 0 3px rgba(13,148,136,0.15);
    }
    select option { background: #1e293b; }

    .submit-btn {
      margin-top: 28px; width: 100%; padding: 14px;
      background: linear-gradient(135deg, var(--teal), var(--green));
      color: white; border: none; border-radius: 12px;
      font-family: 'DM Sans', sans-serif; font-size: 16px; font-weight: 600;
      cursor: pointer; transition: all 0.3s;
      box-shadow: 0 8px 20px rgba(13,148,136,0.35);
    }
    .submit-btn:hover { transform: translateY(-2px); box-shadow: 0 12px 28px rgba(13,148,136,0.45); }
  </style>
</head>
<body>
  <div class="bg-pattern"></div>
  <nav>
    <div style="font-size:20px">🏥</div>
    <div class="logo">Medi<span>Care</span> HMS</div>
    <a href="index.html" class="back-btn">← Back to Dashboard</a>
  </nav>

  <div class="page-body">
    <div class="form-card">
      <div class="form-header">
        <div class="icon">➕</div>
        <h2>Add New Patient</h2>
        <p>Fill in the details to register a new patient</p>
      </div>

      <%-- Show error messages based on URL parameter --%>
      <%
        String err = request.getParameter("error");
        String errMsg = "";
        if ("missing".equals(err))       errMsg = "⚠️ Please fill in all required fields.";
        else if ("age".equals(err))      errMsg = "⚠️ Invalid age. Please enter a valid number.";
        else if ("db".equals(err))       errMsg = "⚠️ Database error. Check Tomcat console logs.";
        else if ("server".equals(err))   errMsg = "⚠️ Server error. Check Tomcat console logs.";
      %>
      <div class="error-box <%= (errMsg.isEmpty() ? "" : "show") %>">
        <%= errMsg %>
      </div>

      <form action="AddPatientServlet" method="post">
        <div class="form-grid">

          <%-- NO patient_id field — MySQL AUTO_INCREMENT handles it --%>

          <div class="form-group full">
            <label>Full Name</label>
            <input type="text" name="name" placeholder="Patient's full name" required>
          </div>
          <div class="form-group">
            <label>Age</label>
            <input type="number" name="age" placeholder="e.g. 34" min="0" max="150" required>
          </div>
          <div class="form-group">
            <label>Gender</label>
            <select name="gender">
              <option value="Male">Male</option>
              <option value="Female">Female</option>
              <option value="Other">Other</option>
            </select>
          </div>
          <div class="form-group full">
            <label>Admission Date</label>
            <input type="date" name="date" required>
          </div>
          <div class="form-group full">
            <label>Ailment / Diagnosis</label>
            <input type="text" name="ailment" placeholder="e.g. Fever, Diabetes">
          </div>
          <div class="form-group full">
            <label>Assigned Doctor</label>
            <input type="text" name="doctor" placeholder="Doctor's name">
          </div>
        </div>
        <button type="submit" class="submit-btn">Register Patient</button>
      </form>
    </div>
  </div>
</body>
</html>
