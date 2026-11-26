CREATE PROCEDURE `LisääSuoritus` (
IN En VARCHAR(45),
IN Sn VARCHAR(45),
IN KK VARCHAR(45),
IN arvos INT
)

Aliohjelma:BEGIN
declare opiskID INT DEFAULT 0;
declare jaksoID INT DEFAULT 0;
SELECT idOpiskelija INTO opiskID
FROM opiskelija
WHERE etunimi = En AND sukunimi = Sn;
SELECT idOpintojakso INTO jaksoID
FROM opintojakso
WHERE Tunnus = KK;

IF opiskID=0 THEN 
SELECT 'Opiskelijaa ei ole';
LEAVE Aliohjelma;
END IF;

IF jaksoID=0 THEN
SELECT 'Opintojaksoa ei ole';
LEAVE Aliohjelma;
END IF;

IF arvos < 0 OR arvos > 5 THEN
SELECT 'Arvosana virheellinen';
LEAVE Aliohjelma;
END IF;

INSERT INTO arviointi (idOpintojakso, idOpiskelija, `päivämäärä`, Arvosana)
VALUES (jaksoID, opiskID, CURDATE(), arvosana);
END;
