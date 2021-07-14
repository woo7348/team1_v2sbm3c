/**********************************/
/* Table Name: 카테고리 그룹 */
/**********************************/
CREATE TABLE categrp(
		categrpno                     		NUMBER(10)		 NOT NULL,
		name                          		VARCHAR2(50)		 NOT NULL,
		seqno                         		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		rdate                         		DATE		 NOT NULL
);

COMMENT ON TABLE categrp is '카테고리 그룹';
COMMENT ON COLUMN categrp.categrpno is '카테고리 그룹 번호';
COMMENT ON COLUMN categrp.name is '이름';
COMMENT ON COLUMN categrp.seqno is '출력 순서';
COMMENT ON COLUMN categrp.visible is '출력 모드';
COMMENT ON COLUMN categrp.rdate is '그룹 생성일';


/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE MEMBER(
		MEMBERNO                      		NUMBER(10)		 NOT NULL,
		ID                            		VARCHAR2(20)		 NOT NULL,
		PASSWD                        		VARCHAR2(60)		 NOT NULL,
		MNAME                         		VARCHAR2(30)		 NOT NULL,
		TEL                           		VARCHAR2(14)		 NOT NULL,
		ZIPCODE                       		VARCHAR2(5)		 NULL ,
		ADDRESS1                      		VARCHAR2(80)		 NULL ,
		EADDRESS                      		VARCHAR2(50)		 NULL ,
		MDATE                         		DATE		 NOT NULL,
		GRADE                         		NUMBER(2)		 NOT NULL
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


/**********************************/
/* Table Name: 게시판 */
/**********************************/
CREATE TABLE notice(
		noticeno                      		NUMBER(10)		 NOT NULL,
		categrpno                     		NUMBER(10)		 NULL ,
		title                         		VARCHAR2(300)		 NOT NULL,
		content                       		INTEGER(4000)		 NOT NULL,
		file1                         		VARCHAR2(100)		 NOT NULL,
		file1saved                    		VARCHAR2(100)		 NOT NULL,
		thumb1                        		VARCHAR2(100)		 NOT NULL,
		size1                         		NUMBER(10)		 NOT NULL,
		cnt                           		NUMBER(10)		 NOT NULL,
		replycnt                      		NUMBER(10)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		MEMBERNO                      		NUMBER(10)		 NULL 
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


/**********************************/
/* Table Name: 사이트 */
/**********************************/
CREATE TABLE site(
		siteno                        		NUMBER(10)		 NOT NULL,
		sitename                      		VARCHAR2(30)		 NOT NULL,
		surl                          		VARCHAR2(100)		 NOT NULL,
		sdate                         		DATE		 NOT NULL,
		noticeno                      		NUMBER(10)		 NULL 
);

COMMENT ON TABLE site is '사이트';
COMMENT ON COLUMN site.siteno is '사이트 번호';
COMMENT ON COLUMN site.sitename is '사이트 이름';
COMMENT ON COLUMN site.surl is '주소';
COMMENT ON COLUMN site.sdate is '등록일';
COMMENT ON COLUMN site.noticeno is '게시판 번호';


/**********************************/
/* Table Name: 상품 카테고리 */
/**********************************/
CREATE TABLE product(
		prodno                        		NUMBER(10)		 NOT NULL,
		categrpno                     		NUMBER(10)		 NULL ,
		prodname                      		VARCHAR2(30)		 NOT NULL,
		seqno                         		NUMBER(10)		 NOT NULL,
		pdate                         		VARCHAR2(30)		 NOT NULL
);

COMMENT ON TABLE product is '상품 카테고리';
COMMENT ON COLUMN product.prodno is '상품 카테고리 번호';
COMMENT ON COLUMN product.categrpno is '카테고리 그룹 번호';
COMMENT ON COLUMN product.prodname is '상품 이름';
COMMENT ON COLUMN product.seqno is '출력 순서';
COMMENT ON COLUMN product.pdate is '등록일';


/**********************************/
/* Table Name: 관리자 */
/**********************************/
CREATE TABLE ADMIN(
		ADMINNO                       		NUMBER(10)		 NOT NULL,
		ID                            		VARCHAR2(20)		 NOT NULL,
		NAME                          		VARCHAR2(300)		 NOT NULL,
		PASSWORD                      		VARCHAR2(100)		 NOT NULL,
		AUTHORITY                     		VARCHAR2(20)		 NOT NULL,
		ENABLED                       		NUMBER(38)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL
);

COMMENT ON TABLE ADMIN is '관리자';
COMMENT ON COLUMN ADMIN.ADMINNO is '관리자 번호';
COMMENT ON COLUMN ADMIN.ID is '아이디';
COMMENT ON COLUMN ADMIN.NAME is '성명';
COMMENT ON COLUMN ADMIN.PASSWORD is '패스워드';
COMMENT ON COLUMN ADMIN.AUTHORITY is '권한, ROLE_ADMIN, ROLE_USER 지정됨';
COMMENT ON COLUMN ADMIN.ENABLED is '사용 여부, 1: 활성, 0: 비활성 지정됨';
COMMENT ON COLUMN ADMIN.RDATE is '등록일';


/**********************************/
/* Table Name: 예금 상품 */
/**********************************/
CREATE TABLE deposit(
		depositno                     		INTEGER(10)		 NOT NULL,
		prodno                        		NUMBER(10)		 NULL ,
		bank                          		VARCHAR2(30)		 NOT NULL,
		dname                         		VARCHAR2(50)		 NOT NULL,
		area                          		VARCHAR2(20)		 NOT NULL,
		per                           		INTEGER(10)		 NOT NULL,
		drate                         		DATE		 NOT NULL,
		ADMINNO                       		NUMBER(10)		 NULL 
);

COMMENT ON TABLE deposit is '예금 상품';
COMMENT ON COLUMN deposit.depositno is '예금 상품 번호';
COMMENT ON COLUMN deposit.prodno is '상품 카테고리 번호';
COMMENT ON COLUMN deposit.bank is '은행명';
COMMENT ON COLUMN deposit.dname is '예금상품명';
COMMENT ON COLUMN deposit.area is '지역';
COMMENT ON COLUMN deposit.per is '이자율';
COMMENT ON COLUMN deposit.drate is '등록일';
COMMENT ON COLUMN deposit.ADMINNO is '관리자 번호';


/**********************************/
/* Table Name: 적금 상품 */
/**********************************/
CREATE TABLE IMONEY(
		installno                     		INTEGER(10)		 NOT NULL,
		prodno                        		NUMBER(10)		 NULL ,
		bank                          		VARCHAR2(30)		 NOT NULL,
		iname                         		VARCHAR2(50)		 NOT NULL,
		area                          		VARCHAR2(20)		 NOT NULL,
		per                           		INTEGER(10)		 NOT NULL,
		drate                         		DATE		 NOT NULL,
		ADMINNO                       		NUMBER(10)		 NULL 
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
		comprodno                     		NUMBER(10)		 NULL ,
		depositno                     		INTEGER(10)		 NULL ,
		profit                        		INTEGER(30)		 DEFAULT 0		 NOT NULL,
		bank                          		VARCHAR2(30)		 NOT NULL,
		iname                         		VARCHAR2(50)		 NOT NULL,
		area                          		VARCHAR2(20)		 NOT NULL,
		per                           		INTEGER(10)		 NOT NULL,
		profitdate                    		INTEGER(10)		 NOT NULL,
		siteno                        		NUMBER(10)		 NULL 
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
		comprodno                     		NUMBER(10)		 NULL ,
		installno                     		INTEGER(10)		 NULL ,
		profit                        		INTEGER(30)		 DEFAULT 0		 NOT NULL,
		bank                          		VARCHAR2(30)		 NOT NULL,
		iname                         		VARCHAR2(50)		 NOT NULL,
		area                          		VARCHAR2(20)		 NOT NULL,
		per                           		INTEGER(10)		 NOT NULL,
		profitdate                    		INTEGER(10)		 NOT NULL,
		siteno                        		NUMBER(10)		 NULL 
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



ALTER TABLE categrp ADD CONSTRAINT IDX_categrp_PK PRIMARY KEY (categrpno);

ALTER TABLE MEMBER ADD CONSTRAINT IDX_MEMBER_PK PRIMARY KEY (MEMBERNO);

ALTER TABLE notice ADD CONSTRAINT IDX_notice_PK PRIMARY KEY (noticeno);
ALTER TABLE notice ADD CONSTRAINT IDX_notice_FK0 FOREIGN KEY (categrpno) REFERENCES categrp (categrpno);
ALTER TABLE notice ADD CONSTRAINT IDX_notice_FK1 FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO);

ALTER TABLE site ADD CONSTRAINT IDX_site_PK PRIMARY KEY (siteno);
ALTER TABLE site ADD CONSTRAINT IDX_site_FK0 FOREIGN KEY (noticeno) REFERENCES notice (noticeno);

ALTER TABLE product ADD CONSTRAINT IDX_product_PK PRIMARY KEY (prodno);
ALTER TABLE product ADD CONSTRAINT IDX_product_FK0 FOREIGN KEY (categrpno) REFERENCES categrp (categrpno);

ALTER TABLE ADMIN ADD CONSTRAINT IDX_ADMIN_PK PRIMARY KEY (ADMINNO);

ALTER TABLE deposit ADD CONSTRAINT IDX_deposit_PK PRIMARY KEY (depositno);
ALTER TABLE deposit ADD CONSTRAINT IDX_deposit_FK0 FOREIGN KEY (prodno) REFERENCES product (prodno);
ALTER TABLE deposit ADD CONSTRAINT IDX_deposit_FK1 FOREIGN KEY (ADMINNO) REFERENCES ADMIN (ADMINNO);

ALTER TABLE IMONEY ADD CONSTRAINT IDX_IMONEY_PK PRIMARY KEY (installno);
ALTER TABLE IMONEY ADD CONSTRAINT IDX_IMONEY_FK0 FOREIGN KEY (prodno) REFERENCES product (prodno);
ALTER TABLE IMONEY ADD CONSTRAINT IDX_IMONEY_FK1 FOREIGN KEY (ADMINNO) REFERENCES ADMIN (ADMINNO);

ALTER TABLE dCOMPARE ADD CONSTRAINT IDX_dCOMPARE_PK PRIMARY KEY (comprodno);
ALTER TABLE dCOMPARE ADD CONSTRAINT IDX_dCOMPARE_FK0 FOREIGN KEY (depositno) REFERENCES deposit (depositno);

ALTER TABLE iCOMPARE ADD CONSTRAINT IDX_iCOMPARE_PK PRIMARY KEY (comprodno);
ALTER TABLE iCOMPARE ADD CONSTRAINT IDX_iCOMPARE_FK0 FOREIGN KEY (installno) REFERENCES IMONEY (installno);

