 function check(form){
            if(form.password.value){
                window.alert("Se esta creado la cuenta con el nombre de usuario:  " + form.usuario.value + " con contraseña: " + form.password.value+"Espere un momento");
            window.setTimeout(outofTime,5000);
                   
            }
            else{
                window.alert("Ha ocurrido un error al crear la cuenta, contacta un administrador");
                
            }
            
        }
            
        function outofTime(){
            alert("Se ha creado la cuenta con exito.");
            
        }
            
        function forward(){
            document.location.href=" https://www.w3schools.com/js/js_timing.asp";
            clearTimeout();
        }
  
            
            
            
            
            function allowDrop(ev) {
                ev.preventDefault();
}

            function drag(ev) {
                ev.dataTransfer.setData("text", ev.target.id);
}

            function drop(ev) {
                ev.preventDefault();
                var data = ev.dataTransfer.getData("text");
                ev.target.appendChild(document.getElementById(data));
}