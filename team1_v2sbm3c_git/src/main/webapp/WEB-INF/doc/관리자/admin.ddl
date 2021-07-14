/**********************************/
/* Table Name: 관리자 */
/**********************************/
CREATE TABLE admin(
    adminno                           NUMBER(10)     NOT NULL    PRIMARY KEY,
    id                                VARCHAR2(20)     NOT NULL,
    name                              VARCHAR2(300)    NOT NULL,
    password                          VARCHAR2(100)    NOT NULL,
    authority                         VARCHAR2(20)     NOT NULL,
    enabled                           NUMBER(38)     NOT NULL,
    rdate                             DATE     NOT NULL
);

COMMENT ON TABLE admin is '관리자';
COMMENT ON COLUMN admin.adminno is '관리자 번호';
COMMENT ON COLUMN admin.id is '아이디';
COMMENT ON COLUMN admin.name is '성명';
COMMENT ON COLUMN admin.password is '패스워드';
COMMENT ON COLUMN admin.authority is '권한, ROLE_ADMIN, ROLE_USER 지정됨';
COMMENT ON COLUMN admin.enabled is '사용 여부, 1: 활성, 0: 비활성 지정됨';
COMMENT ON COLUMN admin.rdate is '등록일';

DROP SEQUENCE admin_seq;

CREATE SEQUENCE admin_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

2. 등록
-- 1234 암호화: $2a$10$AVq05lsMMJbO7jBJMUCjo.VAQlWRnSLt5VUhhR5.EHPoS5CvYNB5W
INSERT INTO admin(adminno, id, name, password, authority, enabled, rdate)
VALUES(admin_seq.nextval, 'user1', '왕눈이', '$2a$10$AVq05lsMMJbO7jBJMUCjo.VAQlWRnSLt5VUhhR5.EHPoS5CvYNB5W', 'ROLE_USER', 1, sysdate);
INSERT INTO admin(adminno, id, name, password, authority, enabled, rdate)
VALUES(admin_seq.nextval, 'admin1', '아로미', '$2a$10$AVq05lsMMJbO7jBJMUCjo.VAQlWRnSLt5VUhhR5.EHPoS5CvYNB5W', 'ROLE_ADMIN', 1, sysdate);

COMMIT;


3. 목록
SELECT adminno, id, name, password, authority, enabled, rdate
FROM admin
ORDER BY adminno ASC;

4. 조회
SELECT adminno, id, name, password, authority, enabled, rdate
FROM admin
WHERE adminno = 1;

-- Spring security는 기본적으로 사용자 이름(id)을 username, 패스워드를 password 컬럼을 이용함
-- 로그인처리
SELECT id as username, password, enabled
FROM admin
WHERE id = 'user1';

-- 권한 로딩
SELECT id as username, authority
FROM admin
WHERE id = 'user1';

5. 삭제
DELETE FROM admin;

COMMIT;
  