

/**********************************/
/* Table Name: 게시판 */
/**********************************/
CREATE TABLE notice(
    noticeno                          NUMBER(10)     NOT NULL    PRIMARY KEY,
    categrpno                         NUMBER(10)     NULL ,
    title                             VARCHAR2(300)    NOT NULL,
    content                           INTEGER(4000)    NOT NULL,
    file1                             VARCHAR2(100)    NOT NULL,
    file1saved                        VARCHAR2(100)    NOT NULL,
    thumb1                            VARCHAR2(100)    NOT NULL,
    size1                             NUMBER(10)     NOT NULL,
    cnt                               NUMBER(10)     NOT NULL,
    replycnt                          NUMBER(10)     NOT NULL,
    rdate                             DATE     NOT NULL,
    MEMBERNO                          NUMBER(10)     NULL ,
  FOREIGN KEY (categrpno) REFERENCES categrp (categrpno),
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO)
);

COMMENT ON TABLE notice is '게시판';
COMMENT ON COLUMN notice.noticeno is '게시판 번호';
COMMENT ON COLUMN notice.categrpno is '카테고리 그룹 번호';
COMMENT ON COLUMN notice.title is '제목';
COMMENT ON COLUMN notice.content is '내용';
COMMENT ON COLUMN notice.file1 is '메인이미지';
COMMENT ON COLUMN notice.file1saved is '실제 저장 이미지';
COMMENT ON COLUMN notice.thumb1 is '메인 이미지 Preview';
COMMENT ON COLUMN notice.size1 is '이미지 사이즈';
COMMENT ON COLUMN notice.cnt is '추천수';
COMMENT ON COLUMN notice.replycnt is '조회수';
COMMENT ON COLUMN notice.rdate is '등록일';
COMMENT ON COLUMN notice.MEMBERNO is '회원 번호';
