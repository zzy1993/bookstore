package com.bss.model;

import java.util.Date;
import javax.persistence.*;

@Entity
public class Product {

	@Id
	@GeneratedValue
	@Column(nullable = false)
	private int id;
	
	@Column(nullable = false)
	private String name;
	
	@Column(nullable = false)
	private float price;
	
	private String description;
	
	@Column(nullable = false)
	private Date lastUpdate;
	
	@Column(nullable = false)
	private int categoryId;

	public Product() {}

	public int getId() {
		return id;
	}

	private void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(Date lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	
	
	
}
