package model;

public class WineDTO {

	private String winename;
	private String use;
	private String sort;
	private String country;
	private String area;
	private String grape;
	private String grade;
	private String sugar;
	private String acidity;
	private String body;
	private String alcohol;
	private String price;
	private String picture;
	private String info;
	
	public WineDTO(String winename, String use, String sort, String country, String area, String grape, String grade,
			String sugar, String acidity, String body, String alcohol, String price, String picture, String info) {
		this.winename = winename;
		this.use = use;
		this.sort = sort;
		this.country = country;
		this.area = area;
		this.grape = grape;
		this.grade = grade;
		this.sugar = sugar;
		this.acidity = acidity;
		this.body = body;
		this.alcohol = alcohol;
		this.price = price;
		this.picture = picture;
		this.info = info;
	}

	public String getWinename() {
		return winename;
	}

	public void setWinename(String winename) {
		this.winename = winename;
	}

	public String getUse() {
		return use;
	}

	public void setUse(String use) {
		this.use = use;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getGrape() {
		return grape;
	}

	public void setGrape(String grape) {
		this.grape = grape;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getSugar() {
		return sugar;
	}

	public void setSugar(String sugar) {
		this.sugar = sugar;
	}

	public String getAcidity() {
		return acidity;
	}

	public void setAcidity(String acidity) {
		this.acidity = acidity;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getAlcohol() {
		return alcohol;
	}

	public void setAlcohol(String alcohol) {
		this.alcohol = alcohol;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	
	
	
}