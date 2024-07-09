/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Registration;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import dal.UserDBContext;
import entity.User;
import java.util.Date;
import java.util.Random;

/**
 *
 * @author nocol
 */
public class RegistrationDBContext extends DBContext<Registration> {

    public Registration toRegistration(ResultSet rs) throws SQLException {
        Registration registration = new Registration();
        registration.setId(rs.getInt("id"));
        UserDBContext dbUser = new UserDBContext();
        User user = dbUser.getUserByUsername(rs.getString("username"));
        registration.setUsername(user);
        registration.setFullname(rs.getString("fullname"));
        registration.setNameOfCar(rs.getString("nameOfCar"));
        registration.setCodeCar(rs.getString("CodeCar"));
        registration.setAccepted(rs.getInt("accepted"));
        registration.setCreatedAt(rs.getDate("createdAt"));
        return registration;
    }

    @Override
    public ArrayList<Registration> list() {
        ArrayList<Registration> registrations = new ArrayList<>();
        PreparedStatement ps;
        ResultSet rs;

        try {
            String sql = "SELECT * FROM [Registration] ORDER BY createdAt desc";
            ps = connection.prepareStatement(sql);

            rs = ps.executeQuery();
            while (rs.next()) {
                registrations.add(toRegistration(rs));
            }
            return registrations;
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return registrations;
    }

    public ArrayList<Registration> listRegistrationByUsername(String username) {
        ArrayList<Registration> registrations = new ArrayList<>();
        PreparedStatement ps;
        ResultSet rs;

        try {
            String sql = "SELECT * FROM [Registration] where username = ? ORDER BY createdAt desc";
            ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                registrations.add(toRegistration(rs));
            }
            return registrations;
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return registrations;
    }

    @Override
    public Registration get(int id) {
        PreparedStatement ps;
        ResultSet rs;

        try {
            String sql = "SELECT * FROM [Registration] where id =?";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return toRegistration(rs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public Registration insert(Registration model) {
        PreparedStatement ps;
        ResultSet rs;
        try {
            String sql = "INSERT INTO [Registration](username, fullname, nameOfCar,createdAt,accepted) values "
                    + " (?,?,?,?,0);";
            ps = connection.prepareStatement(sql);
            ps.setString(1, model.getUsername().getUsername());
            ps.setString(2, model.getFullname());
            ps.setString(3, model.getNameOfCar());
            Date today = new Date();
            ps.setDate(4, new java.sql.Date(today.getTime()));
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return model;
    }

    @Override
    public void update(Registration model) {
        PreparedStatement ps;
        ResultSet rs;
        try {
            String sql = "update Registration set accepted = ? where id = ?";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, model.getAccepted());
            ps.setInt(2, model.getId());
            ps.executeUpdate();
            if (model.getAccepted() == 1) {
                sql = "update Registration set CodeCar = ? where id = ?";
                ps = connection.prepareStatement(sql);
                String licenseCar = generateLicenseCar();
                licenseCar = licenseCar;
                ArrayList<Registration> regises = list();
                ArrayList<String> allLicense = new ArrayList<>();
                for (Registration regise : regises) {
                    if (regise.getAccepted() == 1) {
                        allLicense.add(regise.getCodeCar());
                    }
                }
                while (allLicense.contains(licenseCar)) {
                    licenseCar = generateLicenseCar();
                }
                ps.setString(1, licenseCar);
                ps.setInt(2, model.getId());
                ps.executeUpdate();

            }
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public boolean checkIdCarExists(String idCar) {
        PreparedStatement ps;
        ResultSet rs;

        try {
            String sql = "SELECT * FROM [Registration] where IdCar =?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, idCar);
            rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
            return false;
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // Define the characters to choose from (64 unique characters)
    private static final String CHARACTERS = "0123456789";

    // Length of the OTP code
    private static final int OTP_LENGTH = 8;

    public static String generateLicenseCar() {
        Random random = new Random();
        StringBuilder otp = new StringBuilder(OTP_LENGTH);

        for (int i = 0; i < OTP_LENGTH; i++) {
            int randomIndex = random.nextInt(CHARACTERS.length());
            char randomChar = CHARACTERS.charAt(randomIndex);
            otp.append(randomChar);
        }

        return otp.toString();
    }

}
