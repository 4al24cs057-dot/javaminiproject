package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.HospitalDAO;

@WebServlet("/DeletePatientServlet")
public class DeletePatientServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));

            HospitalDAO dao = new HospitalDAO();
            boolean status = dao.deletePatient(id);

            if (status) {
                response.sendRedirect("patientdisplay.jsp");
            } else {
                response.getWriter().println("Error Deleting Patient");
            }

        } catch (NumberFormatException e) {
            response.getWriter().println("Invalid Patient ID!");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Server Error!");
        }
    }
}