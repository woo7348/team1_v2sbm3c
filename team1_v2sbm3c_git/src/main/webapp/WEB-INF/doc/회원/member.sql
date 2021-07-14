/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE member(
    memberno                          NUMBER(10)     NOT NULL    PRIMARY KEY,
    id                                VARCHAR2(20)     NOT NULL,
    passwd                            VARCHAR2(60)     NOT NULL,
    mname                             VARCHAR2(30)     NOT NULL,
    tel                               VARCHAR2(14)     NOT NULL,
    zipcode                           VARCHAR2(5)    NULL ,
    address                          VARCHAR2(80)     NULL ,
    email                          VARCHAR2(50)     NULL ,
    mdate                             DATE     NOT NULL,
    grade                             NUMBER(2)    NOT NULL --(1~10: 관리자, 11~20: 회원, 비회원: 30~39, 정지 회원: 40~49, 탈퇴 회원: 99)
);


COMMENT ON TABLE member is '회원';
COMMENT ON COLUMN member.memberno is '회원 번호';
COMMENT ON COLUMN member.id is '아이디';
COMMENT ON COLUMN member.passwd is '패스워드';
COMMENT ON COLUMN member.mname is '성명';
COMMENT ON COLUMN member.tel is '전화번호';
COMMENT ON COLUMN member.zipcode is '우편번호';
COMMENT ON COLUMN member.address is '주소';
COMMENT ON COLUMN member.email is '이메일주소';
COMMENT ON COLUMN member.mdate is '가입일';
COMMENT ON COLUMN member.grade is '등급';

DROP SEQUENCE member_seq;
CREATE SEQUENCE member_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
 
 
1. 등록
 
1) id 중복 확인(null 값을 가지고 있으면 count에서 제외됨)
SELECT COUNT(id)
FROM member
WHERE id='user1';

SELECT COUNT(id) as cnt
FROM member
WHERE id='user1';
 
 cnt
 ---
   0   ← 중복 되지 않음.
   
2) 등록
-- 회원 관리용 계정, Q/A 용 계정
INSERT INTO member(memberno, id, passwd, mname, tel, zipcode,
                                 address, email, mdate, grade)
VALUES (member_seq.nextval, 'admin', '1234', '관리자', '000-0000-0000', '12345',
             '서울시 종로구', '관철동', sysdate, 1);
 
INSERT INTO member(memberno, id, passwd, mname, tel, zipcode,
                                address, email, mdate, grade)
VALUES (member_seq.nextval, 'crm', '1234', '댓글관리자', '000-0000-0000', '12345',
             '서울시 종로구', '관철동', sysdate, 1);
 
-- 개인 회원 테스트 계정
INSERT INTO member(memberno, id, passwd, mname, tel, zipcode, address, email, mdate, grade)
VALUES (member_seq.nextval, 'user1', '1234', '왕눈이', '000-0000-0000', '12345', '서울시 종로구', '관철동', sysdate, 15);
 
INSERT INTO member(memberno, id, passwd, mname, tel, zipcode, address, email, mdate, grade)
VALUES (member_seq.nextval, 'user2', '1234', '아로미', '000-0000-0000', '12345', '서울시 종로구', '관철동', sysdate, 15);
 
INSERT INTO member(memberno, id, passwd, mname, tel, zipcode, address, email, mdate, grade)
VALUES (member_seq.nextval, 'user3', '1234', '투투투', '000-0000-0000', '12345', '서울시 종로구', '관철동', sysdate, 15);
 
-- 부서별(그룹별) 공유 회원 기준
INSERT INTO member(memberno, id, passwd, mname, tel, zipcode, address, email, mdate, grade)
VALUES (member_seq.nextval, 'team1', '1234', '개발팀', '000-0000-0000', '12345', '서울시 종로구', '관철동', sysdate, 15);
 
INSERT INTO member(memberno, id, passwd, mname, tel, zipcode, address, email, mdate, grade)
VALUES (member_seq.nextval, 'team2', '1234', '웹퍼블리셔팀', '000-0000-0000', '12345', '서울시 종로구', '관철동', sysdate, 15);
 
INSERT INTO member(memberno, id, passwd, mname, tel, zipcode, address, email, mdate, grade)
VALUES (member_seq.nextval, 'team3', '1234', '디자인팀', '000-0000-0000', '12345', '서울시 종로구', '관철동', sysdate, 15);

COMMIT;

 
2. 목록
- 검색을 하지 않는 경우, 전체 목록 출력
 
SELECT memberno, id, passwd, mname, tel, zipcode, address, email, mdate, grade
FROM member
ORDER BY memberno ASC;
     
     
3. 조회
 
1) user1 사원 정보 보기
SELECT memberno, id, passwd, mname, tel, zipcode, address, email, mdate, grade
FROM member
WHERE memberno = 1;

SELECT memberno, id, passwd, mname, tel, zipcode, address, email, mdate, grade
FROM member
WHERE id = 'user1';
 
    
4. 수정
UPDATE member 
SET mname='아로미', tel='111-1111-1111', zipcode='00000',
      address='경기도', email='파주시', grade=14
WHERE memberno=1;

COMMIT;

 
5. 삭제
1) 모두 삭제
DELETE FROM member;
 
2) 특정 회원 삭제
DELETE FROM member
WHERE memberno=15;

COMMIT;

 
6. 패스워드 변경
1) 패스워드 검사
SELECT COUNT(memberno) as cnt
FROM member
WHERE memberno=1 AND passwd='1234';
 
2) 패스워드 수정
UPDATE member
SET passwd='0000'
WHERE memberno=1;

COMMIT;
 
 
7. 로그인
SELECT COUNT(memberno) as cnt
FROM member
WHERE id='user1' AND passwd='1234';
 cnt
 ---
   0

-- id를 이용한 회원 정보 조회
SELECT memberno, id, passwd, mname, tel, zipcode, address, email, mdate, grade
FROM member
WHERE id = 'user1';
 
 memberno id    passwd mname tel           zipcode address email mdate  grade
 --- ----- ------ ----- ------------- ------- -------- -------- --------------------- -----
   3 user1 1234   왕눈이   000-0000-0000 12345   서울시 종로구  관철동      2019-05-24 14:51:48.0 15