package model;

import java.util.ArrayList;

public class recommend_dto {
      private String sort;
      private String use;
      private int sugar;
      private int acidity;
      private int body;
      private String winename;
      private String picture;
      private String product_name;
      private String product_name1;
      private String product_name2;
      private ArrayList<recommend_dto> reArrayList;
      
      public recommend_dto() {  }
      
      public recommend_dto(String winename, String picture, ArrayList<recommend_dto> reArrayList) {
         this.winename = winename;
         this.picture = picture;
         this.reArrayList = reArrayList;
      }
      
      public recommend_dto(String product_name) {
         this.product_name = product_name;
      }
      
      public recommend_dto(String winename, String picture, String product_name1, String product_name2) {
         this.winename = winename;
         this.picture = picture;
         this.product_name1 = product_name1;
         this.product_name2 = product_name2;
      }
      
      public String getProduct_name1() {
         return product_name1;
      }

      public void setProduct_name1(String product_name1) {
         this.product_name1 = product_name1;
      }

      public String getProduct_name2() {
         return product_name2;
      }

      public void setProduct_name2(String product_name2) {
         this.product_name2 = product_name2;
      }

      public String getSort() {
         return sort;
      }
      public void setSort(String sort) {
         this.sort = sort;
      }
      public String getUse() {
         return use;
      }
      public void setUse(String use) {
         this.use = use;
      }
      public int getSugar() {
         return sugar;
      }
      public void setSugar(int sugar) {
         this.sugar = sugar;
      }
      public int getAcidity() {
         return acidity;
      }
      public void setAcidity(int acidity) {
         this.acidity = acidity;
      }
      public int getBody() {
         return body;
      }
      public void setBody(int body) {
         this.body = body;
      }
      public String getWinename() {
         return winename;
      }
      public void setWinename(String winename) {
         this.winename = winename;
      }
      public String getPicture() {
         return picture;
      }
      public void setPicture(String picture) {
         this.picture = picture;
      }
      public String getProduct_name() {
         return product_name;
      }
      public void setProduct_name(String product_name) {
         this.product_name = product_name;
      }
      @Override
      public String toString() {
         return "recommend_dto [sort=" + sort + ", use=" + use + ", sugar=" + sugar + ", acidity=" + acidity + ", body="
               + body + ", winename=" + winename + ", picture=" + picture + ", product_name=" + product_name + "]";
      }
      
   }