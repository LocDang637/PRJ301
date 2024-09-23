/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

import java.io.Serializable;

/**
 *
 * @author PC
 */
public class Shoes implements Serializable {
    private String shoesId;
    private String description;
    private float price;
    private String shoesName;
    private int yearOfProduction;
    private int quantity;
    private boolean notSale;
    private String image;

    public Shoes() {
    }

    public Shoes(String shoesId, String description, float price, String shoesName, int yearOfProduction, int quantity, boolean notSale, String image) {
        this.shoesId = shoesId;
        this.description = description;
        this.price = price;
        this.shoesName = shoesName;
        this.yearOfProduction = yearOfProduction;
        this.quantity = quantity;
        this.notSale = notSale;
        this.image = image;
    }

    public String getShoesId() {
        return shoesId;
    }

    public void setShoesId(String shoesId) {
        this.shoesId = shoesId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getShoesName() {
        return shoesName;
    }

    public void setShoesName(String shoesName) {
        this.shoesName = shoesName;
    }

    public int getYearOfProduction() {
        return yearOfProduction;
    }

    public void setYearOfProduction(int yearOfProduction) {
        this.yearOfProduction = yearOfProduction;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public boolean isNotSale() {
        return notSale;
    }

    public void setNotSale(boolean notSale) {
        this.notSale = notSale;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Shoes{" + "shoesId=" + shoesId + ", description=" + description + ", price=" + price + ", shoesName=" + shoesName + ", yearOfProduction=" + yearOfProduction + ", quantity=" + quantity + ", notSale=" + notSale + ", image=" + image + '}';
    }
    
    
}
