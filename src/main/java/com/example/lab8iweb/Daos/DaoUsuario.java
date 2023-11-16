package com.example.lab8iweb.Daos;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoUsuario extends DaoBase{

    public ArrayList<Job> listarTrabajos() {

        ArrayList<Job> lista = new ArrayList<>();

        String sql = "SELECT * FROM jobs";

        try (Connection conn = this.getConection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Job job = new Job();
                job.setJobId(rs.getString(1));
                job.setJobTitle(rs.getString(2));
                job.setMinSalary(rs.getInt(3));
                job.setMaxSalary(rs.getInt(4));
                lista.add(job);
            }
        } catch (SQLException ex) {
            Logger.getLogger(JobDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }


}
