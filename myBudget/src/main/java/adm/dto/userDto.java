package adm.dto;

public class userDto {

    private String userId;
    private String userNm;
    private String pw;
    private String email;
    private String mbpno;

    // getter, setter
    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }

    public String getUserNm() { return userNm; }
    public void setUserNm(String userNm) { this.userNm = userNm; }

    public String getPw() { return pw; }
    public void setPw(String pw) { this.pw = pw; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getMbpn() { return mbpno; }
    public void setMbpn(String mbpn) { this.mbpno = mbpno; }
}