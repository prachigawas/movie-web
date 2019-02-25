package com.java.movieweb.controller;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.movieweb.dao.MoviesDAO;
import com.java.movieweb.models.Movies;

public class MovieWebControllerServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
    public void doGet(HttpServletRequest request, 
            HttpServletResponse response) 
            throws ServletException, IOException {
        int page = 1;
        int recordsPerPage = 6;
        int displayNoOfPages=4;
        HttpSession session = request.getSession();
		
        if(request.getParameter("page") != null)
            page = Integer.parseInt(request.getParameter("page"));
        MoviesDAO dao = new MoviesDAO();
        
        String genreFilter= (String) Optional.ofNullable(session.getAttribute("genre")).orElse(null);
        String languageFilter= Optional.ofNullable(request.getParameter("language")).orElse(null);
        String sortBy= Optional.ofNullable(request.getParameter("sort")).orElse(null);
        
        
        List<Movies> list = dao.viewAllMovies((page-1)*recordsPerPage,recordsPerPage,genreFilter,languageFilter,sortBy);
        int noOfRecords = dao.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
        request.setAttribute("filteredMovies", list);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("displayNoOfPages", displayNoOfPages);
        request.setAttribute("currentPage", page);
        RequestDispatcher view = request.getRequestDispatcher("MoviesList.jsp");
        view.forward(request, response);
    }
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
	}

}
