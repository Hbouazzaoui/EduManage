package com.example.edumanage.Filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebFilter("/")
public class AuthentificationFilter implements Filter {
    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;
       String action = req.getServletPath();
       if("/".equals(action) || "/Login".equals(action) || "/Login.jsp".equals(action)){
           filterChain.doFilter(servletRequest, servletResponse);

       }else {
Object isLoggedinObj = req.getSession().getAttribute("isLoggedin");
if(isLoggedinObj !=null){
    boolean isLoggedIn= (Boolean) isLoggedinObj;
    if(isLoggedIn){
        filterChain.doFilter(servletRequest,servletResponse);
        return;
       }
    }
resp.sendRedirect("/");
}



    }
}
