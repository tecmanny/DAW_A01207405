-- code La suma de las cantidades e importe total de todas las entregas realizadas durante el 97. 
SET DATEFORMAT dmy
SELECT
  m.Clave,
  sum(e.Cantidad)                                              AS "Total:",
  sum(e.Cantidad * m.Costo * (1 + (PorcentajeImpuesto / 100))) AS "Importe Total:"
FROM Entregan e, Materiales m
WHERE e.Clave = m.Clave
      AND e.Fecha BETWEEN '01/01/1997' AND '31/12/1997'
GROUP BY m.Clave

-- code Para cada proveedor, obtener la razón social del proveedor, número de entregas e importe total de las entregas realizadas. 

SELECT
  p.RazonSocial,
  count(e.RFC)                                                 AS "Entregas:",
  sum(e.Cantidad * m.Costo * (1 + (PorcentajeImpuesto / 100))) AS "Importe Total:"
FROM Proveedores p, Entregan e, Materiales m
WHERE p.RFC = e.RFC AND e.Clave = m.Clave
GROUP BY RazonSocial

-- code Por cada material obtener la clave y descripción del material, la cantidad total entregada, la mínima cantidad entregada, la máxima cantidad entregada, el importe total de las entregas de aquellos materiales en los que la cantidad promedio entregada sea mayor a 400.
SELECT
  m.Clave,
  m.Descripcion,
  SUM(e.Cantidad)                                              AS "Total:",
  MIN(e.cantidad)                                              AS "Menor Cantidad:",
  MAX(e.cantidad)                                              AS "Mayor Cantidad:",
  SUM(e.Cantidad * m.Costo * (1 + (PorcentajeImpuesto / 100))) AS "Importe Total:"
FROM Materiales m, Entregan e
WHERE m.Clave = e.Clave
GROUP BY m.CLave, m.Descripcion
HAVING AVG(e.Cantidad) > 400

-- code Para cada proveedor, indicar su razón social y mostrar la cantidad promedio de cada material entregado, detallando la clave y descripción del material, excluyendo aquellos proveedores para los que la cantidad promedio sea menor a 500. 
SELECT
  p.RazonSocial,
  AVG(e.Cantidad) AS "Cantidad Promedio",
  m.Clave,
  m.Descripcion
FROM Proveedores p, Entregan e, Materiales m
WHERE e.Clave = m.Clave AND e.RFC = p.RFC
GROUP BY p.RazonSocial, m.Clave, m.Descripcion
HAVING AVG(e.Cantidad) > 500

-- code Mostrar en una solo consulta los mismos datos que en la consulta anterior pero para dos grupos de proveedores: aquellos para los que la cantidad promedio entregada es menor a 370 y aquellos para los que la cantidad promedio entregada sea mayor a 450. 
SELECT
  p.RazonSocial,
  AVG(e.Cantidad) AS "Cantidad Promedio",
  m.Clave,
  m.Descripcion
FROM Proveedores p, Entregan e, Materiales m
WHERE e.Clave = m.Clave AND e.RFC = p.RFC
GROUP BY p.RazonSocial, m.Clave, m.Descripcion
HAVING AVG(e.Cantidad) < 370 OR AVG(e.Cantidad) > 450
ORDER BY AVG(e.Cantidad)




-- PARTE 2:

-- INSERT INTO tabla VALUES (valorcolumna1, valorcolumna2, [...] , valorcolumnan)


INSERT INTO Materiales VALUES (1440, 'hojas', 100, 2.88)
INSERT INTO Materiales VALUES (1450, 'cuadernos', 200, 2.88)
INSERT INTO Materiales VALUES (1460, 'plumas', 300, 2.88)
INSERT INTO Materiales VALUES (1470, 'tablas', 400, 2.88)
INSERT INTO Materiales VALUES (1480, 'tuercas', 400, 2.88)



-- code Clave y descripción de los materiales que nunca han sido entregados. 
SELECT
  m.Clave,
  m.Descripcion
FROM Materiales m
WHERE m.Clave NOT IN
      (SELECT e.Clave
       FROM Entregan e)

-- code Razón social de los proveedores que han realizado entregas tanto al proyecto 'Vamos México' como al proyecto 'Querétaro Limpio'. 
SELECT
  p.RazonSocial,
  p.RFC
FROM Proveedores p, Entregan e
WHERE p.RFC = e.RFC
      AND e.Numero IN (SELECT p.Numero
                       FROM Proyectos p
                       WHERE p.Denominacion = 'Vamos Mexico' OR p.Denominacion = 'Queretaro Limpio')
GROUP BY p.RazonSocial, p.RFC

-- code Descripción de los materiales que nunca han sido entregados al proyecto 'CIT Yucatán'. 
SELECT m.Descripcion
FROM Materiales m
WHERE M.Clave NOT IN (SELECT e.Clave
                      FROM Entregan e
                      WHERE e.Numero IN (SELECT p.Numero
                                         FROM Proyectos p
                                         WHERE p.Denominacion = 'CIT Yucatan'))

-- code Razón social y promedio de cantidad entregada de los proveedores cuyo promedio de cantidad entregada es mayor al promedio de la cantidad entregada por el proveedor con el RFC 'VAGO780901'. 
SELECT
  p.RazonSocial,
  AVG(e.Cantidad) AS "Cantidad Promedio"
FROM Proveedores p, Entregan e, Materiales m
WHERE e.Clave = m.Clave
      AND e.RFC = p.RFC
GROUP BY p.RazonSocial
HAVING AVG(e.Cantidad) > (SELECT AVG(e.Cantidad)
                          FROM Entregan e
                          WHERE e.RFC = 'AAAA800101')
-- Como 'VAGO780901' no existe puse otro RFC porque la consulta no funcionaba

-- code RFC, razón social de los proveedores que participaron en el proyecto 'Infonavit Durango' y cuyas cantidades totales entregadas en el 2000 fueron mayores a las cantidades totales entregadas en el 2001. 
SELECT
  p.RFC,
  p.RazonSocial
FROM Proveedores p, Entregan e, Proyectos pr
WHERE e.RFC = p.RFC AND e.Numero = pr.Numero
      AND pr.Denominacion = 'Infonavit Durango'
      AND (SELECT SUM(e.Cantidad)
           FROM Entregan e, Proyectos p
           WHERE e.Numero = p.Numero
                 AND e.Fecha BETWEEN '01/01/2001' AND '31/12/2001') < (SELECT SUM(e.Cantidad)
                                                                       FROM Entregan e, Proyectos p
                                                                       WHERE e.Numero = p.Numero
                                                                             AND
e.Fecha BETWEEN '01/01/2000' AND '31/12/2000')