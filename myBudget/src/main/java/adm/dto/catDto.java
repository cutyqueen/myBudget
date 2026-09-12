package adm.dto;

public class catDto {

    private String catId;
    private String userId;
    private String catType;
    private String catNm;
    private String subCatNm;
    private String fixYn;
    private String useYn;

    public String getCatId() { return catId; }
    public void setCatId(String catId) { this.catId = catId; }

    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }

    public String getCatType() { return catType; }
    public void setCatType(String catType) { this.catType = catType; }

    public String getCatNm() { return catNm; }
    public void setCatNm(String catNm) { this.catNm = catNm; }

    public String getSubCatNm() { return subCatNm; }
    public void setSubCatNm(String subCatNm) { this.subCatNm = subCatNm; }

    public String getFixYn() { return fixYn; }
    public void setFixYn(String fixYn) { this.fixYn = fixYn; }

    public String getUseYn() { return useYn; }
    public void setUseYn(String useYn) { this.useYn = useYn; }
}