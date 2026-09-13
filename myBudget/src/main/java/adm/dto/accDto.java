package adm.dto;

public class accDto {

    private int accountId;
    private String userId;
    private int sortNo;
    private int catId;
    private String catType;
    private String catNm;
    private String subCatNm;
    private String title;
    private long startAmount;
    private String remrk;
    private String useYn;
    private String createDt;
    private String modifyDt;

    public int getAccountId(){ return accountId; }
    public void setAccountId(int accountId){ this.accountId = accountId; }

    public String getUserId(){ return userId; }
    public void setUserId(String userId){ this.userId = userId; }

    public int getSortNo(){ return sortNo; }
    public void setSortNo(int sortNo){ this.sortNo = sortNo; }

    public int getCatId(){ return catId; }
    public void setCatId(int catId){ this.catId = catId; }

    public String getCatType(){ return catType; }
    public void setCatType(String catType){ this.catType = catType; }

    public String getCatNm(){ return catNm; }
    public void setCatNm(String catNm){ this.catNm = catNm; }

    public String getSubCatNm(){ return subCatNm; }
    public void setSubCatNm(String subCatNm){ this.subCatNm = subCatNm; }

    public String getTitle(){ return title; }
    public void setTitle(String title){ this.title = title; }

    public long getStartAmount(){ return startAmount; }
    public void setStartAmount(long startAmount){ this.startAmount = startAmount; }

    public String getRemrk(){ return remrk; }
    public void setRemrk(String remrk){ this.remrk = remrk; }

    public String getUseYn(){ return useYn; }
    public void setUseYn(String useYn){ this.useYn = useYn; }

    public String getCreateDt(){ return createDt; }
    public void setCreateDt(String createDt){ this.createDt = createDt; }

    public String getModifyDt(){ return modifyDt; }
    public void setModifyDt(String modifyDt){ this.modifyDt = modifyDt; }

}