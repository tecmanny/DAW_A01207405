<?php include("partial/_header.html") ?>

 <body class="container">
    <div class="jumbotron text-center">
        <h1 class="display-4">Lab 20</h1>
    </div>
        <p>José Manuel García Lugo</p>
        <p>A01207405</p>
        <br>
        <hr>
        <h2>Búsqueda</h2>
          
        <input id="myInput" type="text" placeholder="Buscar...">
        <br><br>
        
        <table class="table table-striped table-hover">
          <thead>
            <tr>
              <th>Nombre</th>
              <th>Apellido</th>
              <th>Correo</th>
            </tr>
          </thead>
          <tbody id="myTable">
            <tr>
              <td>Juanito</td>
              <td>Perez</td>
              <td>SoyELJUAN@huehuexd.com</td>
            </tr>
            <tr>
              <td>Pepito</td>
              <td>Rodriguez</td>
              <td>BbeIixixiOosDJLDLldjl_@mail.com</td>
            </tr>
            <tr>
              <td>Menchito</td>
              <td>García</td>
              <td>nomelose@servzio.com</td>
            </tr>
            <tr>
              <td>Alma</td>
              <td>Madero</td>
              <td>almituris@test.com</td>
            </tr>
          </tbody>
        </table>
         <hr>
       
        <h2>Cuestionario: </h2><br>
        <p>
            - Explica y elabora un diagrama sobre cómo funciona AJAX con jQuery<br>
            <img src="http://www.dotnetcurry.com/images/jquery/Getting-started-with-.ajaxBack-to-Basics_197B/httpreqvsajax.png" class="img-responsive" alt="Ajax-JQuery" width="70%"/>
            <div>
            <p>
                Lo que realiza AJAX es que la pagina tiene una especie de respuesta en tiempo real, por lo que hace que la experiencia de usuario sea mucho mejor que la normal<br>
                AJAX se encarga de cargar solo una vez los archivos necesarios de la pagina y se estan mandando constantemente paquetes entre el servidor y el javascript para tener fluidez en la aplicación. <br>
                
                Existen Metodos como el GET Y POST que jquery proporciona a AJAX para el intercambio de peticiones.<br>
                </p>
            </div>
        <br><br>
        <p>
            ¿Qué alternativas a jQuery existen?<br>

            El uso de librerias es una opcion viable, tambien se puede usar librerias selectoras.
            <br>   
        </p>
<?php include("partial/_footer.html") ?>