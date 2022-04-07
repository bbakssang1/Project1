package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("odto")
public class OrderDto {
	private int o_idx;
	private String order_id;
	private String orderer;
	private String recipient;
	private String o_hp;
	private String o_hp1;
	private String o_hp2;
	private String o_hp3;
	private String o_addrnum;
	private String o_addr;
	private String o_addrdetail;
	private String o_email;
	private String o_email1;
	private String o_email2;
	private String o_note;
	private String o_totalprice;
	private Timestamp o_date;
	
	public int getO_idx() {
		return o_idx;
	}
	public void setO_idx(int o_idx) {
		this.o_idx = o_idx;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getOrderer() {
		return orderer;
	}
	public void setOrderer(String orderer) {
		this.orderer = orderer;
	}
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public String getO_hp() {
		return o_hp;
	}
	public void setO_hp(String o_hp) {
		this.o_hp = o_hp;
	}
	public String getO_hp1() {
		return o_hp1;
	}
	public void setO_hp1(String o_hp1) {
		this.o_hp1 = o_hp1;
	}
	public String getO_hp2() {
		return o_hp2;
	}
	public void setO_hp2(String o_hp2) {
		this.o_hp2 = o_hp2;
	}
	public String getO_hp3() {
		return o_hp3;
	}
	public void setO_hp3(String o_hp3) {
		this.o_hp3 = o_hp3;
	}
	public String getO_addrnum() {
		return o_addrnum;
	}
	public void setO_addrnum(String o_addrnum) {
		this.o_addrnum = o_addrnum;
	}
	public String getO_addr() {
		return o_addr;
	}
	public void setO_addr(String o_addr) {
		this.o_addr = o_addr;
	}
	public String getO_addrdetail() {
		return o_addrdetail;
	}
	public void setO_addrdetail(String o_addrdetail) {
		this.o_addrdetail = o_addrdetail;
	}
	public String getO_email() {
		return o_email;
	}
	public void setO_email(String o_email) {
		this.o_email = o_email;
	}
	public String getO_email1() {
		return o_email1;
	}
	public void setO_email1(String o_email1) {
		this.o_email1 = o_email1;
	}
	public String getO_email2() {
		return o_email2;
	}
	public void setO_email2(String o_email2) {
		this.o_email2 = o_email2;
	}
	public String getO_note() {
		return o_note;
	}
	public void setO_note(String o_note) {
		this.o_note = o_note;
	}
	public String getO_totalprice() {
		return o_totalprice;
	}
	public void setO_totalprice(String o_totalprice) {
		this.o_totalprice = o_totalprice;
	}
	public Timestamp getO_date() {
		return o_date;
	}
	public void setO_date(Timestamp o_date) {
		this.o_date = o_date;
	}
}
