<%@ page import="java.util.*,com.model.Patient" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Patient Records | MediCare HMS</title>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
  <style>
    :root {
      --navy:#0a1628; --teal:#0d9488; --teal-light:#14b8a6;
      --muted:#64748b; --danger:#ef4444;
    }
    * { margin:0; padding:0; box-sizing:border-box; }
    body {
      font-family: 'DM Sans', sans-serif;
      background: var(--navy); min-height: 100vh; color: white;
    }
    .bg-pattern {
      position: fixed; inset: 0; z-index: 0;
      background:
        radial-gradient(ellipse 60% 40% at 80% 10%, rgba(13,148,136,0.12) 0%, transparent 55%),
        var(--navy);
    }
    nav {
      position: relative; z-index: 10;
      padding: 18px 40px;
      display: flex; align-items: center; gap: 12px;
      border-bottom: 1px solid rgba(255,255,255,0.07);
    }
    .logo { font-family:'Playfair Display',serif; font-size:20px; }
    .logo span { color: var(--teal-light); }
    .back-btn {
      margin-left: auto; text-decoration: none;
      color: var(--muted); font-size: 14px; transition: color 0.2s;
    }
    .back-btn:hover { color: white; }

    .page-body {
      position: relative; z-index: 10;
      padding: 40px;
    }
    .page-header {
      display: flex; align-items: center; justify-content: space-between;
      margin-bottom: 28px;
    }
    .page-header h2 {
      font-family: 'Playfair Display', serif; font-size: 28px;
    }
    .page-header p { color: var(--muted); font-size: 14px; margin-top: 4px; }
    .count-badge {
      background: rgba(13,148,136,0.15);
      border: 1px solid rgba(13,148,136,0.3);
      color: var(--teal-light); padding: 6px 16px;
      border-radius: 100px; font-size: 13px; font-weight: 600;
    }

    .table-wrap {
      background: rgba(255,255,255,0.03);
      border: 1px solid rgba(255,255,255,0.08);
      border-radius: 20px; overflow: hidden;
    }
    table { width: 100%; border-collapse: collapse; }
    thead tr {
      background: rgba(13,148,136,0.12);
      border-bottom: 1px solid rgba(255,255,255,0.08);
    }
    th {
      padding: 14px 18px; text-align: left;
      font-size: 11px; font-weight: 700;
      letter-spacing: 1px; text-transform: uppercase;
      color: var(--teal-light);
    }
    tbody tr {
      border-bottom: 1px solid rgba(255,255,255,0.05);
      transition: background 0.2s;
    }
    tbody tr:last-child { border-bottom: none; }
    tbody tr:hover { background: rgba(255,255,255,0.04); }
    td { padding: 14px 18px; font-size: 14px; color: rgba(255,255,255,0.85); }

    .id-cell {
      font-family: monospace; font-size: 13px;
      color: var(--teal-light); font-weight: 700;
    }
    .name-cell { font-weight: 600; color: white; }

    .gender-badge {
      display: inline-block; padding: 3px 10px;
      border-radius: 100px; font-size: 12px; font-weight: 600;
    }
    .gender-badge.male {
      background: rgba(59,130,246,0.15); color: #60a5fa;
    }
    .gender-badge.female {
      background: rgba(236,72,153,0.15); color: #f472b6;
    }
    .ailment-cell { color: #fbbf24; }

    .empty-state {
      text-align: center; padding: 60px 20px;
      color: var(--muted); font-size: 16px;
    }
    .empty-state .icon { font-size: 48px; margin-bottom: 12px; }
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
    <%
      List<Patient> list = (List<Patient>) request.getAttribute("patientList");
      int count = (list != null) ? list.size() : 0;
    %>
    <div class="page-header">
      <div>
        <h2>Patient Records</h2>
        <p>All registered patients in the system</p>
      </div>
      <div class="count-badge"><%= count %> Patients</div>
    </div>

    <div class="table-wrap">
      <% if (list == null || list.isEmpty()) { %>
      <div class="empty-state">
        <div class="icon">📋</div>
        <p>No patient records found. Add a patient to get started.</p>
      </div>
      <% } else { %>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Patient Name</th>
            <th>Age</th>
            <th>Gender</th>
            <th>Admission Date</th>
            <th>Ailment</th>
            <th>Assigned Doctor</th>
          </tr>
        </thead>
        <tbody>
          <% for (Patient p : list) { %>
          <tr>
            <td class="id-cell">#<%= p.getPatientID() %></td>
            <td class="name-cell"><%= p.getPatientName() %></td>
            <td><%= p.getAge() %> yrs</td>
            <td>
              <span class="gender-badge <%= p.getGender().equalsIgnoreCase("Female") ? "female" : "male" %>">
                <%= p.getGender() %>
              </span>
            </td>
            <td><%= p.getAdmissionDate() %></td>
            <td class="ailment-cell"><%= p.getAilment() %></td>
            <td>Dr. <%= p.getAssignedDoctor() %></td>
          </tr>
          <% } %>
        </tbody>
      </table>
      <% } %>
    </div>
  </div>
</body>
</html>
