
var checkPass = function() {
    if (document.getElementById('password').value ==
      document.getElementById('confirmPassword').value) {
      document.getElementById('message').style.color = 'green';
      document.getElementById('message').innerHTML = 'Las contraseñas coinciden';
      document.getElementById('btn-setpass').classList.remove('disabled');
  
    } else {
      document.getElementById('message').style.color = 'red';
      document.getElementById('confirmPassword').style.color = 'red'
      document.getElementById('message').innerHTML = 'Otro gañan, quieres poner bien las contraseñas!.';
      document.getElementById('btn-setpass').classList.add('disabled');
    }
  }

  $(".inputpassvalidate").on("keyup", checkPass);
