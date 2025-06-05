package kr.board.entity;

import java.util.List;

import lombok.Data;

@Data
public class Member {
    private int memIdx;             // 회원 고유 번호 (기본키, 자동 증가)
    private String memID;           // 회원 아이디
    private String memPassword;     // 회원 비밀번호
    private String memName;         // 회원 이름
    private Integer memAge;         // 회원 나이 (NULL 허용)
    private String memGender;       // 회원 성별 (NULL 허용)
    private String memEmail;        // 회원 이메일 (NULL 허용)
    private String memProfile;      // 프로필 이미지 경로 (NULL 허용)
    private List<AuthVO> authList;
}
