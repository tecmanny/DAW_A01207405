function password() {
    var password1 = document.getElementById("pass").value;
    var password2 = document.getElementById("passconfirm").value;
    
    if(password1 == password2) {
        return true;
    } else {
        alert("Las contraseñas no coinciden");
        return false;
    }
}