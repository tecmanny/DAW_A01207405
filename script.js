
function validPassword(str) {
    var r = /^(?=.*\d)(?=.*[a-z]).{8,}$/;
    return r.test(str);
}

function validateForm(e) {
    
    if(this.password.value != "" && (this.password.value == this.verif.value)) {
    
        if(!validPassword(this.password.value)){
        
            alert("Contraseña inválida");
            
            e.preventDefault();
            
            return;
        }
    }else {
        
        alert("Las contraseñas no coinciden")
        
        e.preventDefault();
        
        return;
    }
    
    alert("Contraseña validada!")
    
    return;
}
var pwdForm = document.getElementById("pwd");

pwdForm.addEventListener("submit", validateForm, false);


function shop(e) {

    var precio = (this.refrescos.value *12 ) + (this.pizza.value * 92) + (this.cerveza.value * 25);
    
    var iva = precio *0.16;
    
    var total = precio + iva;
    
    var p = document.getElementById("precio");
    
    p.innerText = precio;
    
    var i = document.getElementById("iva");
    
    i.innerText = iva;
    
    var t = document.getElementById("total");
    
    t.innerText = total;
    
    e.preventDefault();
}




var storeForm = document.getElementById("tienda");

storeForm.addEventListener("submit", shop, true);



function carro(e) {

    var user = this.user.value;
    
    var car = this.book.value;
    
    var days = 7;
    
    alert("Se ha registrado el Usuario:" + user + " Con Num de elef " + car + " por " + days + " días.");
    
    e.preventDefault();
}




var rentaForm = document.getElementById("renta");

rentaForm.addEventListener("submit", carro, false);






