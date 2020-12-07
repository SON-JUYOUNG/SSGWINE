package model;

public class RecommendDTO {
	private int rp_seq;
	private String wine_name;
	private String product_name;
	
	public RecommendDTO(int rp_seq, String wine_name, String product_name) {
		this.rp_seq = rp_seq;
		this.wine_name = wine_name;
		this.product_name = product_name;
	}

	public int getRp_seq() {
		return rp_seq;
	}

	public void setRp_seq(int rp_seq) {
		this.rp_seq = rp_seq;
	}

	public String getWine_name() {
		return wine_name;
	}

	public void setWine_name(String wine_name) {
		this.wine_name = wine_name;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	
	
}
