$(document).ready(function(){
   // the "href" attribute of the modal trigger must specify the modal ID that wants to be triggered
   $('#modal1').modal();
 });
 $(document).ready(function(){
    // the "href" attribute of the modal trigger must specify the modal ID that wants to be triggered
    $('#modal2').modal();
  });

 function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#blah')
                    .attr('src', e.target.result);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
