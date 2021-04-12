CREATE OR REPLACE TRIGGER BEFROEUPDATEPROFESSOR
BEFORE UPDATE ON PROFESSOR
FOR EACH ROW
DECLARE
char_num EXCEPTION;
invalid_reserch_value EXCEPTION;
same_pw EXCEPTION;

BEGIN
IF(NOT(REGEXP_LIKE(:new.p_pwd, '[^0-9]') AND REGEXP_LIKE(:new.p_pwd, '[0-9]'))) THEN
RAISE char_num;
END IF;

IF(:new.p_research != '데이터베이스' AND :new.p_research != '네트워크' AND :new.p_research != '운영체제') THEN
RAISE invalid_reserch_value;
END IF;

IF(:new.p_pwd = :old.p_pwd) THEN
RAISE same_pw;
END IF;
EXCEPTION
WHEN char_num THEN
RAISE_APPLICATION_ERROR(-20002, '패스워드는 문자와 숫자를 조합해야 합니다.');
WHEN invalid_reserch_value THEN
RAISE_APPLICATION_ERROR(-20003,'연구분야를 다시 입력해주세요.');
WHEN same_pw THEN
RAISE_APPLICATION_ERROR(-20004,'패스워드는 기존과 동일하게 변경할 수 없습니다.');
END;
/