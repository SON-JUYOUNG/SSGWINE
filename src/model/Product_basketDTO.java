package model;

public class Product_basketDTO {
	private int p_seq;
	private String id;
	private String product_basket;
	private int count;
	
	public Product_basketDTO(int p_seq, String product_basket, String id, int count) {
		this.p_seq = p_seq;
		this.id = id;
		this.product_basket = product_basket;
		this.count = count;
	}
	public int getP_seq() {
		return p_seq;
	}
	public void setP_seq(int p_seq) {
		this.p_seq = p_seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProduct_basket() {
		return product_basket;
	}
	public void setProduct_basket(String product_basket) {
		this.product_basket = product_basket;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
	
	
	
}
