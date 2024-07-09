package dal;

import entity.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nocol
 */
public class UserDBContext extends DBContext<User> {

    public User toUser(ResultSet rs) throws SQLException {
        User user = new User();
        user.setUsername(rs.getString("username"));
        user.setPassword(rs.getString("password"));
        user.setDisplayName(rs.getString("displayName"));
        user.setEmail(rs.getString("email"));
        user.setDob(rs.getDate("dob"));
        user.setPhoneNumber(rs.getString("phoneNumber"));
        user.setRegistedAt(rs.getDate("registerAt"));
        user.setLastLogin(rs.getDate("lastLogin"));
        user.setIsAdmin(rs.getInt("isAdmin"));

        return user;
    }

    @Override
    public ArrayList<User> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public User get(int id) {
        System.out.println("NOT FOUND!!!!");
        return null;
    }

    public User getUserByUsername(String username) {
        PreparedStatement ps;
        ResultSet rs;

        try {
            String sql = "SELECT * FROM [User] where username = ?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = toUser(rs);
                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public User getUserByUsernameAndPassword(String username,String password) {
        PreparedStatement ps;
        ResultSet rs;

        try {
            String sql = "SELECT * FROM [User] where username = ? and password = ?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = toUser(rs);
                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public User insert(User model) {
          PreparedStatement ps;
        ResultSet rs;
        try {
            String sql = "  insert into [User](username,password,displayName, email, dob, phoneNumber, registerAt, lastLogin, isAdmin) "
                    + "values (?,?,'1','1','2023-12-12','123','2023-12-12','2023-12-12',0)";
            ps = connection.prepareStatement(sql);
            ps.setString(1, model.getUsername());
            ps.setString(2, model.getPassword());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return model;
    }

    @Override
    public void update(User model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
