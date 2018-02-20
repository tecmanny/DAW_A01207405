BULK INSERT a1207405.a1207405.[Proyectos]
   FROM 'e:\wwwroot\rcortese\proyectos.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )
	  	  SELECT  * FROM Proyectos