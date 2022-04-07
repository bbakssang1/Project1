package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("cdto")
public class CartDto {
	private int c_idx;
	private String userid;
	private String pro_id;
	private String c_size;
	private String c_color;
	private String c_qty;
	private Timestamp c_adddate;
	private ProductDto joinproduct;
	private String totalprice;
	private String pro_name;
	private String pro_photo;
	private String price;
	private String cartcnt;
	private String m_name;
	private String m_hp;
	private String m_addrnum;
	private String m_addr;
	private String m_addrdetail;
	private String m_email;
	private String m_email1;
	private String m_email2;
	private String m_hp1;
	private String m_hp2;
	private String m_hp3;
	
	public int getC_idx() {
		return c_idx;
	}
	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPro_id() {
		return pro_id;
	}
	public void setPro_id(String pro_id) {
		this.pro_id = pro_id;
	}
	public String getC_size() {
		return c_size;
	}
	public void setC_size(String c_size) {
		this.c_size = c_size;
	}
	public String getC_color() {
		return c_color;
	}
	public void setC_color(String c_color) {
		this.c_color = c_color;
	}
	public String getC_qty() {
		return c_qty;
	}
	public void setC_qty(String c_qty) {
		this.c_qty = c_qty;
	}
	public Timestamp getC_adddate() {
		return c_adddate;
	}
	public void setC_adddate(Timestamp c_adddate) {
		this.c_adddate = c_adddate;
	}
	public ProductDto getJoinproduct() {
		return joinproduct;
	}
	public void setJoinproduct(ProductDto joinproduct) {
		this.joinproduct = joinproduct;
	}
	public String getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(String totalprice) {
		this.totalprice = totalprice;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getPro_photo() {
		return pro_photo;
	}
	public void setPro_photo(String pro_photo) {
		this.pro_photo = pro_photo;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getCartcnt() {
		return cartcnt;
	}
	public void setCartcnt(String cartcnt) {
		this.cartcnt = cartcnt;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_hp() {
		return m_hp;
	}
	public void setM_hp(String m_hp) {
		this.m_hp = m_hp;
	}
	public String getM_addrnum() {
		return m_addrnum;
	}
	public void setM_addrnum(String m_addrnum) {
		this.m_addrnum = m_addrnum;
	}
	public String getM_addr() {
		return m_addr;
	}
	public void setM_addr(String m_addr) {
		this.m_addr = m_addr;
	}
	public String getM_addrdetail() {
		return m_addrdetail;
	}
	public void setM_addrdetail(String m_addrdetail) {
		this.m_addrdetail = m_addrdetail;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_email1() {
		return m_email1;
	}
	public void setM_email1(String m_email1) {
		this.m_email1 = m_email1;
	}
	public String getM_email2() {
		return m_email2;
	}
	public void setM_email2(String m_email2) {
		this.m_email2 = m_email2;
	}
	public String getM_hp1() {
		return m_hp1;
	}
	public void setM_hp1(String m_hp1) {
		this.m_hp1 = m_hp1;
	}
	public String getM_hp2() {
		return m_hp2;
	}
	public void setM_hp2(String m_hp2) {
		this.m_hp2 = m_hp2;
	}
	public String getM_hp3() {
		return m_hp3;
	}
	public void setM_hp3(String m_hp3) {
		this.m_hp3 = m_hp3;
	}
}
