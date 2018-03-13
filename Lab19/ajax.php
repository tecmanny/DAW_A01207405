<?php
$pattern=strtolower($_GET['pattern']);
function connectDb(){
    $mysql = mysqli_connect("localhost","root","","Tienda"); 
    $mysql->set_charset("utf8");
    
    if(!$mysql){
        die("Connection failed: ". mysqli_connect_error());
    }
    
    return $mysql;
}
function disconnectDb($mysql) {
     mysqli_close($mysql);
}

function getNombres()
{
    $mysql = connectDb(); 
    
    if($mysql != NULL)
    {
        $sql = "SELECT nombre FROM productos";
        $result = mysqli_query($mysql, $sql);
        $i = 0;
        while($fila = mysqli_fetch_array($result, MYSQLI_BOTH))
        {
            $words[$i] = $fila["nombre"];
            $i++;
        }
        disconnectDb($mysql);
    }
    return $words;
}

$response="";
$size=0;
connectDb();
$words = getNombres(); 

for($i=0; $i<count($words); $i++)
{
   $pos=stripos(strtolower($words[$i]),$pattern);
   if(!($pos===false))
   {
     $size++;
     $word=$words[$i];
     $response.="<option value=\"$word\">$word</option>";
   }
}
if($size>0){
     echo "<select id=\"list\" size=$size onclick=\"selectValue()\">$response</select>"; 
}

?>