package adm.dto;

import java.util.List;

public class catGroupDto {

    private String catType;
    private String catNm;
    private List<catDto> subList;
    private String catId;

    public String getCatType() { return catType; }
    public void setCatType(String catType) { this.catType = catType; }

    public String getCatNm() { return catNm; }
    public void setCatNm(String catNm) { this.catNm = catNm; }

    public List<catDto> getSubList() { return subList; }
    public void setSubList(List<catDto> subList) { this.subList = subList; }
    
    public String getCatId() {
        return catId;
    }

    public void setCatId(String catId) {
        this.catId = catId;
    }
}