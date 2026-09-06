package adm.dto;

public class trxDto {

    private String tranId;
    private String userId;
    private String tranDt;
    private String typeCd;
    private String catCd;
    private String content;
    private int amount;
    private String inAcctId;
    private String outAcctId;
    private String paymentCd;
    private String fixedYn;
    private String remrk;

    public String getTranId() {
        return tranId;
    }

    public void setTranId(String tranId) {
        this.tranId = tranId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getTranDt() {
        return tranDt;
    }

    public void setTranDt(String tranDt) {
        this.tranDt = tranDt;
    }

    public String getTypeCd() {
        return typeCd;
    }

    public void setTypeCd(String typeCd) {
        this.typeCd = typeCd;
    }

    public String getCatCd() {
        return catCd;
    }

    public void setCatCd(String catCd) {
        this.catCd = catCd;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getInAcctId() {
        return inAcctId;
    }

    public void setInAcctId(String inAcctId) {
        this.inAcctId = inAcctId;
    }

    public String getOutAcctId() {
        return outAcctId;
    }

    public void setOutAcctId(String outAcctId) {
        this.outAcctId = outAcctId;
    }

    public String getPaymentCd() {
        return paymentCd;
    }

    public void setPaymentCd(String paymentCd) {
        this.paymentCd = paymentCd;
    }

    public String getFixedYn() {
        return fixedYn;
    }

    public void setFixedYn(String fixedYn) {
        this.fixedYn = fixedYn;
    }

    public String getRemrk() {
        return remrk;
    }

    public void setRemrk(String remrk) {
        this.remrk = remrk;
    }
}