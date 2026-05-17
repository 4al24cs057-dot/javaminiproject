<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Delete Patient | MediCare HMS</title>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
  <style>
    :root { --navy:#0a1628; --teal:#0d9488; --teal-light:#14b8a6; --danger:#ef4444; --muted:#64748b; }
    * { margin:0; padding:0; box-sizing:border-box; }
    body {
      font-family:'DM Sans',sans-serif; background:var(--navy);
      min-height:100vh; display:flex; flex-direction:column;
    }
    .bg-pattern {
      position:fixed; inset:0; z-index:0;
      background:radial-gradient(ellipse 70% 50% at 50% 20%,rgba(239,68,68,0.1) 0%,transparent 60%),var(--navy);
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
      border:1px solid rgba(239,68,68,0.2);
      border-radius:24px; padding:40px 48px;
      width:100%; max-width:440px;
      backdrop-filter:blur(12px); text-align:center;
    }
    .danger-icon {
      width:72px; height:72px; margin:0 auto 20px;
      background:rgba(239,68,68,0.12);
      border:1px solid rgba(239,68,68,0.3);
      border-radius:50%; display:flex; align-items:center; justify-content:center;
      font-size:32px;
    }
    h2 { font-family:'Playfair Display',serif; font-size:26px; color:white; margin-bottom:8px; }
    .sub { color:var(--muted); font-size:14px; margin-bottom:28px; }

    .warning-box {
      background:rgba(239,68,68,0.08); border:1px solid rgba(239,68,68,0.2);
      border-radius:10px; padding:12px 16px;
      color:#fca5a5; font-size:13px; margin-bottom:24px; text-align:left;
    }

    label { display:block; text-align:left; font-size:12px; font-weight:600;
      letter-spacing:0.8px; color:var(--muted); text-transform:uppercase; margin-bottom:7px; }
    input[type="number"] {
      width:100%; background:rgba(255,255,255,0.07);
      border:1px solid rgba(255,255,255,0.1);
      border-radius:10px; padding:12px 16px;
      color:white; font-family:'DM Sans',sans-serif; font-size:16px;
      outline:none; transition:all 0.2s; text-align:center; letter-spacing:2px;
    }
    input[type="number"]:focus {
      border-color:var(--danger); background:rgba(239,68,68,0.08);
      box-shadow:0 0 0 3px rgba(239,68,68,0.15);
    }
    input[type="number"]::placeholder { color:rgba(255,255,255,0.25); letter-spacing:0; }

    .btn {
      margin-top:20px; width:100%; padding:14px;
      background:linear-gradient(135deg,#ef4444,#dc2626);
      color:white; border:none; border-radius:12px;
      font-family:'DM Sans',sans-serif; font-size:16px; font-weight:600;
      cursor:pointer; transition:all 0.3s;
      box-shadow:0 8px 20px rgba(239,68,68,0.3);
    }
    .btn:hover { transform:translateY(-2px); box-shadow:0 12px 28px rgba(239,68,68,0.4); }
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
      <div class="danger-icon">🗑️</div>
      <h2>Delete Patient</h2>
      <p class="sub">Remove a patient record permanently</p>

      <div class="warning-box">
        ⚠️ This action cannot be undone. Please double-check the Patient ID before proceeding.
      </div>

      <form action="DeletePatientServlet" method="post">
        <label>Patient ID</label>
        <input type="number" name="id" placeholder="Enter Patient ID" required>
        <button type="submit" class="btn">Delete Patient Record</button>
      </form>
    </div>
  </div>
</body>
</html>
