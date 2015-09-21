package com.jlj.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Resarticle entity.
 * 
 * @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "resarticle", catalog = "wcg")
public class Resarticle implements java.io.Serializable {

	// Fields

	private Integer id;
	private Resmessage resmessage;
	private String title;
	private String description;
	private String picurl;
	private String url;

	// Constructors

	/** default constructor */
	public Resarticle() {
	}

	/** full constructor */
	public Resarticle(Resmessage resmessage, String title, String description,
			String picurl, String url) {
		this.resmessage = resmessage;
		this.title = title;
		this.description = description;
		this.picurl = picurl;
		this.url = url;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "resid")
	public Resmessage getResmessage() {
		return this.resmessage;
	}

	public void setResmessage(Resmessage resmessage) {
		this.resmessage = resmessage;
	}

	@Column(name = "title", length = 50)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "description", length = 100)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "picurl", length = 100)
	public String getPicurl() {
		return this.picurl;
	}

	public void setPicurl(String picurl) {
		this.picurl = picurl;
	}

	@Column(name = "url", length = 100)
	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}