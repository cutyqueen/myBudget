package adm.dto;

public class noticeDto {
    private String noticeId;
    private String title;
    private String content;
    private String noticeMenu;
    private String useMenu;
    private String sort;
    private String useYn;
    private String creatDt;
    private String modifyDt;

    public String getNoticeId() { return noticeId; }
    public void setNoticeId(String noticeId) { this.noticeId = noticeId; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }
    public String getNoticeMenu() { return noticeMenu; }
    public void setNoticeMenu(String noticeMenu) { this.noticeMenu = noticeMenu; }
    public String getUseMenu() {
        return useMenu;
    }
    public void setUseMenu(String useMenu) {
        this.useMenu = useMenu;
    }
    public String getSort() { return sort; }
    public void setSort(String sort) { this.sort = sort; }
    public String getUseYn() { return useYn; }
    public void setUseYn(String useYn) { this.useYn = useYn; }
    public String getCreatDt() { return creatDt; }
    public void setCreatDt(String creatDt) { this.creatDt = creatDt; }
    public String getModifyDt() { return modifyDt; }
    public void setModifyDt(String modifyDt) { this.modifyDt = modifyDt; }
}