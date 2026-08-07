package dto;

public class NoticeDto {

    private int noticeId;
    private String title;
    private String writer;
    private String createdDate;
    private int viewCount;

    public NoticeDto(int noticeId, String title,
                     String writer, String createdDate,
                     int viewCount) {
        this.noticeId = noticeId;
        this.title = title;
        this.writer = writer;
        this.createdDate = createdDate;
        this.viewCount = viewCount;
    }

    public int getNoticeId() {
        return noticeId;
    }

    public String getTitle() {
        return title;
    }

    public String getWriter() {
        return writer;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public int getViewCount() {
        return viewCount;
    }
}