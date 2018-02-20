BULK INSERT a1207405.a1207405.[Proveedores]
   FROM 'e:\wwwroot\rcortese\proveedores.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )
	  	  SELECT  * FROM Proveedores