CREATE OR REPLACE PROCEDURE UPDATECLASS(tTime IN NUMBER,
tWhere IN VARCHAR2,
tPid IN VARCHAR2,
tCid IN VARCHAR2,
tCidno IN NUMBER,
result OUT VARCHAR2)
IS

Not_change EXCEPTION;
Same_where EXCEPTION;

nCnt NUMBER;
time NUMBER;
swhere VARCHAR2(255);
cname VARCHAR2(255);

BEGIN
result :='';

SELECT t_time, t_where
INTO time, swhere
FROM teach
WHERE p_id=tPid AND c_id=tCid AND c_id_no = tCidno;

IF(time = tTime or swhere = tWhere) THEN
RAISE Not_change;
END IF;

SELECT COUNT(*)
INTO nCnt
FROM teach
WHERE t_time = tTime AND t_where = tWhere;

SELECT c.c_name
INTO cname
FROM teach t, course c
WHERE t_time = tTime AND t_where = tWhere AND c.c_id = t.c_id;

IF(nCnt > 0) THEN
RAISE Same_where;
END IF;

update teach set t_time = tTime, t_where = tWhere WHERE p_id=tPid AND c_id=tCid AND c_id_no = tCidno;
COMMIT;
result := '과목정보를 변경하였습니다.';

EXCEPTION
WHEN Not_change THEN
result := '변경된 내용이 없습니다.';
WHEN Same_where THEN
result := cname ||'과목과 중복되어 처리할 수 없습니다.';
WHEN OTHERS THEN
ROLLBACK;
result := SQLCODE;
END;
/