SET DATEFORMAT dmy
BULK INSERT a1207405.a1207405[Entregan]
   FROM 'e:\wwwroot\rcortese\entregan.csv'

   WITH 
      (

         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

	  	  SELECT  * FROM Entregan