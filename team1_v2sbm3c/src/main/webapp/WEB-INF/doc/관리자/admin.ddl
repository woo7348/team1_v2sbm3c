/**********************************/
/* Table Name: 관리자 */
/**********************************/
CREATE TABLE ADMIN(
    ADMINNO                           NUMBER(10)     NOT NULL    PRIMARY KEY,
    ID                                VARCHAR2(20)     NOT NULL,
    NAME                              VARCHAR2(300)    NOT NULL,
    PASSWORD                          VARCHAR2(100)    NOT NULL,
    AUTHORITY                         VARCHAR2(20)     NOT NULL,
    ENABLED                           NUMBER(38)     NOT NULL,
    RDATE                             DATE     NOT NULL
);

COMMENT ON TABLE ADMIN is '관리자';
COMMENT ON COLUMN ADMIN.ADMINNO is '관리자 번호';
COMMENT ON COLUMN ADMIN.ID is '아이디';
COMMENT ON COLUMN ADMIN.NAME is '성명';
COMMENT ON COLUMN ADMIN.PASSWORD is '패스워드';
COMMENT ON COLUMN ADMIN.AUTHORITY is '권한, ROLE_ADMIN, ROLE_USER 지정됨';
COMMENT ON COLUMN ADMIN.ENABLED is '사용 여부, 1: 활성, 0: 비활성 지정됨';
COMMENT ON COLUMN ADMIN.RDATE is '등록일';
