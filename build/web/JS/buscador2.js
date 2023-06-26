/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

const tabla = document.querySelector('table');
const inputBusqueda = document.querySelector('#buscador');

const filtrarDatos = () => {
  const busqueda = inputBusqueda.value.toLowerCase();

  document.querySelectorAll('.daticos').forEach(datos => {
    const idUsuario = datos.querySelector('.id_usuario').innerHTML;

    if (idUsuario.toLowerCase().includes(busqueda)) {
      datos.classList.remove('filtro');
    } else {
      datos.classList.add('filtro');
    }
  });
};

inputBusqueda.addEventListener('keyup', filtrarDatos);

