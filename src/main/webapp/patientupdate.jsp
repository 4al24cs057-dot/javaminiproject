<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Update Patient | MediCare HMS</title>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
  <style>
    :root { --navy:#0a1628; --teal:#0d9488; --teal-light:#14b8a6; --gold:#f59e0b; --muted:#64748b; }
    * { margin:0; padding:0; box-sizing:border-box; }
    body {
      font-family:'DM Sans',sans-serif; background:var(--navy);
      min-height:100vh; display:flex; flex-direction:column;
    }
    .bg-pattern {
      position:fixed; inset:0; z-index:0;
      background:radial-gradient(ellipse 70% 50% at 80% 30%,rgba(245,158,11,0.1) 0%,transparent 60%),var(--navy);
    }
    nav {
      position:relative; z-index:10; padding:18px 40px;
      display:flex; align-items:center; gap:12px;
      border-bottom:1px solid rgba(255,255,255,0.07);
    }
    .logo { font-family:'Playfair Display',serif; font-size:20px; color:white; }
    .logo span { color:var(--teal-light); }
    .back-btn { margin-left:auto; text-decoration:none; color:var(--muted); font-size:14px; transition:color 0.2s; }
    .back-btn:hover { color:white; }

    .page-body {
      position:relative; z-index:10; flex:1;
      display:flex; align-items:center; justify-content:center; padding:40px 20px;
    }
    .form-card {
      background:rgba(255,255,255,0.04);
      border:1px solid rgba(255,255,255,0.1);
      border-radius:24px; padding:40px 48px;
      width:100%; max-width:540px;
      backdrop-filter:blur(12px);
    }
    .form-header { margin-bottom:28px; }
    .form-header .icon {
      width:52px; height:52px;
      background:rgba(245,158,11,0.15); border-radius:14px;
      display:flex; align-items:center; justify-content:center;
      font-size:24px; margin-bottom:14px;
    }
    .form-header h2 { font-family:'Playfair Display',serif; font-size:26px; color:white; margin-bottom:6px; }
    .form-header p { color:var(--muted); font-size:14px; }

    .form-grid { display:grid; grid-template-columns:1fr 1fr; gap:16px; }
    .form-group { display:flex; flex-direction:column; gap:7px; }
    .form-group.full { grid-column:1/-1; }

    label { font-size:12px; font-weight:600; letter-spacing:0.8px; color:var(--muted); text-transform:uppercase; }
    input, select {
      background:rgba(255,255,255,0.07);
      border:1px solid rgba(255,255,255,0.1);
      border-radius:10px; padding:11px 14px;
      color:white; font-family:'DM Sans',sans-serif; font-size:15px;
      outline:none; transition:all 0.2s; width:100%;
    }
    input::placeholder { color:rgba(255,255,255,0.25); }
    input:focus, select:focus {
      border-color:var(--gold); background:rgba(245,158,11,0.08);
      box-shadow:0 0 0 3px rgba(245,158,11,0.12);
    }
    select option { background:#1e293b; }

    .submit-btn {
      margin-top:28px; width:100%; padding:14px;
      background:linear-gradient(135deg,var(--gold),#d97706);
      color:white; border:none; border-radius:12px;
      font-family:'DM Sans',sans-serif; font-size:16px; font-weight:600;
      cursor:pointer; transition:all 0.3s;
      box-shadow:0 8px 20px rgba(245,158,11,0.3);
    }
    .submit-btn:hover { transform:translateY(-2px); box-shadow:0 12px 28px rgba(245,158,11,0.4); }
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
        <div class="icon">✏️</div>
        <h2>Update Patient</h2>
        <p>Modify existing patient information</p>
      </div>

      <form action="UpdatePatientServlet" method="post">
        <div class="form-grid">
          <div class="form-group">
            <label>Patient ID</label>
            <input type="number" name="id" placeholder="e.g. 1001" required>
          </div>
          <div class="form-group">
            <label>Age</label>
            <input type="number" name="age" placeholder="e.g. 34" required>
          </div>
          <div class="form-group full">
            <label>Full Name</label>
            <input type="text" name="name" placeholder="Patient's full name" required>
          </div>
          <div class="form-group">
            <label>Gender</label>
            <select name="gender">
              <option value="Male">Male</option>
              <option value="Female">Female</option>
              <option value="Other">Other</option>
            </select>
          </div>
          <div class="form-group">
            <label>Admission Date</label>
            <input type="date" name="date" required>
          </div>
          <div class="form-group full">
            <label>Ailment / Diagnosis</label>
            <input type="text" name="ailment" placeholder="e.g. Fever, Diabetes" required>
          </div>
          <div class="form-group full">
            <label>Assigned Doctor</label>
            <input type="text" name="doctor" placeholder="Doctor's name" required>
          </div>
        </div>
        <button type="submit" class="submit-btn">Update Patient Record</button>
      </form>
    </div>
  </div>
</body>
</html>
