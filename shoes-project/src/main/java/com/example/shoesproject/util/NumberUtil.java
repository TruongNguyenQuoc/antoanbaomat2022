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

    public static Double doubleNumber(double price, int discount) {
        try {
            return price - (price * discount / 100);
        } catch (Exception ex) {
            return 0.0;
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
