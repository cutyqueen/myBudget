package adm.dto;

public class userDto {

    private String userId;
    private String userNm;
    private String pw;
    private String email;
    private String mbpno;
    private String setYear;
    private String setMonth;
    private String beginDt;
    private String status;
    private String statusNm;

    // getter, setter
    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }

    public String getUserNm() { return userNm; }
    public void setUserNm(String userNm) { this.userNm = userNm; }

    public String getPw() { return pw; }
    public void setPw(String pw) { this.pw = pw; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getMbpno() { return mbpno; }
    public void setMbpno(String mbpno) { this.mbpno = mbpno; }
    
    public String getSetYear() { return setYear; }
    public void setSetYear(String setYear) { this.setYear = setYear; }
    
    public String getSetMonth() { return setMonth; }
    public void setSetMonth(String setMonth) { this.setMonth = setMonth; }
    
    public String getBeginDt() { return beginDt; }
    public void setBeginDt(String beginDt) { this.beginDt = beginDt; }
    
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    
    public String getStatusNm() { return statusNm; }
    public void setStatusNm(String statusNm) { this.statusNm = statusNm; }
    		
}