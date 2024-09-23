/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.Shoes;
import Utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ptd
 */
public class ShoesDAO {

    //step 1
    Connection con = null;
    //step 2 
    PreparedStatement pst = null;
    //step 3
    ResultSet rs = null;

    public List<Shoes> getAllShoes() throws SQLException {
        List<Shoes> list = new ArrayList<>();
        //step 1: create connection
        try {
            con = DBUtils.getConnection();
            String sql = "select shoesId, description, price, shoesName, yearOfProduction, quantity, notSale, image\n"
                    + "from tbl_Shoes where notSale = 0"; //notSale=0?
            //step2: create request to db
            pst = con.prepareStatement(sql);
            //step3: create result set 
            rs = pst.executeQuery();

            while (rs.next()) {
                String shoesId = rs.getString("shoesId");
                String description = rs.getString("description");
                float price = rs.getFloat("price");
                String shoesName = rs.getString("shoesName");
                int yearOfProduction = rs.getInt("yearOfProduction");
                int quantity = rs.getInt("quantity");
                boolean notSale = rs.getBoolean("notSale");
                String image = rs.getString("image");

                list.add(new Shoes(shoesId, description, price, shoesName, yearOfProduction, quantity, notSale, image));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }

    public List<Shoes> searchShoesByIdOrName(String searchValue) throws SQLException {
        List<Shoes> list = new ArrayList<>();
        try {
            //crate connection
            con = DBUtils.getConnection();
            String sql = "select shoesId, description, price, shoesName, yearOfProduction, quantity, notSale, image\n"
                    + "from tbl_Shoes\n"
                    + "where shoesName like ? or shoesId like ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, "%" + searchValue + "%");
            pst.setString(2, "%" + searchValue + "%");
            rs = pst.executeQuery();

            while (rs.next()) {
                String shoesId = rs.getString("shoesId");
                String description = rs.getString("description");
                float price = rs.getFloat("price");
                String shoesName = rs.getString("shoesName");
                int yearOfProduction = rs.getInt("yearOfProduction");
                int quantity = rs.getInt("quantity");
                boolean notSale = rs.getBoolean("notSale");
                String image = rs.getString("image");

                list.add(new Shoes(shoesId, description, price, shoesName, yearOfProduction, quantity, notSale, image));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }

    public boolean addShoes(Shoes mobile) throws SQLException {
        boolean result = false;
        try {
            con = DBUtils.getConnection();
            String sql = "insert into tbl_Shoes(description,image,shoesId,shoesName,notSale,price,quantity,yearOfProduction)\n"
                    + "values(?,?,?,?,?,?,?,?)";

            pst = con.prepareStatement(sql);
            pst.setString(1, mobile.getDescription());
            pst.setString(2, mobile.getImage());
            pst.setString(3, mobile.getShoesId());
            pst.setString(4, mobile.getShoesName());
            pst.setBoolean(5, mobile.isNotSale());
            pst.setFloat(6, mobile.getPrice());
            pst.setInt(7, mobile.getQuantity());
            pst.setInt(8, mobile.getYearOfProduction());

            int rs = pst.executeUpdate();
            if (rs > 0) {
                result = true;
            }
        } finally {
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return result;
    }

    public boolean deleteShoes(String shoesId) throws SQLException {
        boolean result = false;
        try {
            con = DBUtils.getConnection();
            String sql = "delete from tbl_Shoes\n"
                    + "where shoesId = ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, shoesId);
            int rs = pst.executeUpdate();
            if (rs > 0) {
                result = true;
            }
        } finally {
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return result;
    }

    public boolean updateShoes(Shoes mobile) throws SQLException {
        boolean result = false;
        try {
            con = DBUtils.getConnection();
            String sql = "update tbl_Shoes\n"
                    + "set description = ?, price = ?, quantity = ?, notSale = ?\n"
                    + "where shoesId = ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, mobile.getDescription());
            pst.setFloat(2, mobile.getPrice());
            pst.setInt(3, mobile.getQuantity());
            pst.setBoolean(4, mobile.isNotSale());
            pst.setString(5, mobile.getShoesId());
                        
            int rs = pst.executeUpdate();
            if(rs > 0){
                result = true;
            }
        } finally {
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return result;
    }

    public List<Shoes> searchShoesByRange(float minPrice, float maxPrice) throws SQLException {
      
        List<Shoes> list = new ArrayList<>();
        try {
            //crate connection
            con = DBUtils.getConnection();
            String sql = "select shoesId, description, price, shoesName, yearOfProduction, quantity, notSale, image\n"
                    + "from tbl_Shoes\n"
                    + "where price >= ? and price <= ?";
            pst = con.prepareStatement(sql);
            pst.setFloat(1, minPrice);
            pst.setFloat(2, maxPrice);
            rs = pst.executeQuery();

            while (rs.next()) {
                String shoesId = rs.getString("shoesId");
                String description = rs.getString("description");
                float price = rs.getFloat("price");
                String shoesName = rs.getString("shoesName");
                int yearOfProduction = rs.getInt("yearOfProduction");
                int quantity = rs.getInt("quantity");
                boolean notSale = rs.getBoolean("notSale");
                String image = rs.getString("image");

                list.add(new Shoes(shoesId, description, price, shoesName, yearOfProduction, quantity, notSale, image));
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    
    }
public Shoes getShoesById(String shoesId) throws SQLException {
    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    try {
        con = DBUtils.getConnection();
        String sql = "SELECT shoesId, description, price, shoesName, yearOfProduction, quantity, notSale, image\n"
                   + "FROM tbl_Shoes\n"
                   + "WHERE shoesId = ?";
        pst = con.prepareStatement(sql);
        pst.setString(1, shoesId);
        rs = pst.executeQuery();

        if (rs.next()) {
            String description = rs.getString("description");
            float price = rs.getFloat("price");
            String shoesName = rs.getString("shoesName");
            int yearOfProduction = rs.getInt("yearOfProduction");
            int quantity = rs.getInt("quantity");
            boolean notSale = rs.getBoolean("notSale");
            String image = rs.getString("image");

            return new Shoes(shoesId, description, price, shoesName, yearOfProduction, quantity, notSale, image);
        }
    } finally {
        // Close resources in finally block to ensure they are always closed
        if (rs != null) {
            rs.close();
        }
        if (pst != null) {
            pst.close();
        }
        if (con != null) {
            con.close();
        }
    }
    return null; // Return null if mobile with given ID is not found
}
}
