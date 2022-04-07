package data.dto;

import org.apache.ibatis.type.Alias;

@Alias("oddto")
public class OrderDetailDto {
  private int od_idx;
  private String order_id;
  private String pro_id;
  private String c_qty;
  private String c_color;
  private String c_size;
  private String o_date;
  private String pro_photo;
  private String pro_name;
  private String qty_price;

  public int getOd_idx() {
    return od_idx;
  }

  public void setOd_idx(int od_idx) {
    this.od_idx = od_idx;
  }

  public String getOrder_id() {
    return order_id;
  }

  public void setOrder_id(String order_id) {
    this.order_id = order_id;
  }

  public String getPro_id() {
    return pro_id;
  }

  public void setPro_id(String pro_id) {
    this.pro_id = pro_id;
  }

  public String getC_qty() {
    return c_qty;
  }

  public void setC_qty(String c_qty) {
    this.c_qty = c_qty;
  }

  public String getC_color() {
    return c_color;
  }

  public void setC_color(String c_color) {
    this.c_color = c_color;
  }

  public String getC_size() {
    return c_size;
  }

  public void setC_size(String c_size) {
    this.c_size = c_size;
  }

  public String getO_date() {
    return o_date;
  }

  public void setO_date(String o_date) {
    this.o_date = o_date;
  }

  public String getPro_photo() {
    return pro_photo;
  }

  public void setPro_photo(String pro_photo) {
    this.pro_photo = pro_photo;
  }

  public String getPro_name() {
    return pro_name;
  }

  public void setPro_name(String pro_name) {
    this.pro_name = pro_name;
  }

  public String getQty_price() {
    return qty_price;
  }

  public void setQty_price(String qty_price) {
    this.qty_price = qty_price;
  }
}
