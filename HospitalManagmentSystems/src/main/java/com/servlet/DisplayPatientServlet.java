package com.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.HospitalDAO;
import com.model.Patient;

@WebServlet("/DisplayPatientServlet")
public class DisplayPatientServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HospitalDAO dao = new HospitalDAO();
        List<Patient> list = dao.getAllPatients();

        request.setAttribute("patientList", list);
        request.getRequestDispatcher("patientdisplay.jsp")
               .forward(request, response);
    }
}
