
/**********************************/
/* Table Name: 적금 상품 */
/**********************************/
CREATE TABLE IMONEY(
		installno                     		INTEGER(10)		 NOT NULL		 PRIMARY KEY,
		prodno                        		NUMBER(10)		 NULL ,
		bank                          		VARCHAR2(30)		 NOT NULL,
		iname                         		VARCHAR2(50)		 NOT NULL,
		area                          		VARCHAR2(20)		 NOT NULL,
		per                           		INTEGER(10)		 NOT NULL,
		drate                         		DATE		 NOT NULL,
		ADMINNO                       		NUMBER(10)		 NULL ,
  FOREIGN KEY (prodno) REFERENCES product (prodno),
  FOREIGN KEY (ADMINNO) REFERENCES ADMIN (ADMINNO)
);

COMMENT ON TABLE IMONEY is '적금 상품';
COMMENT ON COLUMN IMONEY.installno is '적금 상품 번호';
COMMENT ON COLUMN IMONEY.prodno is '상품 카테고리 번호';
COMMENT ON COLUMN IMONEY.bank is '은행명';
COMMENT ON COLUMN IMONEY.iname is '적금';
COMMENT ON COLUMN IMONEY.area is '지역';
COMMENT ON COLUMN IMONEY.per is '이자율';
COMMENT ON COLUMN IMONEY.drate is '등록일';
COMMENT ON COLUMN IMONEY.ADMINNO is '관리자 번호';


/**********************************/
/* Table Name: 예금상품비교 */
/**********************************/
CREATE TABLE dCOMPARE(
		comprodno                     		NUMBER(10)		 NULL 		 PRIMARY KEY,
		depositno                     		INTEGER(10)		 NULL ,
		profit                        		INTEGER(30)		 DEFAULT 0		 NOT NULL,
		bank                          		VARCHAR2(30)		 NOT NULL,
		iname                         		VARCHAR2(50)		 NOT NULL,
		area                          		VARCHAR2(20)		 NOT NULL,
		per                           		INTEGER(10)		 NOT NULL,
		profitdate                    		INTEGER(10)		 NOT NULL,
		siteno                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (depositno) REFERENCES deposit (depositno)
);

COMMENT ON TABLE dCOMPARE is '예금상품비교';
COMMENT ON COLUMN dCOMPARE.comprodno is '비교 상품 번호';
COMMENT ON COLUMN dCOMPARE.depositno is '예금 상품 번호';
COMMENT ON COLUMN dCOMPARE.profit is '예상 수익금';
COMMENT ON COLUMN dCOMPARE.bank is '은행명';
COMMENT ON COLUMN dCOMPARE.iname is '적금';
COMMENT ON COLUMN dCOMPARE.area is '지역';
COMMENT ON COLUMN dCOMPARE.per is '이자율';
COMMENT ON COLUMN dCOMPARE.profitdate is '예/적금 기간';
COMMENT ON COLUMN dCOMPARE.siteno is '사이트 번호';


/**********************************/
/* Table Name: 적금상품비교 */
/**********************************/
CREATE TABLE iCOMPARE(
		comprodno                     		NUMBER(10)		 NULL 		 PRIMARY KEY,
		installno                     		INTEGER(10)		 NULL ,
		profit                        		INTEGER(30)		 DEFAULT 0		 NOT NULL,
		bank                          		VARCHAR2(30)		 NOT NULL,
		iname                         		VARCHAR2(50)		 NOT NULL,
		area                          		VARCHAR2(20)		 NOT NULL,
		per                           		INTEGER(10)		 NOT NULL,
		profitdate                    		INTEGER(10)		 NOT NULL,
		siteno                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (installno) REFERENCES IMONEY (installno)
);

COMMENT ON TABLE iCOMPARE is '적금상품비교';
COMMENT ON COLUMN iCOMPARE.comprodno is '비교 상품 번호';
COMMENT ON COLUMN iCOMPARE.installno is '적금 상품 번호';
COMMENT ON COLUMN iCOMPARE.profit is '예상 수익금';
COMMENT ON COLUMN iCOMPARE.bank is '은행명';
COMMENT ON COLUMN iCOMPARE.iname is '적금';
COMMENT ON COLUMN iCOMPARE.area is '지역';
COMMENT ON COLUMN iCOMPARE.per is '이자율';
COMMENT ON COLUMN iCOMPARE.profitdate is '예/적금 기간';
COMMENT ON COLUMN iCOMPARE.siteno is '사이트 번호';
