package com.upl.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;

@Entity
public class Sponsor {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;

	private String name;
	private String post;
	private int amount;
	@Lob
	@Column(name = "image", nullable = true) // Adjust nullable based on your requirements
	private byte[] image;

	public long getId() {
		return id;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "Sponser [id=" + id + ", name=" + name + ", post=" + post + ", amount=" + amount + "]";
	}

	public Sponsor(long id, String name, String post, int amount, byte[] image) {
		this.id = id;
		this.name = name;
		this.post = post;
		this.amount = amount;
		this.image = image;
	}

	public Sponsor() {
		super();
		// TODO Auto-generated constructor stub
	}

}
