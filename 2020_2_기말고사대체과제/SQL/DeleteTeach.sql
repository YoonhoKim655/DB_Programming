CREATE OR REPLACE PROCEDURE DELETETEACH(pPid IN VARCHAR2,
cCid IN VARCHAR2,
cCid_no IN NUMBER,
result OUT VARCHAR2)
IS
Too_many_enroll EXCEPTION;

nEnroll NUMBER;
nMax NUMBER;

BEGIN
result := '';

SELECT COUNT(*)
INTO nEnroll
FROM enroll e
WHERE e.c_id = cCid and e.c_id_no = cCid_no;

SELECT t_max
INTO nMax
FROM teach
WHERE c_id = cCid and c_id_no = cCid_no;

IF(nENROLL > nMax/2) THEN
RAISE Too_many_enroll;
END IF;

DELETE FROM teach WHERE p_id = pPid and c_id = cCid and c_id_no = cCid_no;
result := '해당 과목의 개설 신청이 취소되었습니다.';

EXCEPTION
WHEN Too_many_enroll THEN
result := '해당 과목은 수강인원이 정원의 50%보다 많아 개설 신청을 취소할 수 없습니다.';
WHEN OTHERS THEN
ROLLBACK;
result := SQLCODE;
END;
/ 