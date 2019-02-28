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
        int recordsPerPage = 10;
        int displayNoOfPages=4;
		
        if(request.getParameter("page") != null)
            page = Integer.parseInt(request.getParameter("page"));
        MoviesDAO dao = new MoviesDAO();
        String genreFilter= request.getParameter("genre");
        String languageFilter= request.getParameter("language");
        String sortBy= request.getParameter("sort");
        
        
        List<Movies> list = dao.viewAllMovies((page-1)*recordsPerPage,recordsPerPage,genreFilter,languageFilter,sortBy);
        int noOfRecords = dao.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
      
        if(noOfPages < displayNoOfPages)
        	displayNoOfPages=noOfPages;
        
        request.setAttribute("filteredMovies", list);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("displayNoOfPages", displayNoOfPages);
        request.setAttribute("currentPage", page);
        RequestDispatcher view = request.getRequestDispatcher("MoviesList.jsp");
        view.forward(request, response);
    }


}
