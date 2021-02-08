# 완료 리스트
- [x] 프레임워크 기초
- [x] 로그인/로그아웃
- [x] 게시물 CRUD
- [x] 글 CRUD
- [x] 비밀번호 암호화
- [x] 게시물 검색
- [x] 게시물 페이징
- [x] 아이디 찾기
- [x] 비번 찾기(임시 패스워드)
- [x] 임시 비밀번호 사용중일 때 경고하기
- [x] 추천(좋아요, 싫어요)
- [x] 한방배포

# 적용해야할 목록
  
  - [] 알림
    - [] 내 글의 새 댓글
    - [] 내 댓글에 대한 추가 댓글
  - [] 댓글, ajax화
  - [] 댓글 멘션
  - [] 대댓글
  - [] 태그
  - [] 파입 업로드
  - [] 회원 인증
  - [] 관리자 페이지
  - [] 1:1쪽지
  - [] 신고
  - [] 게시물 블라인드
  
# 메이븐 settings.xml 템플릿
```
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0 https://maven.apache.org/xsd/settings-1.0.0.xsd">
    <servers>
        <server>
            <id>poa__manager_text</id>
            <username>웹 관리자</username>
            <password>웹 관리자 비밀번호</password>
        </server>
    </servers>
</settings>
```