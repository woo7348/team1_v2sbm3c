/**********************************/
/* Table Name: 게시판 */
/**********************************/
CREATE TABLE notice(
		noticeno                      		NUMBER(10)		 NOT NULL,
		categrpno                     		NUMBER(10)		 NULL ,
        MEMBERNO                      		NUMBER(10)		 NULL,
		title                         		VARCHAR2(300)		 NOT NULL,
		content                       		INTEGER(4000)		 NOT NULL,
		file1                         		VARCHAR2(100)		 NOT NULL,
		file1saved                    		VARCHAR2(100)		 NOT NULL,
		thumb1                        		VARCHAR2(100)		 NOT NULL,
		size1                         		NUMBER(10)		 NOT NULL,
		cnt                           		NUMBER(10)		 NOT NULL,
		replycnt                      		NUMBER(10)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
        FOREIGN KEY (categrpno) REFERENCES categrp (categrpno),
        FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE notice is '게시판';
COMMENT ON COLUMN notice.noticeno is '게시판 번호';
COMMENT ON COLUMN notice.categrpno is '카테고리 그룹 번호';
COMMENT ON COLUMN notice.MEMBERNO is '회원 번호';
COMMENT ON COLUMN notice.title is '제목';
COMMENT ON COLUMN notice.content is '내용';
COMMENT ON COLUMN notice.file1 is '메인이미지';
COMMENT ON COLUMN notice.file1saved is '실제 저장 이미지';
COMMENT ON COLUMN notice.thumb1 is '메인 이미지 Preview';
COMMENT ON COLUMN notice.size1 is '이미지 사이즈';
COMMENT ON COLUMN notice.cnt is '추천수';
COMMENT ON COLUMN notice.replycnt is '조회수';
COMMENT ON COLUMN notice.rdate is '등록일';


DROP SEQUENCE notice_seq;

-- Sequence 생성 SQL
CREATE SEQUENCE notice_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지
  
-- 등록: 3건 이상
INSERT INTO notice(noticeno, categrpno, memberno, title, content, file1, file1saved, thumb1, size, cnt, replycnt, rdate)
VALUES(notice_seq.nextval, 1, 1, '추천합니다', '좋은 상품',  'space.jpg', 'space_1.jpg', 'space_t.jpg', 1000, 0, 0, sysdate);
INSERT INTO notice(noticeno, categrpno, memberno, title, content, file1, file1saved, thumb1, size, cnt, replycnt, rdate)
VALUES(notice_seq.nextval, 1, 1, '강추', 'KM 은향',  'coin.jpg', 'coin_1.jpg', 'coin_t.jpg', 1000, 0, 0, sysdate);
INSERT INTO notice(noticeno, categrpno, memberno, title, content, file1, file1saved, thumb1, size, cnt, replycnt, rdate)
VALUES(notice_seq.nextval, 1, 1, '최고', '적금 상품',  'money.jpg', 'money_1.jpg', 'smoney_t.jpg', 1000, 0, 0, sysdate);

-- 전체 목록
SELECT noticeno, categrpno, memberno, title, content, file1, file1saved, thumb1, size, cnt, replycnt, rdate
FROM notice
ORDER BY noticeno ASC;

-- 조회
SELECT noticeno, categrpno, memberno, title, content, file1, file1saved, thumb1, size, cnt, replycnt, rdate
FROM notice
WHERE noticeno = 1;

-- 수정
UPDATE notice
SET title='비추천', content='별로예요'
WHERE prodno=1;

-- 삭제
DELETE FROM notice
WHERE noticeno=1;

-- 레코드 갯수
SELECT COUNT(*) FROM notice;

-- FK 컬럼 기준 카운트, 특정 그룹에 속한 레코드 갯수 산출
SELECT COUNT(*)
FROM notice
WHERE categrpno=1;

-- FK 컬럼 기준 삭제, 특정 그룹에 속한 레코드 모두 삭제
DELETE FROM notice
WHERE categrpno=1;
