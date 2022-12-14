package com.example.shoesproject.util;

import javax.servlet.http.HttpServletRequest;

public class SessionUtil {

    private static SessionUtil session = null;

    public static SessionUtil getInstance(){
        if (session == null) {
            session = new SessionUtil();
        }
        return session;
    }

    public void putValue(HttpServletRequest request, String key, Object value){
        request.setAttribute(key, value);
    }

    public Object getValue(HttpServletRequest request, String value){
        return request.getSession().getAttribute(value);
    }

    public void removeValue(HttpServletRequest request, String key){
        request.removeAttribute(key);
    }
}
