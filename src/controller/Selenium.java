package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import model.Product_basketDAO;
import model.Product_basketDTO;
import model.User_MemberDTO;
import model.Wine_basketDAO;
import model.Wine_basketDTO;

/**
 * Servlet implementation class SeleniumTest
 */
@WebServlet("/Selenium")
public class Selenium extends HttpServlet {
   // WebDriver
   private WebDriver driver;
   private WebElement login;
   private WebElement input_id;
   private WebElement input_pw;
   private WebElement login_button;
   private WebElement search;
   private WebElement search_button;
   private WebElement wine_click;
   private WebElement wine;
   private WebElement wine_cart;
   private WebElement product;
   private WebElement product_cart;
   private WebElement cart;
   private WebElement cart_button;
   private WebElement count;
   private String url;
   String winHandle;
   String winHandle2;
   
   // Properties
   public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
   
   //chromedriver.exe�� �ٿ�ް� ��� ������ �ؾ� �۵��մϴ�.
   public static String WEB_DRIVER_PATH = "C:\\Users\\user\\Desktop\\chromedriver.exe"; //��� �� Ȯ���غ���!!
   public static String MAIN_URL = "http://www.ssg.com";

   protected void service(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      
      HttpSession session = request.getSession();
      User_MemberDTO user_dto = (User_MemberDTO)session.getAttribute("user_dto");
      
       Wine_basketDAO wine_basket_dao = new Wine_basketDAO();
       ArrayList<Wine_basketDTO> wine_list = wine_basket_dao.select(user_dto.getId());
       
       Product_basketDAO pro_basket_dao = new Product_basketDAO();
       ArrayList<Product_basketDTO> product_list = pro_basket_dao.select(user_dto.getId());
       
      // System Property SetUp
      System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);

      // Driver SetUp
      ChromeOptions options = new ChromeOptions();
      options.setCapability("ignoreProtectedModeSettings", true);
      driver = new ChromeDriver(options);

      driver.get(MAIN_URL);
      login = driver.findElement(By.xpath("//*[@id=\"loginBtn\"]/a"));
      login.click();

      try {
      String parentWindowHandle = driver.getWindowHandle();

      //�α���
      for (String winHandle : driver.getWindowHandles()) {
         if (!winHandle.contentEquals(parentWindowHandle)) { //�α��� �˾�â
            driver.switchTo().window(winHandle);
            input_id = driver.findElement(By.xpath("//*[@id=\"mem_id\"]"));
            input_id.sendKeys(user_dto.getId());

            input_pw = driver.findElement(By.xpath("//*[@id=\"mem_pw\"]"));
            input_pw.sendKeys(user_dto.getPw());

            login_button = driver.findElement(By.xpath("//*[@id=\"loginForm\"]/div[5]/button"));
            login_button.click();

            Thread.sleep(5000); // 5�� ���
         }
      }
      for(String winHandle2 : driver.getWindowHandles()) {
         if (!winHandle2.contentEquals(parentWindowHandle)) { // �α��� �� �˾�â ���� �� �ݱ�
            driver.switchTo().window(winHandle2).close();   
      }}

      driver.switchTo().window(parentWindowHandle);//����ȭ������ �̵�
      driver.navigate().refresh(); // ���ΰ�ħ
      
         for(int i=0; i<wine_list.size(); i++) { //���� ��ٱ��Ͽ� ���
   
         Thread.sleep(5000); // 5�� ���
         
         //���� �˻�
         search = driver.findElement(By.xpath("//*[@id=\"ssg-query\"]")); //
         search.click();
         search.sendKeys(wine_list.get(i).getWine_name());
         Thread.sleep(5000);

         search_button = driver.findElement(By.xpath("//*[@id=\"ssg-query-btn\"]"));
         search_button.click();
         Thread.sleep(5000);
         
         // ���� ���� 
         wine = driver.findElement(By.cssSelector("ul.cunit_thmb_lst > li > div.cunit_prod > div.thmb > a"));//div.cunit_prod > div.thmb > div.clickable
         wine.click();
         Thread.sleep(5000);
         
         //���� ���� ����
         count = driver.findElement(By.cssSelector("dl > dd.cdtl_art_l > div > a.cdtl_b_plus"));
         for(int j=1;j<wine_list.get(i).getCount();j++) {
         count.click();
         }
         Thread.sleep(5000);
         
         //���� ��ٱ��Ͽ� ���
         wine_cart = driver.findElement(By.xpath("//*[@id=\"actionCart\"]")); //
         wine_cart.click();
         Thread.sleep(5000);

         cart = driver.findElement(By.xpath("//*[@id=\"_bar_Cart\"]/ul[1]/li/div/div/div/p[2]/a[1]"));
         cart.click();
         }
         
         for(int i=0; i<product_list.size(); i++) { //��ǰ ��ٱ��Ͽ� ���
            Thread.sleep(5000); // 5�� ���
            
            //��ǰ �˻�
            search = driver.findElement(By.xpath("//*[@id=\"ssg-query\"]")); //
            search.click();
            search.sendKeys(product_list.get(i).getProduct_basket());
            Thread.sleep(5000);

            search_button = driver.findElement(By.xpath("//*[@id=\"ssg-query-btn\"]"));
            search_button.click();
            Thread.sleep(5000);
            
            // ��ǰ ���� 
            product = driver.findElement(By.cssSelector("div.cunit_prod > div.thmb > a"));
            product.click();
            Thread.sleep(5000);

            //��ǰ ���� ����
            count = driver.findElement(By.cssSelector("dl > dd.cdtl_art_l > div > a.cdtl_b_plus"));
            for(int j=1;j<product_list.get(i).getCount();j++) {
                count.click();
                }
            
            //��ǰ ��ٱ��Ͽ� ���
            product_cart = driver.findElement(By.xpath("//*[@id=\"actionCart\"]")); //
            product_cart.click();
            Thread.sleep(5000);

            cart = driver.findElement(By.xpath("//*[@id=\"_bar_Cart\"]/ul[1]/li/div/div/div/p[2]/a[1]"));
            cart.click();
         }
         
         cart_button = driver.findElement(By.xpath("//*[@id=\"utilCartPreviewGo\"]/a[2]"));
         cart_button.click();
         
         int cnt1 = wine_basket_dao.Alldelete(user_dto.getId());
         int cnt2 = pro_basket_dao.Alldelete(user_dto.getId());
         
         if(cnt1>0 && cnt2>0) {
        	 System.out.println("����");
         } else {
        	 System.out.println("����");
         }
         response.sendRedirect("wine_home.jsp");
         
         
      } catch (InterruptedException e) {
         e.printStackTrace();
      }

   }

}