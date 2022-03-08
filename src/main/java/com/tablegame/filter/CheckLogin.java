package com.tablegame.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebFilter(urlPatterns = {"/addManager", "/viewMembers/*", "/viewCustomer/*", 
		"/admin","/admin/deleteCustomer","/products"})
public class CheckLogin implements Filter {

    public CheckLogin() {
    }


	public void destroy() {
	}


	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
	    HttpServletResponse response = (HttpServletResponse) arg1;

	    if (request.getSession().getAttribute("member")==null) { 
//	    	request.getRequestDispatcher("/").forward(request, response);
    	    response.sendRedirect("/homepage/");
	    	
	    }

		chain.doFilter(request, response);

	}


	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
