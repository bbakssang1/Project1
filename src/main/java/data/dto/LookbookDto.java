package data.dto;

import java.sql.Timestamp;
import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;



@Alias("lodto")
public class LookbookDto {

  private String num;
  private String look_id;
  private String look_name;
  private int readcount;
  private String look_photo;
  private String look_title;
  private String look_content;
  private MultipartFile upload;
  private Timestamp ipgoday;

  public String getNum() {
    return num;
  }

  public void setNum(String num) {
    this.num = num;
  }

  public String getLook_id() {
    return look_id;
  }

  public void setLook_id(String look_id) {
    this.look_id = look_id;
  }

  public String getLook_name() {
    return look_name;
  }

  public void setLook_name(String look_name) {
    this.look_name = look_name;
  }

  public int getReadcount() {
    return readcount;
  }

  public void setReadcount(int readcount) {
    this.readcount = readcount;
  }

  public String getLook_photo() {
    return look_photo;
  }

  public void setLook_photo(String look_photo) {
    this.look_photo = look_photo;
  }

  public String getLook_title() {
    return look_title;
  }

  public void setLook_title(String look_title) {
    this.look_title = look_title;
  }

  public String getLook_content() {
    return look_content;
  }

  public void setLook_content(String look_content) {
    this.look_content = look_content;
  }

  public MultipartFile getUpload() {
    return upload;
  }

  public void setUpload(MultipartFile upload) {
    this.upload = upload;
  }

  public Timestamp getIpgoday() {
    return ipgoday;
  }

  public void setIpgoday(Timestamp ipgoday) {
    this.ipgoday = ipgoday;
  }


}
