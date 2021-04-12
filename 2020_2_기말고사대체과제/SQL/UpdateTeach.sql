CREATE OR REPLACE PROCEDURE UPDATETEACH(tMax IN NUMBER,
tPid IN VARCHAR2,
tCid IN VARCHAR2,
tCidno IN NUMBER,
result OUT VARCHAR2)
IS

space EXCEPTION;
None_num EXCEPTION;
Min_Max EXCEPTION;
No_NULL EXCEPTION;
Low_pre EXCEPTION;

nBlank NUMBER;
nLen NUMBER;
nMax NUMBER;
cname VARCHAR2(225);

BEGIN
SELECT length(tMax), instr(tMax, ' ')
INTO nLen, nBlank
FROM DUAL;

IF(nBlank > 0) THEN
RAISE space;
ELSIF (nLen < 1) THEN
RAISE No_NULL;
END IF;

IF(REGEXP_INSTR(tMax,'[^0-9]') != 0) THEN
RAISE None_num;
END IF;

IF(tMax >100 or tMax <0) THEN
RAISE Min_Max ;
END IF;

SELECT COUNT(*)
INTO nMax
FROM enroll
WHERE c_id = tCid AND c_id_no = tCidno;

IF(tMax <= nMax) THEN
RAISE Low_pre;
END IF;

update teach set t_max = tMax WHERE p_id = tPid AND c_id = tCid AND c_id_no = tCidno;
COMMIT;

SELECT c_name
INTO cname
FROM course
WHERE c_id = tCid AND c_id_no = tCidno;

result := cname || ': 변경 완료';

EXCEPTION
WHEN space THEN
result := cname||' : 변경 불가(사유 : 수강정원에는 공백을 입력할 수 없습니다.)';
WHEN None_num THEN
result := cname||' : 변경 불가(사유 : 숫자 외에 다른 문자를 입력할 수 없습니다.)';
WHEN Min_Max THEN
result := cname||' : 변경 불가(사유 : 수강정원은 0~100사이의 값만 입력 가능합니다.)';
WHEN No_NULL THEN
result := cname||' : 변경 불가(사유 : 수강정원을 입력하지 않았습니다.)';
WHEN Low_pre THEN
result := cname||' : 변경 불가(사유 : 강의를 신청한 학생 수 ' || TO_CHAR(nMax) || '명 이상의 수를 입력해야 합니다 .)';
WHEN OTHERS THEN
ROLLBACK;
result := SQLCODE;
END;
/