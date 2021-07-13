/**********************************/
/* Table Name: 상품 */
/**********************************/
-- 테이블 생성 DDL
CREATE TABLE product(
		prodno                        		NUMBER(10)		 NOT NULL,
		categrpno                     		NUMBER(10)		 NULL ,
		prodname                      		VARCHAR2(30)		 NOT NULL,
		seqno                         		NUMBER(10)		 NOT NULL,
		pdate                         		VARCHAR2(30)		 NOT NULL
);

COMMENT ON TABLE product is '상품';
COMMENT ON COLUMN product.prodno is '상품 번호';
COMMENT ON COLUMN product.categrpno is '카테고리 그룹 번호';
COMMENT ON COLUMN product.prodname is '상품 이름';
COMMENT ON COLUMN product.seqno is '출력 순서';
COMMENT ON COLUMN product.pdate is '등록일';

DROP SEQUENCE product_seq;

-- Sequence 생성 SQL
CREATE SEQUENCE product_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지
  
-- 등록: 3건 이상
INSERT INTO product(prodno, categrpno, prodname, seqno, pdate)
VALUES(product_seq.nextval, 1, '적금', 1, sysdate);
INSERT INTO product(prodno, categrpno, prodname, seqno, pdate)
VALUES(product_seq.nextval, 1, '예금', 2, sysdate);

-- 전체 목록
SELECT prodno, categrpno, prodname, seqno, pdate
FROM product
ORDER BY prodno ASC;

-- 조회
SELECT prodno, categrpno, prodname, seqno, pdate
FROM product
WHERE prodno = 1;

-- 수정
UPDATE product
SET prodname='연금',seqno=3
WHERE prodno=1;

-- 삭제
DELETE FROM product
WHERE prodno=1;

-- 레코드 갯수
SELECT COUNT(*) FROM product
;

-- FK 컬럼 기준 카운트, 특정 그룹에 속한 레코드 갯수 산출

-- FK 컬럼 기준 삭제, 특정 그룹에 속한 레코드 모두 삭제