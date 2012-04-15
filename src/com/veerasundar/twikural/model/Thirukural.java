package com.veerasundar.twikural.model;

import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Text;

@PersistenceCapable
public class Thirukural {

	@PrimaryKey
	@Persistent
	private Long key;

	@Persistent
	private Text tamil;

	@Persistent
	private Text kalaignar;

	@Persistent
	private Text muva;

	@Persistent
	private Text pops;

	@Persistent
	private Text english;

	@Persistent
	private Text explain;

	public Long getKey() {
		return key;
	}

	public void setKey(Long key) {
		this.key = key;
	}

	public Text getTamil() {
		return tamil;
	}

	public void setTamil(Text tamil) {
		this.tamil = tamil;
	}

	public Text getKalaignar() {
		return kalaignar;
	}

	public void setKalaignar(Text kalaignar) {
		this.kalaignar = kalaignar;
	}

	public Text getMuva() {
		return muva;
	}

	public void setMuva(Text muva) {
		this.muva = muva;
	}

	public Text getPops() {
		return pops;
	}

	public void setPops(Text pops) {
		this.pops = pops;
	}

	public Text getEnglish() {
		return english;
	}

	public void setEnglish(Text english) {
		this.english = english;
	}

	public Text getExplain() {
		return explain;
	}

	public void setExplain(Text explain) {
		this.explain = explain;
	}

}
