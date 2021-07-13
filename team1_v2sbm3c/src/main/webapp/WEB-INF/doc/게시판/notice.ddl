

/**********************************/
/* Table Name: �Խ��� */
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

COMMENT ON TABLE notice is '�Խ���';
COMMENT ON COLUMN notice.noticeno is '�Խ��� ��ȣ';
COMMENT ON COLUMN notice.categrpno is 'ī�װ� �׷� ��ȣ';
COMMENT ON COLUMN notice.title is '����';
COMMENT ON COLUMN notice.content is '����';
COMMENT ON COLUMN notice.file1 is '�����̹���';
COMMENT ON COLUMN notice.file1saved is '���� ���� �̹���';
COMMENT ON COLUMN notice.thumb1 is '���� �̹��� Preview';
COMMENT ON COLUMN notice.size1 is '�̹��� ������';
COMMENT ON COLUMN notice.cnt is '��õ��';
COMMENT ON COLUMN notice.replycnt is '��ȸ��';
COMMENT ON COLUMN notice.rdate is '�����';
COMMENT ON COLUMN notice.MEMBERNO is 'ȸ�� ��ȣ';
