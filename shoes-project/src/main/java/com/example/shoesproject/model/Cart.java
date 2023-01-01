package com.example.shoesproject.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Map;
import java.util.TreeMap;

@Getter
@Setter
public class Cart {

    private TreeMap<Product, Integer> list;
    private long cartId;

    public Cart() {
        list = new TreeMap<>();
        cartId = System.currentTimeMillis();
    }

    public Cart(TreeMap<Product, Integer> list, long cartId) {
        this.list = list;
        this.cartId = cartId;
    }

    public void insertCart(Product product, int amount) {
        boolean isExist = list.containsKey(product);

        if (isExist) {
            int amountTemp = list.get(product);
            amount += amountTemp;
            list.put(product, amount);
        } else {
            list.put(product, amount);
        }
    }

    public void subCart(Product product, int amount) {
        boolean isExist = list.containsKey(product);

        if (isExist) {
            int amountTemp = list.get(product);
            amount = amountTemp - amount;
            if (amount <= 0) {
                list.remove(product);
            } else {
                list.remove(product);
                list.put(product, amount);
            }
        }
    }

    public void removeCart(Product product){
        list.remove(product);
    }

    public int totalCost() {
        int total = 0;
        for (Map.Entry<Product, Integer> ds: list.entrySet()) {
            total += (int) (ds.getKey().priceDiscount() * ds.getValue());
        }
        return total;
    }

    public int totalProduct() {
        int total = 0;
        for (Map.Entry<Product, Integer> ds: list.entrySet()) {
            total += ds.getValue();
        }
        return total;
    }
}
