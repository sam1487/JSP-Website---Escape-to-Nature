package com.comp6000.project.entity;

public class Place {
	int id;
	String title;
	String state;
	String city;
	double rating = 0;
	double rec_stay = -1;
	int n_ratings = 0;
	int n_recs = 0;
	String[] imageLinks = new String[]{};
	String description;
	
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String[] getImageLinks() {
		return imageLinks;
	}
	public void setImageLinks(String[] imageLinks) {
		this.imageLinks = imageLinks;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public double getRec_stay() {
		return rec_stay;
	}
	public void setRec_stay(double rec_stay) {
		this.rec_stay = rec_stay;
	}
	public int getN_ratings() {
		return n_ratings;
	}
	public void setN_ratings(int n_ratings) {
		this.n_ratings = n_ratings;
	}
	public int getN_recs() {
		return n_recs;
	}
	public void setN_recs(int n_recs) {
		this.n_recs = n_recs;
	}
	
}
