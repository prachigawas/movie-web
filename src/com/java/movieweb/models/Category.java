package com.java.movieweb.models;

/**
 * This is a model class represents a Category entity
 * @author Prachi
 */
public class Category {
	
	private Integer id;
	private String type;
	private String value;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}

	
}
