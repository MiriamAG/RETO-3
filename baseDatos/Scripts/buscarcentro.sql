CREATE OR REPLACE PACKAGE BUSCARCENTRO
AS

PROCEDURE NCP(NAME IN CENTROS.NOMBRE%TYPE, CITY IN CENTROS.CIUDAD%TYPE, PROVINCE IN CENTROS.PROVINCIA%TYPE, C OUT SYS_REFCURSOR);
PROCEDURE NC (NAME IN CENTROS.NOMBRE%TYPE, CITY IN CENTROS.CIUDAD%TYPE, C OUT SYS_REFCURSOR);
PROCEDURE NP (NAME IN CENTROS.NOMBRE%TYPE, PROVINCE IN CENTROS.PROVINCIA%TYPE, C OUT SYS_REFCURSOR);
PROCEDURE CP (CITY IN CENTROS.CIUDAD%TYPE, PROVINCE IN CENTROS.PROVINCIA%TYPE, C OUT SYS_REFCURSOR);

END BUSCARCENTRO;


CREATE OR REPLACE PACKAGE BODY BUSCARCENTRO
AS
PROCEDURE NCP(NAME IN CENTROS.NOMBRE%TYPE, CITY IN CENTROS.CIUDAD%TYPE, PROVINCE IN CENTROS.PROVINCIA%TYPE, C OUT SYS_REFCURSOR);
AS

BEGIN 
OPEN C FOR
SELECT * FROM CENTROS WHERE NOMBRE='NAME' AND CIUDAD='CITY' AND PROVINCIA='PROVINCE';

EXCEPTION
WHEN NO_DATA_FOUND THEN
RAISE_APPLICATION_ERROR(-20002,'NO SE ENCUENTRAN REGISTROS.'); 
END NCP:

PROCEDURE NC (NAME IN CENTROS.NOMBRE%TYPE, CITY IN CENTROS.CIUDAD%TYPE, C OUT SYS_REFCURSOR);
AS
BEGIN 
OPEN C FOR
SELECT * FROM CENTROS WHERE NOMBRE='NAME' AND CIUDAD='CITY';

EXCEPTION
WHEN NO_DATA_FOUND THEN
RAISE_APPLICATION_ERROR(-20002,'NO SE ENCUENTRAN REGISTROS.'); 
END NC;

PROCEDURE NP (NAME IN CENTROS.NOMBRE%TYPE, PROVINCE IN CENTROS.PROVINCIA%TYPE, C OUT SYS_REFCURSOR);
AS
BEGIN
OPEN C FOR
SELECT * FROM CENTROS WHERE NOMBRE='NAME' AND PROVINCIA='PROVINCE';

EXCEPTION
WHEN NO_DATA_FOUND THEN
RAISE_APPLICATION_ERROR(-20002,'NO SE ENCUENTRAN REGISTROS.');
END NP;

PROCEDURE CP (CITY IN CENTROS.CIUDAD%TYPE, PROVINCE IN CENTROS.PROVINCIA%TYPE, C OUT SYS_REFCURSOR);
AS
BEGIN
SELECT * FROM CENTROS WHERE CIUDAD='CITY' AND PROVINCIA='PROVINCE';

EXCEPTION
WHEN NO_DATA_FOUND THEN
RAISE_APPLICATION_ERROR(-20002,'NO SE ENCUENTRAN REGISTROS.');
END CP;
END BUSCARCENTRO;