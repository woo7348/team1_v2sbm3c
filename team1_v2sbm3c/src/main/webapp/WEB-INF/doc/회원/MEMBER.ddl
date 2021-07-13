/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE MEMBER(
    MEMBERNO                          NUMBER(10)     NOT NULL    PRIMARY KEY,
    ID                                VARCHAR2(20)     NOT NULL,
    PASSWD                            VARCHAR2(60)     NOT NULL,
    MNAME                             VARCHAR2(30)     NOT NULL,
    TEL                               VARCHAR2(14)     NOT NULL,
    ZIPCODE                           VARCHAR2(5)    NULL ,
    ADDRESS1                          VARCHAR2(80)     NULL ,
    EADDRESS                          VARCHAR2(50)     NULL ,
    MDATE                             DATE     NOT NULL,
    GRADE                             NUMBER(2)    NOT NULL
);

COMMENT ON TABLE MEMBER is '회원';
COMMENT ON COLUMN MEMBER.MEMBERNO is '회원 번호';
COMMENT ON COLUMN MEMBER.ID is '아이디';
COMMENT ON COLUMN MEMBER.PASSWD is '패스워드';
COMMENT ON COLUMN MEMBER.MNAME is '성명';
COMMENT ON COLUMN MEMBER.TEL is '전화번호';
COMMENT ON COLUMN MEMBER.ZIPCODE is '우편번호';
COMMENT ON COLUMN MEMBER.ADDRESS1 is '주소1';
COMMENT ON COLUMN MEMBER.EADDRESS is '이메일주소';
COMMENT ON COLUMN MEMBER.MDATE is '가입일';
COMMENT ON COLUMN MEMBER.GRADE is '등급';
