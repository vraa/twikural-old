package com.veerasundar.twikural.model;

import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Text;

@PersistenceCapable
public class Kural {

	@PrimaryKey
	@Persistent
	private Long key;

	@Persistent
	private Text kural;

	@Persistent
	private Text meaningOne;

	@Persistent
	private Text meaningTwo;

	public Long getKey() {
		return key;
	}

	public void setKey(Long key) {
		this.key = key;
	}

	public Text getKural() {
		return kural;
	}

	public void setKural(Text kural) {
		this.kural = kural;
	}

	public Text getMeaningOne() {
		return meaningOne;
	}

	public void setMeaningOne(Text meaningOne) {
		this.meaningOne = meaningOne;
	}

	public Text getMeaningTwo() {
		return meaningTwo;
	}

	public void setMeaningTwo(Text meaningTwo) {
		this.meaningTwo = meaningTwo;
	}

}
