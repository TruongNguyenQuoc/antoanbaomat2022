package com.example.shoesproject.util;

import java.text.DecimalFormat;

public class NumberUtil {

    private static final DecimalFormat df = new DecimalFormat("###,###,###");

    public static String formatNumber(double price, int discount) {
        try {
            String result = df.format(price - (price * discount / 100));
            return result.startsWith(".") ? "0" + result : result;
        } catch (Exception ex) {
            return "";
        }
    }

    public static String formatNumber(double price) {
        try {
            String result = df.format(price);
            return result.startsWith(".") ? "0" + result : result;
        } catch (Exception ex) {
            return "";
        }
    }

}
