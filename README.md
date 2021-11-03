로고

![image](https://user-images.githubusercontent.com/45135200/140076183-c0e0426e-431e-4b1d-9da9-bd45b18c1538.png)

# 화면 요구사항

1. 로그인(/login)
    - 회원가입 ↔ 로그인
2. 피드(/)
    - 전체 피드(팔로우피드?) ↔ 내 피드
        - 피드의 업로드 사진 여러장일 경우 슬라이드
        - 피드 등록 시 업로드 사진 미리보기 되어야함
    - 우측 상단 태그알람 > 개수만큼 숫자표시
    - 좌측 상단 DM 모달
3. DM(/direc)
    - 대화 목록
        - 대화 상대 별 안 읽은 메세지 숫자 표시
        - 1:1통신 우선 구현, 1:n은 상황보고
        - 실시간 통신을 위해 웹소켓으로 구현해야 함
            - 이 경우는 서버 종료 시 끊겨질 확률이 있음
        
4. 통계(제일 마지막, 시간남으면)
    - 전체피드
        - 주·월 간 인기있었던 태그, 게시글
    - 팔로잉 피드
        - 주·월 간 인기있었던 태그, 게시글
    - 내 피드
        - 주·월 간 인기있었던 태그, 게시글

# DB

members

- member_id / pri_key
- pw
- age
- name
- introduce - null값 일 수도있음
- follower_num / member_follow row add,drop 시 trigger update
- following_num / member_follow row add,drop 시 trigger update

member_follow : 멤버의 follow를 누른 사람 리스트

- member_id / ref kista_members.member_id
- follow_id / ref kista_members.member_id
- follow_date

post_feeds

- feed_id / pk, auto_increment로 했으나 feed id값 받아오는데 문제있음..그냥 select count(*)로 진행
- member_id  /  ref kista_members.member_id
- image_url (JSON형식으로 컬럼에 저장)
- content
- reg_date
- likes

comments

- feed_id /  ref kista_members.member_id
- comment_id /  ref kista_members.member_id
- comment_content
- reg_date

DM

- sender_id / ref kista_members.member_id
- receiver_id / ref kista_members.member_id
- send_date
- read_status / boolean default false

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/329c70e5-e0a5-4a59-97a2-f258701df8e4/Untitled.png)

<details>
<summary>생성 쿼리문</summary>
<div markdown="1">       

  CREATE TABLE members(
    member_id varchar(30),
    pw varchar(40),
    age date,
    name varchar(20),
    follower_num number,
    following_num number,
    CONSTRAINT PK_member PRIMARY KEY(member_id)
    );
    
    CREATE TABLE member_follow(
    member_id varchar(30) not null,
    follower varchar(30) not null,
    follow_date date,
    CONSTRAINT FK_member_follow_memberid FOREIGN KEY(member_id) REFERENCES members(member_id),
    CONSTRAINT FK_member_follow_follower FOREIGN KEY(follower) REFERENCES members(member_id)
    );
    
    CREATE TABLE post_feeds(
    —feed_id  number GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
    
    feed_id  number ,
    member_id varchar2(30),
    image_url CLOB, -- 이미지의 경우 저장된 uri를 JSON형식으로 받는다.
    content varchar2(4000),
    reg_date date default 0,
    likes number,
    CONSTRAINT image_json CHECK (image_url IS JSON),
    CONSTRAINT PK_post_feeds PRIMARY KEY(feed_id),
    CONSTRAINT FK_post_feeds_feed_id FOREIGN KEY(member_id) REFERENCES members(member_id)
    );
    
    CREATE TABLE comments(
    feed_id number,
    comment_id varchar2(30),
    comment_content varchar2(1000),
    reg_date date,
    CONSTRAINT FK_comments_feed_id FOREIGN KEY(feed_id) REFERENCES post_feeds(feed_id),
    CONSTRAINT FK_comments_comment_id FOREIGN KEY(comment_id) REFERENCES members(member_id)
    );
    
    CREATE TABLE DM(
    sender_id varchar2(30),
    receiver_id varchar2(30),
    send_date date,
    read_status NUMBER(1) default 0, -- read상태 체크 1-read, 0-noread
    CONSTRAINT FK_DM_sender_id FOREIGN KEY(sender_id) REFERENCES members(member_id),
    CONSTRAINT FK_DM_receiver_id FOREIGN KEY(receiver_id) REFERENCES members(member_id)
    );
    
    commit;
  
</div>
</details>

<details>
<summary>팔로워,팔로잉 트리거</summary>
<div markdown="1">       


    create or replace TRIGGER TR_MEMBERS_FOLLOWER_NUM_UPDATE
    BEFORE INSERT OR DELETE ON MEMBER_FOLLOW
    --REFERENCING NEW AS new OLD AS old
    FOR EACH ROW
    BEGIN
    IF INSERTING THEN
    --    A > B 팔로우 시 A의 팔로잉 값
    update members m
    set following_num = following_num + 1
    WHERE m.member_id = :new.member_id;
    --    A > B 팔로우 시 B의 팔로워 값
    update members m
    set follower_num = follower_num + 1
    where m.member_id = :new.follow_id;
    ELSIF DELETING THEN
    --    A > B 언팔로우 시 A의 팔로잉 값
    update members m
    set following_num = following_num - 1
    WHERE m.member_id = :old.member_id;
    --    A > B 언팔로우 시 B의 팔로워 값
    update members m
    set follower_num = follower_num - 1
    where m.member_id = :old.follow_id;
    END IF;
    END TR_MEMBERS_FOLLOWER_NUM_UPDATE;
  
</div>
</details>  

    

# 화면 예시

1. 로그인

![image](https://user-images.githubusercontent.com/45135200/140076691-9d14c54b-17dd-4ad0-a7d5-1ba7ff3c371a.png)
2. 피드

![image](https://user-images.githubusercontent.com/45135200/140076721-25a3ae52-8d15-41a3-9523-ba1e904b6acf.png)
3. DM
- DM 미선택

![image](https://user-images.githubusercontent.com/45135200/140076769-bf4f65ca-751b-4b6b-9418-5c14cf1b75f6.png)
- DM선택

![image](https://user-images.githubusercontent.com/45135200/140076791-c5ea4068-d96e-4ea5-893c-dafcd62f21b2.png)
