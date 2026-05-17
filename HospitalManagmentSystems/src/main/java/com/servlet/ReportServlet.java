package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.HospitalDAO;
import com.model.Patient;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String criteria = request.getParameter("criteria");

            HospitalDAO dao = new HospitalDAO();
            List<Patient> patients = null;

            // ✅ Search by Ailment
            if ("ailment".equals(criteria)) {

                String ailment = request.getParameter("ailment");

                patients = dao.getPatientsByAilment(ailment);
            }

            // ✅ Search by Doctor
            else if ("doctor".equals(criteria)) {

                String doctor = request.getParameter("doctor");

                patients = dao.getPatientsByDoctor(doctor);
            }

            // ✅ Search by Date Range
            else if ("dateRange".equals(criteria)) {

                String startDate = request.getParameter("startDate");
                String endDate = request.getParameter("endDate");

                patients = dao.getByDateRange(startDate, endDate);
            }

            // send data to JSP
            request.setAttribute("patients", patients);

            if (patients == null || patients.isEmpty()) {
                request.setAttribute("message", "No records found!");
            }

            request.getRequestDispatcher("report_result.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error generating report");
        }
    }
}