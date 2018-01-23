function tabla(){
    var num = prompt("Escribe un número");
    var tabla = "<table><tbody>";
    tabla += "<tr><td>" + "Número" + "</td><td>" + "Cuadrado" + "</td><td>" + "Cubo" + "</td></tr>";
    for(var i=1; i<=num; i++){
        tabla += "<tr>" + "<td>"+ i + "</td>" + "<td>" + Math.pow(i,2) + "</td>" +"<td>" + Math.pow(i,3) + "</td>" +"</tr>";
    }
    tabla += "</tbody></table>";
    var div = document.getElementById("ej1");
    div.innerHTML = tabla;
}

function random(){
    var num1 = Math.floor(Math.random()*100);
    var num2 = Math.floor(Math.random()*100);
    var t1 = new Date().getTime();
    var answ= window.prompt("Cual el el resultado de " +num1+ "+" +num2+ "=" ); 
    var t2 = new Date().getTime();
    var res = "<p>Icorrecto, tardaste: ";
    if(answ==(num1+num2)){
        res ="<p>Correcto, tardaste: ";
    }
    res += (t2-t1)/1000 + " seg.</p>";
    var div = document.getElementById("ej2");
    div.innerHTML = res;
}



function contador(arr) {
    var i, negativo = 0, positivo = 0, ceros = 0;
    var res;
    for (i=0; i<=arr.length; i++) {
    if (arr[i] == 0) {
        ceros++;
    }else if (arr[i] < 0){
        negativo++;
        } else if (arr[i] > 0) {
           positivo++;
        }
    }
    res +="<p>Hay " + positivo + " numeros positivos <br> Hay " + negativo + " numeros negativos<br> El número de ceros es: " + ceros+"</p>";
    var div = document.getElementById("ej3");
    div.innerHTML = res;
}







function promedio(arr){
    var res = new Array(), str = "", i,j, k, tam;
    for (i = 0;i<arr.length; i++) {
        tam = arr[i].length;
        j = 0;
        for (k= 0; k < tam; k++) {
            j = j + arr[i][k];
        }
        j = Math.floor(j/tam);
        str = str + "<br>El promedio del renglon: " + i + " es: " + j;
        res.push(j);
    }
    var div = document.getElementById("ej4");
    div.innerHTML = str;
}
function invertir(){
    var num = parseInt(window.prompt("Escribe el numero que vas a invertir"));
    var acumulado = parseInt(0);
    do{
        acumulado = parseInt(acumulado)*10 + parseInt(num)%10;
        num = parseInt(num)/10;
    }while(num>0);
    var res = "<p>" +acumulado/10+ "</p>";
    var div = document.getElementById("ej5");
    div.innerHTML = res;
}

function lowerCase(){
    var str = window.prompt("Escribe algo con minúsculas y mayúsculas");
    var res = str.toLowerCase();
    var div = document.getElementById("ej6");
    div.innerHTML = res;
}