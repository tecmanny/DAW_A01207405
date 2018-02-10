 <!DOCTYPE html>
<html>

  <head>
      <link rel="stylesheet" type = "text/css" href = "styles.css">
      
    <meta charset="UTF-8">
    <title>LAB 9</title>
  </head>

  <header>
    <h1>José Manuel Garcia Lugo</h1>
    <h1>A01207405</h1>
      <h1>Lab 9</h1>
  </header>

  <body>
        <table>
                <tr>
                    <th>Question</th>
                    <th>Answer</th>
                
                </tr>
                <tr>
                    <th>¿Qué hace la función phpinfo()? Describe y discute 3 datos que llamen tu atención.</th>
                    <th>La función phpinfo muestra información sobre la configuración de PHP
                    <br>
                    Se Define asi: 
                         bool phpinfo ([ int $what = INFO_ALL ] )<br>
                    
                    Tambien nos sirve para depuración de valores EGPCS<br>
                    Las 3 Opciones que mas me llamaron la atencion son: <br><br>
                    INFO_GENERAL: Muestra la ubicación del php.ini, asi como la fecha de compilacion, el servidor y el sistema.<br>
                    INFO_VARIABLES:Muestra todas las variables predefinidas de EGPCS (Environment, GET, POST, Cookie, Server).<br>
                    INFO_ALL: Muestra toda la información anterior<br><br>
                    </th>
                </tr>
                <tr>
                    <th>¿Qué cambios tendrías que hacer en la configuración del servidor para que pudiera ser apto en un ambiente de producción?</th>
                    <th>
                    Que el archivo index tenga terminación php en su nombre para que el servidor reconozca que ese es al archivo correcto y configurar el servidor para que reconozca el archivo .php<br><br>
                        
                        
                    </th>
                </tr>
                 <tr>
                    <th>¿Cómo es que si el código está en un archivo con código html que se despliega del lado del cliente, se ejecuta del lado del servidor? </th>
                    <th>
                        El archivo HTML se está ejecutando en la pagina web solamente y el servidor esta procesando los request de JavaScript y PHP<br>
                        Si pedimos el GET del servidor ahi es cuando se ejecuta el servidor y cada vez que necesitemos un nuevo recurso, vamos a pedir de nuevo el GET, pero mientras tanto el servidor sigue corriendo. <br><br>
                      
                        </th>
                </tr>
            </table>
      
      
      
      
      
      
      
      
      
      
      
         <div class="contenido">
      <div class="container">

        <h4>Ejercicios</h4>
        
          <p>Ingrese arreglo de numeros con separacion por comas</p>

        <form method="post">
            <input type="text" name="prom" /><br />
            <input type="submit" name="submit"/>
        </form>

        <?php
          if(count($_POST) > 0){
            $input = explode(',', $_POST["prom"]);
            echo "<ul>";
              echo "<li>"; echo "Promedio: ";  echo promedio($input);   echo "</li>";       
              echo "<li>"; echo "Mediana: ";  echo mediana($input);     echo "</li>";       
              echo "<li> Ascendente"; printListAscendent($input);       echo "</li>";       
              echo "<li> Descendente"; printListDescendent($input);     echo "</li>";       
            echo "</ul>";
            printTable($input);
          }
         
           function promedio($list){
            $sum = 0;
            for ($x = 0; $x < count($list); $x++) {
              $sum += $list[$x];
            }
            return $sum / count($list);
          }
          
          function mediana($list){
            $auxList = $list;
            sort($auxList);
            if (count($auxList) % 2 != 0){
              return $auxList[count($auxList)/2];
            }else{
              return ($auxList[count($auxList)/2] + $auxList[count($auxList)/2 + 1] ) /2;
            }
          }
          
          
          function printListAscendent($list){
            $auxList = $list;
            sort($auxList);
            echo "<ul>";
            for ($x = 0; $x < count($auxList); $x++) {
                echo "<li>";
                echo $auxList[$x];
                echo "</li>";
            }
            echo "</ul>";
          }
          function printListDescendent($list){
            $auxList = $list;
            rsort($auxList);
            echo "<ul>";
            for ($x = 0; $x < count($auxList); $x++) {
                echo "<li>";
                echo $auxList[$x];
                echo "</li>";
            }
            echo "</ul>";
          }
         
          
          function printTable($list){
            $auxList = $list;
            $maxNum = 0;
            sort($auxList);
            echo "<table>";
              for ($y = 0; $y < count($auxList); $y++) {
                $maxNum = $auxList[$y];
              }
              echo "MAX: ";
              echo $maxNum;
              for ($x = 1; $x <= $maxNum; $x++) {
                echo "<tr>";
                  echo "<td>";
                    echo $x;
                  echo "</td>";
                  echo "<td>";
                    echo $x * $x;
                  echo "</td>";
                  echo "<td>";
                    echo $x * $x * $x;
                  echo "</td>";
                echo "</tr>";
              }
            echo "<table>";
          }
        ?>



      </div>
    </div>


    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="script.min.js"></script>

  </body>

  <footer>
        
       
        
        <br> <br> <br> <br> <br>
     
        
        
        
        
        <div id = "Referencias">
            <h3>Referencias</h3>
            <p>
                
            - http://php.net/manual/es/function.phpinfo.php
                
            </p>
        </div>
   
    </footer>
    
    
</html>

