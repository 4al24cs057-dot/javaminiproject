<%@ page import="java.util.*,com.model.Patient" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Report Results | MediCare HMS</title>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
  <style>
    :root { --navy:#0a1628; --teal:#0d9488; --teal-light:#14b8a6; --purple:#8b5cf6; --muted:#64748b; }
    * { margin:0; padding:0; box-sizing:border-box; }
    body { font-family:'DM Sans',sans-serif; background:var(--navy); min-height:100vh; color:white; }
    .bg-pattern {
      position:fixed; inset:0; z-index:0;
      background:radial-gradient(ellipse 60% 40% at 80% 10%,rgba(139,92,246,0.1) 0%,transparent 55%),var(--navy);
    }
    nav {
      position:relative; z-index:10; padding:18px 40px;
      display:flex; align-items:center; gap:12px;
      border-bottom:1px solid rgba(255,255,255,0.07);
    }
    .logo { font-family:'Playfair Display',serif; font-size:20px; }
    .logo span { color:var(--teal-light); }
    .nav-links { margin-left:auto; display:flex; gap:20px; }
    .nav-links a { text-decoration:none; color:var(--muted); font-size:14px; transition:color 0.2s; }
    .nav-links a:hover { color:white; }

    .page-body { position:relative; z-index:10; padding:40px; }
    .page-header { display:flex; align-items:center; justify-content:space-between; margin-bottom:28px; }
    .page-header h2 { font-family:'Playfair Display',serif; font-size:28px; }
    .page-header p { color:var(--muted); font-size:14px; margin-top:4px; }
    .count-badge {
      background:rgba(139,92,246,0.15); border:1px solid rgba(139,92,246,0.3);
      color:#a78bfa; padding:6px 16px; border-radius:100px; font-size:13px; font-weight:600;
    }

    .table-wrap {
      background:rgba(255,255,255,0.03);
      border:1px solid rgba(255,255,255,0.08);
      border-radius:20px; overflow:hidden;
    }
    table { width:100%; border-collapse:collapse; }
    thead tr {
      background:rgba(139,92,246,0.1);
      border-bottom:1px solid rgba(255,255,255,0.08);
    }
    th { padding:14px 18px; text-align:left; font-size:11px; font-weight:700; letter-spacing:1px; text-transform:uppercase; color:#a78bfa; }
    tbody tr { border-bottom:1px solid rgba(255,255,255,0.05); transition:background 0.2s; }
    tbody tr:last-child { border-bottom:none; }
    tbody tr:hover { background:rgba(255,255,255,0.04); }
    td { padding:14px 18px; font-size:14px; color:rgba(255,255,255,0.85); }
    .id-cell { font-family:monospace; font-size:13px; color:#a78bfa; font-weight:700; }
    .name-cell { font-weight:600; color:white; }
    .gender-badge { display:inline-block; padding:3px 10px; border-radius:100px; font-size:12px; font-weight:600; }
    .gender-badge.male { background:rgba(59,130,246,0.15); color:#60a5fa; }
    .gender-badge.female { background:rgba(236,72,153,0.15); color:#f472b6; }
    .ailment-cell { color:#fbbf24; }

    .no-data {
      text-align:center; padding:60px 20px; color:var(--muted);
    }
    .no-data .icon { font-size:48px; margin-bottom:12px; }
    .no-data a { color:var(--teal-light); text-decoration:none; }
  </style>
</head>
<body>
  <div class="bg-pattern"></div>
  <nav>
    <div style="font-size:20px">🏥</div>
    <div class="logo">Medi<span>Care</span> HMS</div>
    <div class="nav-links">
      <a href="reports.jsp">← New Report</a>
      <a href="index.html">Dashboard</a>
    </div>
  </nav>

  <div class="page-body">
    <%
      List<Patient> patients = (List<Patient>) request.getAttribute("patients");
      String message = (String) request.getAttribute("message");
      int count = (patients != null) ? patients.size() : 0;
    %>
    <div class="page-header">
      <div>
        <h2>Report Results</h2>
        <p>Filtered patient records</p>
      </div>
      <div class="count-badge"><%= count %> Records Found</div>
    </div>

    <% if (message != null || patients == null || patients.isEmpty()) { %>
    <div class="table-wrap">
      <div class="no-data">
        <div class="icon">🔍</div>
        <p>No records found matching your criteria.</p>
        <p style="margin-top:10px"><a href="reports.jsp">Try a different filter</a></p>
      </div>
    </div>
    <% } else { %>
    <div class="table-wrap">
      <table>
        <thead>
          <tr>
            <th>ID</th><th>Patient Name</th><th>Age</th><th>Gender</th>
            <th>Admission Date</th><th>Ailment</th><th>Assigned Doctor</th>
          </tr>
        </thead>
        <tbody>
          <% for (Patient p : patients) { %>
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
    </div>
    <% } %>
  </div>
</body>
</html>
