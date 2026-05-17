package com.servlet;
 
import java.io.IOException;
import java.io.PrintWriter;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
 
import com.dao.HospitalDAO;
import com.model.Patient;
 
@WebServlet("/AddPatientServlet")
public class AddPatientServlet extends HttpServlet {
 
    private static final long serialVersionUID = 1L;
 
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {
 
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
 
        try {
            // Read all parameters
            String name    = request.getParameter("name");
            String ageStr  = request.getParameter("age");
            String gender  = request.getParameter("gender");
            String date    = request.getParameter("date");
            String ailment = request.getParameter("ailment");
            String doctor  = request.getParameter("doctor");
 
            // Debug: print what was received
            System.out.println("=== AddPatientServlet DEBUG ===");
            System.out.println("name    = " + name);
            System.out.println("age     = " + ageStr);
            System.out.println("gender  = " + gender);
            System.out.println("date    = " + date);
            System.out.println("ailment = " + ailment);
            System.out.println("doctor  = " + doctor);
 
            // Build patient
            Patient p = new Patient();
            p.setPatientName(name != null ? name.trim() : "");
            p.setAge(Integer.parseInt(ageStr.trim()));
            p.setGender(gender != null ? gender.trim() : "");
            p.setAdmissionDate(date != null ? date.trim() : "");
            p.setAilment(ailment != null ? ailment.trim() : "");
            p.setAssignedDoctor(doctor != null ? doctor.trim() : "");
 
            System.out.println("Patient object built successfully.");
 
            // Try DB
            HospitalDAO dao = new HospitalDAO();
            System.out.println("DAO created. Calling addPatient...");
 
            boolean status = dao.addPatient(p);
            System.out.println("addPatient returned: " + status);
 
            if (status) {
                response.sendRedirect("DisplayPatientServlet");
            } else {
                // Show styled error page
                out.println("<!DOCTYPE html><html><head>");
                out.println("<link href='https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;600&display=swap' rel='stylesheet'>");
                out.println("<style>body{font-family:DM Sans,sans-serif;background:#0a1628;color:white;display:flex;align-items:center;justify-content:center;min-height:100vh;margin:0;}");
                out.println(".box{background:rgba(239,68,68,0.1);border:1px solid rgba(239,68,68,0.3);border-radius:16px;padding:40px;max-width:480px;text-align:center;}");
                out.println("h2{color:#f87171;margin-bottom:12px;}p{color:#94a3b8;margin-bottom:20px;}");
                out.println("a{color:#14b8a6;text-decoration:none;font-weight:600;}</style></head><body>");
                out.println("<div class='box'><h2>❌ Database Insert Failed</h2>");
                out.println("<p>The patient object was created successfully but the database insert returned false.</p>");
                out.println("<p>Please check your <strong>Tomcat console</strong> for the SQL error message.</p>");
                out.println("<p>Common fix: Run this SQL in MySQL Workbench:<br><code style='color:#fbbf24'>ALTER TABLE patient MODIFY patient_id INT AUTO_INCREMENT;</code></p>");
                out.println("<a href='patientadd.jsp'>← Try Again</a></div></body></html>");
            }
 
        } catch (NumberFormatException e) {
            System.err.println("[AddPatientServlet] NumberFormatException: " + e.getMessage());
            out.println("<h3 style='color:red'>Invalid Age value entered.</h3><a href='patientadd.jsp'>Go Back</a>");
 
        } catch (NullPointerException e) {
            System.err.println("[AddPatientServlet] NullPointerException: " + e.getMessage());
            e.printStackTrace();
            out.println("<h3 style='color:red'>A field was empty or null.</h3>");
            out.println("<p>Error: " + e.getMessage() + "</p>");
            out.println("<a href='patientadd.jsp'>Go Back</a>");
 
        } catch (Exception e) {
            System.err.println("[AddPatientServlet] Exception: " + e.getClass().getName() + " - " + e.getMessage());
            e.printStackTrace();
            // Show exact error in browser for debugging
            out.println("<!DOCTYPE html><html><head>");
            out.println("<link href='https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;600&display=swap' rel='stylesheet'>");
            out.println("<style>body{font-family:DM Sans,sans-serif;background:#0a1628;color:white;padding:40px;margin:0;}");
            out.println(".box{background:rgba(239,68,68,0.08);border:1px solid rgba(239,68,68,0.25);border-radius:16px;padding:32px;max-width:700px;}");
            out.println("h2{color:#f87171;}pre{background:#1e293b;padding:16px;border-radius:8px;overflow-x:auto;font-size:13px;color:#fca5a5;margin-top:12px;}");
            out.println("a{color:#14b8a6;text-decoration:none;font-weight:600;display:inline-block;margin-top:20px;}</style></head><body>");
            out.println("<div class='box'>");
            out.println("<h2>🔴 Server Exception Caught</h2>");
            out.println("<p><strong>Type:</strong> " + e.getClass().getName() + "</p>");
            out.println("<p><strong>Message:</strong> " + e.getMessage() + "</p>");
            out.println("<pre>");
            e.printStackTrace(out);
            out.println("</pre>");
            out.println("<a href='patientadd.jsp'>← Go Back</a>");
            out.println("</div></body></html>");
        }
    }
}