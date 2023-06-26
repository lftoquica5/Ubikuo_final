/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

const estadoSelect = document.querySelector('#estado');
const tabla = document.querySelector('table');
const inputBusqueda = document.querySelector('#buscador');

const filtrarDatos = () => {
  const estado = estadoSelect.value;
  const busqueda = inputBusqueda.value.toLowerCase();

  document.querySelectorAll('.datos').forEach(datos => {
    const idcotizacion = datos.querySelector('.id_cliente').innerHTML;
    const estadoCell = datos.querySelector('.estado-cotizacion').textContent.toLowerCase();

    if ((idcotizacion.toLowerCase().includes(busqueda)) && (!estado || estado === 'todos' || estado === estadoCell)) {
      datos.classList.remove('filtro');
    } else {
      datos.classList.add('filtro');
    }
  });
}
inputBusqueda.addEventListener('keyup', filtrarDatos);
estadoSelect.addEventListener('change', filtrarDatos);
