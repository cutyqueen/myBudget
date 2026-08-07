package service;

import java.util.List;

import dao.NoticeDao;
import dto.NoticeDto;

public class NoticeSvc {

    private NoticeDao noticeDao = new NoticeDao();

    public List<NoticeDto> getNoticeList() {
        return noticeDao.selectNoticeList();
    }
}