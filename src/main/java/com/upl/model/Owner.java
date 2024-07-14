package com.upl.model;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.OneToOne;

@Entity
public class Owner {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	private String name;
	@OneToOne(cascade = CascadeType.REFRESH)
	@JoinColumn(name = "captain", referencedColumnName = "id")
	private Player captain;
	@Lob
	@Column(name = "image", nullable = true) // Adjust nullable based on your requirements
	private byte[] image;
	public long getId() {
		return id;
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

	public Player getCaptain() {
		return captain;
	}

	public void setCaptain(Player captain) {
		this.captain = captain;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}
	public Owner(long id, String name, Player captain, byte[] image) {
		this.id = id;
		this.name = name;
		this.captain = captain;
		this.image = image;
	}
	public Owner() {
		super();
		// TODO Auto-generated constructor stub
	}

}
