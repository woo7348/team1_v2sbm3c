/**********************************/
/* Table Name: ȸ�� */
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

COMMENT ON TABLE MEMBER is 'ȸ��';
COMMENT ON COLUMN MEMBER.MEMBERNO is 'ȸ�� ��ȣ';
COMMENT ON COLUMN MEMBER.ID is '���̵�';
COMMENT ON COLUMN MEMBER.PASSWD is '�н�����';
COMMENT ON COLUMN MEMBER.MNAME is '����';
COMMENT ON COLUMN MEMBER.TEL is '��ȭ��ȣ';
COMMENT ON COLUMN MEMBER.ZIPCODE is '�����ȣ';
COMMENT ON COLUMN MEMBER.ADDRESS1 is '�ּ�1';
COMMENT ON COLUMN MEMBER.EADDRESS is '�̸����ּ�';
COMMENT ON COLUMN MEMBER.MDATE is '������';
COMMENT ON COLUMN MEMBER.GRADE is '���';
