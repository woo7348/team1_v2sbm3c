-- 모든 레코드 삭제
DELETE FROM imoney;
commit;

/**********************************/
/* Table Name: 적금 상품 */
/**********************************/
CREATE TABLE imoney(
    installno                         INTEGER(10)    NOT NULL    PRIMARY KEY,
    prodno                            NUMBER(10)     NULL ,
    bank                              VARCHAR2(30)     NOT NULL,
    iname                             VARCHAR2(50)     NOT NULL,
    area                              VARCHAR2(20)     NOT NULL,
    per                               NUMBER(10)    NOT NULL,
    rdate                             DATE     NOT NULL,
    adminno                           NUMBER(10)     NULL ,
  FOREIGN KEY (prodno) REFERENCES product (prodno),
  FOREIGN KEY (adminno) REFERENCES admin (adminno)
);

COMMENT ON TABLE imoney is '적금 상품';
COMMENT ON COLUMN imoney.installno is '적금 상품 번호';
COMMENT ON COLUMN imoney.prodno is '상품 카테고리 번호';
COMMENT ON COLUMN imoney.bank is '은행명';
COMMENT ON COLUMN imoney.iname is '적금';
COMMENT ON COLUMN imoney.area is '지역';
COMMENT ON COLUMN imoney.per is '이자율';
COMMENT ON COLUMN imoney.rdate is '등록일';
COMMENT ON COLUMN imoney.adminno is '관리자 번호';


DROP SEQUENCE imoney_seq;

CREATE SEQUENCE imoney_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

-- 등록
INSERT INTO imoney(installno, prodno, bank, iname, area, per, rdate, adminno)
VALUES(imoney.seq.nextval,12345,1,'신한은행', '서울', 3, DATE, 1);

-- FK 컬럼의 값이 사전에 등록되었는지 확인
-- ORA-02291: integrity constraint (AI8.SYS_C007066) violated - parent key not found


-- 목록
SELECT installno, prodno, bank, iname, area, per, rdate, adminno
FROM imoney
ORDER BY installno ASC;

commit;

-- 조회, 수정폼
SELECT installno, prodno, bank, iname, area, per, rdate, adminno 
FROM imoney
WHERE installno = 1;

commit;

--수정
UPDATE installno
SET per=5, area='대구'
WHERE installno=1;

commit;

-- 삭제
DELETE FROM imoney
WHERE installno = 1;
commit;


