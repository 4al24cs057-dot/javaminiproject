package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.HospitalDAO;
import com.model.Patient;

@WebServlet("/UpdatePatientServlet")
public class UpdatePatientServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));

            Patient p = new Patient();
            p.setPatientID(id);
            p.setPatientName(request.getParameter("name"));
            p.setAge(Integer.parseInt(request.getParameter("age")));
            p.setGender(request.getParameter("gender"));
            p.setAdmissionDate(request.getParameter("date"));
            p.setAilment(request.getParameter("ailment"));
            p.setAssignedDoctor(request.getParameter("doctor"));

            HospitalDAO dao = new HospitalDAO();
            boolean status = dao.updatePatient(p);

            if (status) {
                // go through servlet, not JSP
                response.sendRedirect("DisplayPatientServlet");
            } else {
                response.getWriter().println("Update Failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Server Error");
        }
    }
}