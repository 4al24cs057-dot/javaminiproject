package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.Patient;

public class HospitalDAO {

    private Connection con;

    // ================= CONSTRUCTOR =================
    public HospitalDAO() {

        con = DBConnection.getConnection();

        if (con == null) {
            throw new RuntimeException(
                "Database connection failed. Check MySQL, DB name (hospitaldb), username/password."
            );
        }

        System.out.println("[HospitalDAO] Connected Successfully");
    }

    // ================= ADD PATIENT =================
 // ✅ REMOVE patient_id from INSERT (let AUTO_INCREMENT handle it)
    public boolean addPatient(Patient p) {
        try {
            String sql = "INSERT INTO patient (patient_name, age, gender, admission_date, ailment, assigned_doctor) " +
                         "VALUES (?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, p.getPatientName());
            ps.setInt   (2, p.getAge());
            ps.setString(3, p.getGender());
            ps.setString(4, p.getAdmissionDate());
            ps.setString(5, p.getAilment());
            ps.setString(6, p.getAssignedDoctor());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // ================= DELETE PATIENT =================
    public boolean deletePatient(int id) {

        try {
            String sql = "DELETE FROM patient WHERE patient_id=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // ================= UPDATE PATIENT =================
    public boolean updatePatient(Patient p) {

        try {
            String sql = "UPDATE patient SET patient_name=?, age=?, gender=?, admission_date=?, ailment=?, assigned_doctor=? WHERE patient_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, p.getPatientName());
            ps.setInt(2, p.getAge());
            ps.setString(3, p.getGender());
            ps.setString(4, p.getAdmissionDate());
            ps.setString(5, p.getAilment());
            ps.setString(6, p.getAssignedDoctor());
            ps.setInt(7, p.getPatientID());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // ================= GET ALL PATIENTS =================
    public List<Patient> getAllPatients() {

        List<Patient> list = new ArrayList<>();

        try {
            String sql = "SELECT * FROM patient";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Patient p = new Patient();

                p.setPatientID(rs.getInt("patient_id"));
                p.setPatientName(rs.getString("patient_name"));
                p.setAge(rs.getInt("age"));
                p.setGender(rs.getString("gender"));
                p.setAdmissionDate(rs.getString("admission_date"));
                p.setAilment(rs.getString("ailment"));
                p.setAssignedDoctor(rs.getString("assigned_doctor"));

                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ================= REPORT: AILMENT =================
    public List<Patient> getPatientsByAilment(String ailment) {

        List<Patient> list = new ArrayList<>();

        try {
            String sql = "SELECT * FROM patient WHERE ailment=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, ailment);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Patient p = new Patient();

                p.setPatientID(rs.getInt("patient_id"));
                p.setPatientName(rs.getString("patient_name"));
                p.setAge(rs.getInt("age"));
                p.setGender(rs.getString("gender"));
                p.setAdmissionDate(rs.getString("admission_date"));
                p.setAilment(rs.getString("ailment"));
                p.setAssignedDoctor(rs.getString("assigned_doctor"));

                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ================= REPORT: DOCTOR =================
    public List<Patient> getPatientsByDoctor(String doctor) {

        List<Patient> list = new ArrayList<>();

        try {
            String sql = "SELECT * FROM patient WHERE assigned_doctor=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, doctor);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Patient p = new Patient();

                p.setPatientID(rs.getInt("patient_id"));
                p.setPatientName(rs.getString("patient_name"));
                p.setAge(rs.getInt("age"));
                p.setGender(rs.getString("gender"));
                p.setAdmissionDate(rs.getString("admission_date"));
                p.setAilment(rs.getString("ailment"));
                p.setAssignedDoctor(rs.getString("assigned_doctor"));

                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ================= REPORT: DATE RANGE =================
    public List<Patient> getByDateRange(String start, String end) {

        List<Patient> list = new ArrayList<>();

        try {
            String sql = "SELECT * FROM patient WHERE admission_date BETWEEN ? AND ?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, start);
            ps.setString(2, end);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Patient p = new Patient();

                p.setPatientID(rs.getInt("patient_id"));
                p.setPatientName(rs.getString("patient_name"));
                p.setAge(rs.getInt("age"));
                p.setGender(rs.getString("gender"));
                p.setAdmissionDate(rs.getString("admission_date"));
                p.setAilment(rs.getString("ailment"));
                p.setAssignedDoctor(rs.getString("assigned_doctor"));

                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    
}