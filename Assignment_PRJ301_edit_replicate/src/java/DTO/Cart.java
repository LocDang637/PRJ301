/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

import java.io.Serializable;

/**
 *
 * @author ptd
 */
public class Cart implements Serializable {

    private int cartId;
    private String userId;
    private String shoesId;
    private int quantity;

    public Cart() {
    }

    public Cart(int cartId, String userId, String shoesId, int quantity) {
        this.cartId = cartId;
        this.userId = userId;
        this.shoesId = shoesId;
        this.quantity = quantity;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getShoesId() {
        return shoesId;
    }

    public void setShoesId(String shoesId) {
        this.shoesId = shoesId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
