package com.java.movieweb.models;

/**
 * This is a model class represents a Relationship entity
 * @author Prachi
 */
public class Relationship {
	private Integer id;
	private Integer categoryId;
	private Integer movieId;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public Integer getMovieId() {
		return movieId;
	}
	public void setMovieId(Integer movieId) {
		this.movieId = movieId;
	}

}
