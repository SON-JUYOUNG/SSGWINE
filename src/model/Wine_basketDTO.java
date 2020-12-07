package model;

public class Wine_basketDTO {
private int w_seq;
private String id;
private String wine_name;
private int count;

public Wine_basketDTO(int w_seq, String id, String wine_name, int count) {
	this.w_seq = w_seq;
	this.id = id;
	this.wine_name = wine_name;
	this.count = count;
}

public int getW_seq() {
	return w_seq;
}

public void setW_seq(int w_seq) {
	this.w_seq = w_seq;
}

public String getId() {
	return id;
}

public void setId(String id) {
	this.id = id;
}

public String getWine_name() {
	return wine_name;
}

public void setWine_name(String wine_name) {
	this.wine_name = wine_name;
}

public int getCount() {
	return count;
}

public void setCount(int count) {
	this.count = count;
}

}
