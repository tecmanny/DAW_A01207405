(SELECT *
 FROM entregan
 WHERE clave = 1450)
UNION
(SELECT *
 FROM entregan
 WHERE clave = 1300)

SELECT *
FROM entregan
WHERE clave = 1450 OR clave = 1300

SELECT *
FROM entregan
WHERE clave NOT IN (SELECT clave
                    FROM entregan
                    WHERE clave = 1000)

SELECT *
FROM Entregan
WHERE clave = 1000

SELECT *
FROM entregan, materiales

SET DATEFORMAT dmy
SELECT DISTINCT Descripcion
FROM Entregan E, Materiales M
WHERE e.clave = m.Clave AND e.Fecha BETWEEN '01/01/2000' AND '31/12/2000'

SET DATEFORMAT dmy
SELECT
  Descripcion,
  e.clave,
  e.Numero,
  e.Cantidad
FROM Entregan E, Materiales M
WHERE e.clave = m.Clave AND e.Fecha BETWEEN '01/01/2000' AND '31/12/2000'

SET DATEFORMAT dmy
SELECT
  e.Numero,
  p.Denominacion,
  e.Fecha,
  e.Cantidad,
  e.Cantidad / 2 AS 'Cantidad/2'
FROM Entregan e, Proyectos p
WHERE e.numero = p.Numero
ORDER BY e.Numero DESC, e.Fecha DESC

SELECT *
FROM Materiales
WHERE Descripcion LIKE 'Si'

DECLARE @foo VARCHAR(40);
DECLARE @bar VARCHAR(40);
SET @foo = '¿Que resultado';
SET @bar = ' ¿¿¿??? '
SET @foo += ' obtienes?';
PRINT @foo + @bar;

SELECT RFC
FROM Entregan
WHERE RFC LIKE '[A-D]A%';
SELECT RFC
FROM Entregan
WHERE RFC LIKE '[^A-D]%';
SELECT Numero
FROM Entregan
WHERE Numero LIKE '5__6';


SELECT
  RFC,
  Cantidad,
  Fecha,
  Numero
FROM [Entregan]
WHERE [Numero] BETWEEN 5000 AND 5010 AND
      Exists(SELECT [RFC]
             FROM [Proveedores]
             WHERE RazonSocial LIKE 'La%' AND [Entregan].[RFC] = [Proveedores].[RFC])

SELECT
  RFC,
  Cantidad,
  Fecha,
  Numero
FROM [Entregan]
WHERE [Numero] BETWEEN 5000 AND 5010 AND
      RFC IN (SELECT [RFC]
              FROM [Proveedores]
              WHERE RazonSocial LIKE 'La%')

SELECT
  RFC,
  Cantidad,
  Fecha,
  Numero
FROM Entregan
WHERE Numero BETWEEN 5000 AND 5010 AND
      RFC NOT IN (SELECT RFC
                  FROM Proveedores
                  WHERE RazonSocial NOT LIKE 'La%')

SELECT RFC
FROM Proveedores
WHERE RazonSocial NOT LIKE 'La%'

SELECT TOP 2 *
FROM Proyectos

SELECT TOP Numero *
FROM Proyectos p

ALTER TABLE materiales
  ADD PorcentajeImpuesto NUMERIC(6, 2);
UPDATE materiales
SET PorcentajeImpuesto = 2 * clave / 1000;

SELECT
  m.Descripcion,
  e.Cantidad,
  m.Costo,
  m.PorcentajeImpuesto,
  (e.Cantidad * m.Costo * (1 + (PorcentajeImpuesto / 100))) AS 'SubTotal'
FROM Entregan e, Materiales m
WHERE e.Clave = m.Clave

CREATE VIEW cons1 AS
  SELECT
    Descripcion,
    e.clave,
    e.Numero,
    e.Cantidad
  FROM Entregan E, Materiales M
  WHERE e.clave = m.Clave AND e.Fecha BETWEEN '01/01/2000' AND '31/12/2000'

CREATE VIEW cons2 AS
  SELECT Descripcion
  FROM Entregan E, Materiales M
  WHERE e.clave = m.Clave AND e.Fecha BETWEEN '01/01/2000' AND '31/12/2000'

CREATE VIEW cons3 AS
  SELECT
    Descripcion,
    e.clave
  FROM Entregan E, Materiales M
  WHERE e.clave = m.Clave AND e.Fecha BETWEEN '01/01/2000' AND '31/12/2000'

CREATE VIEW cons4 AS
  SELECT
    Descripcion,
    e.clave,
    e.Numero
  FROM Entregan E, Materiales M
  WHERE e.clave = m.Clave AND e.Fecha BETWEEN '01/01/2000' AND '31/12/2000'

CREATE VIEW cons5 AS
  SELECT
    Descripcion,
    e.clave,
    e.Numero,
    e.Cantidad
  FROM Entregan E, Materiales M
  WHERE e.clave = m.Clave AND e.Fecha BETWEEN '01/01/2000' AND '31/12/2009'

SELECT *
FROM cons1
SELECT *
FROM cons2
SELECT *
FROM cons3
SELECT *
FROM cons4
SELECT *
FROM cons5

--Los materiales (clave y descripción) entregados
--al proyecto "México sin ti no estamos completos".
SELECT
  m.Clave,
  Descripcion
FROM Materiales m, Entregan e, Proyectos p
WHERE e.Clave = m.Clave
      AND e.Numero = p.Numero
      AND p.Denominacion LIKE 'Mexico sin ti no estamos completos'

--Los materiales (clave y descripción) que han sido
--proporcionados por el proveedor "Acme tools".
SELECT
  m.Clave,
  Descripcion
FROM Materiales m, Entregan e, Proveedores p
WHERE e.Clave = m.Clave
      AND e.RFC = p.RFC
      AND p.RazonSocial ='Acme tools'

--El RFC de los proveedores que durante el 2000
--entregaron en promedio cuando menos 300 materiales. 
SET DATEFORMAT dmy
SELECT
  p.RFC,
  sum(e.Cantidad) / count(e.RFC) AS Promedio
FROM Proveedores p, Entregan e
WHERE p.RFC = e.RFC
      AND e.Fecha BETWEEN '01/01/2000' AND '31/12/2000'
GROUP BY p.RFC
HAVING sum(e.Cantidad) / count(e.RFC) > 300

--El Total entregado por cada material en el año 2000. 
SET DATEFORMAT dmy
SELECT
  m.Descripcion,
  sum(e.Cantidad)
FROM Entregan e, Materiales m
WHERE e.Clave = m.Clave
      AND e.Fecha BETWEEN '01/01/2000' AND '31/12/2000'
GROUP BY m.Descripcion

--La Clave del material más vendido durante el 2001.
--(se recomienda usar una vista intermedia para su solución)
SET DATEFORMAT dmy
SELECT TOP 1
  e.Clave,
  sum(e.Cantidad)
FROM Entregan e
WHERE e.Fecha BETWEEN '01/01/2001' AND '31/12/2001'
GROUP BY e.Clave
ORDER BY sum(e.Cantidad) DESC

--Productos que contienen el patrón 'ub' en su nombre. 
SELECT m.Clave, Descripcion
FROM Materiales m
WHERE m.Descripcion LIKE '%ub%'


--Denominación y suma del total a pagar para todos los proyectos. 
SELECT p.Denominacion, sum(e.Cantidad*m.Costo)
FROM Entregan e, Materiales m, Proyectos p
WHERE e.Numero=p.Numero
  AND e.Clave=m.Clave
GROUP BY p.Denominacion
ORDER BY sum(e.Cantidad*m.Costo) DESC

--Denominación, RFC y RazonSocial de los proveedores que se
--suministran materiales al proyecto Televisa en acción que no se
--encuentran apoyando al proyecto Educando en Coahuila. (Solo usando vistas) 

CREATE VIEW RSnotEEC AS
SELECT RazonSocial
FROM Entregan e, Proveedores p, Proyectos pr
WHERE pr.Denominacion='Educando en Coahuila'
      AND e.Numero=pr.Numero
      AND e.RFC=p.RFC

SELECT Denominacion, e.RFC, RazonSocial
FROM Entregan e, Proveedores p, Proyectos pr
  WHERE e.Numero=pr.Numero
  AND e.RFC=p.RFC
  AND pr.Denominacion='Televisa en acción'
  AND RazonSocial NOT IN (SELECT * FROM RSnotEEC)

--Denominación, RFC y RazonSocial de los proveedores que suministran
--materiales al proyecto Televisa en acción que no se encuentran apoyando
--al proyecto Educando en Coahuila. (Sin usar vistas, utiliza not in, in o exists)
SELECT
  Denominacion,
  e.RFC,
  pr.RazonSocial
FROM Proyectos p, Entregan e, Proveedores pr
WHERE Denominacion = 'Televisa en acción' AND e.Numero = p.Numero AND e.RFC = pr.RFC
      AND e.RFC NOT IN (SELECT e.RFC
                        FROM Entregan e, Proyectos p
                        WHERE e.Numero = p.Numero AND Denominacion = 'Educando en Coahuila')

--Costo de los materiales y los Materiales que son entregados al proyecto
--Televisa en acción cuyos proveedores también
--suministran materiales al proyecto Educando en Coahuila.
SELECT m.costo, m.Descripcion
FROM Proyectos p, Entregan e, Proveedores pr, Materiales m
WHERE Denominacion = 'Televisa en acción' AND e.Numero = p.Numero AND e.RFC = pr.RFC AND E.Clave = m.Clave
      AND e.RFC IN (SELECT e.RFC
                    FROM Entregan e, Proyectos p
                    WHERE e.Numero = p.Numero AND Denominacion = 'Educando en Coahuila')
--With NOT IN
SELECT m.costo, m.Descripcion
FROM Proyectos p, Entregan e, Proveedores pr, Materiales m
WHERE Denominacion = 'Televisa en acción' AND e.Numero = p.Numero AND e.RFC = pr.RFC AND E.Clave = m.Clave
      AND e.RFC NOT IN (SELECT e.RFC
                    FROM Entregan e, Proyectos p
                    WHERE e.Numero = p.Numero AND Denominacion != 'Educando en Coahuila')
--No se puede

---- Nombre del material, cantidad de veces entregados
-- y total del costo de dichas entregas por material
-- de todos los proyectos.
SELECT m.Descripcion, count(m.Clave) as 'Veces entregadas', sum(e.Cantidad*m.Costo)
FROM Materiales m, Entregan e, Proyectos p
WHERE e.Clave = m.Clave
      AND e.Numero = p.Numero
GROUP BY m.[Descripcion]
ORDER BY sum(e.Cantidad*m.Costo) DESC