package com.java.movieweb.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import static java.util.Objects.nonNull;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.java.movieweb.models.Movies;
import com.movieweb.db.ConnectionFactory;

public class MoviesDAO {
	private static final Logger LOGGER = Logger.getLogger(ConnectionFactory.class.getName());
	Connection jdbcConnection;

	Statement stmt;
	private int noOfRecords;

	private static Connection getConnection() throws SQLException, ClassNotFoundException {
		return ConnectionFactory.getInstance().getConnection();
	}

	public List<Movies> viewAllMovies(int offset,int noOfRecords,String genre, String language, String sort) {
		//String query = "select SQL_CALC_FOUND_ROWS * from movies limit "+offset+","+noOfRecords;
		
		String query= "select SQL_CALC_FOUND_ROWS * from movies m where m.id in (select distinct movie_id from relationship r where r.category_id in (select "+
				"id from category c where (c.type= " + genre +" or "+genre +" is null) and (c.value= "+language +" or "+language+" is null)))";
			
		
		List<Movies> list = new ArrayList<Movies>();
		Movies movie = null;
		try {
			jdbcConnection = getConnection();
			stmt = jdbcConnection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				movie = new Movies();
				movie.setId(rs.getInt("id"));
				movie.setDescription(rs.getString("description"));
				movie.setFeaturedImage(rs.getString("featured_image"));
				movie.setMovieLength(rs.getString("length"));
				movie.setMovieReleaseDate(rs.getString("release_date"));
				movie.setTitle(rs.getString("title"));
				list.add(movie);
			}
			noOfRecords=list.size();

			if (nonNull(sort)) {
				switch (sort.trim().toLowerCase()) {
				case "length":
					list.sort(Comparator.comparing(Movies::getMovieLength, (s1, s2) -> {
						return s1.replaceAll("[^0-9]", "").compareTo(s2.replaceAll("[^0-9]", ""));
					}));
					break;
				case "releaseDate":
					list.sort(Comparator.comparing(Movies::getMovieReleaseDate, (s1, s2) -> {
						DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MMMM dd yyyy");
						return LocalDateTime.parse(s1, formatter).compareTo(LocalDateTime.parse(s2, formatter));
					}));
					break;
				default:
					break;
				}
			}
			rs.close();
			rs = stmt.executeQuery("SELECT FOUND_ROWS()");
            if(rs.next())
                this.noOfRecords = rs.getInt(1);
		} catch (SQLException e) {
			LOGGER.log(Level.SEVERE,e.getMessage());
		} catch (ClassNotFoundException e) {
			LOGGER.log(Level.SEVERE,e.getMessage());
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (jdbcConnection != null)
					jdbcConnection.close();
			} catch (SQLException e) {
				LOGGER.log(Level.SEVERE,e.getMessage());
			}
		}
		return list;
	}

	public int getNoOfRecords() {
		return noOfRecords;
	}
}
