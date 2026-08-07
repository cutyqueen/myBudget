package dao;

import dto.HomeDto;

public class HomeDao {

    public HomeDto selectHomeInfo() {

        return new HomeDto(
                "필요한 정보를 켜고, 기관과 사용자를 연결합니다.",
                "OnLine은 홈페이지 관리 시스템입니다."
        );
    }
}