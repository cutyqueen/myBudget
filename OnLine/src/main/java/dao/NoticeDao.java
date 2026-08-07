package dao;

import java.util.ArrayList;
import java.util.List;

import dto.NoticeDto;

public class NoticeDao {

    public List<NoticeDto> selectNoticeList() {

        List<NoticeDto> noticeList = new ArrayList<>();

        noticeList.add(new NoticeDto(
                3,
                "OnLine 서비스 오픈 안내",
                "관리자",
                "2026-08-08",
                15
        ));

        noticeList.add(new NoticeDto(
                2,
                "홈페이지 이용 안내",
                "관리자",
                "2026-08-07",
                23
        ));

        noticeList.add(new NoticeDto(
                1,
                "개인정보 처리방침 안내",
                "관리자",
                "2026-08-01",
                41
        ));

        return noticeList;
    }
}