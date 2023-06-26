/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
const openPopupBtnsModal1 = document.querySelectorAll('.open-popup[data-popup="popup1"]');
const openPopupBtnsModal3 = document.querySelectorAll('.open-popup[data-popup="popup3"]');
const closePopupBtns = document.querySelectorAll('.cancelarbtn');
const openPopupBtnsModal2 = document.querySelectorAll('.actualizar-usuario');
const modal_actualizar_usuario = document.querySelector('.actualizar-popup');

openPopupBtnsModal1.forEach(btn => {
    btn.addEventListener('click', () => {
        const popupId = btn.dataset.popup;
        const popup = document.querySelector(`#${popupId}`);
        popup.classList.add('active');
    });
});

openPopupBtnsModal3.forEach(btn => {
    btn.addEventListener('click', () => {
        const popupId = btn.dataset.popup;
        const popup = document.querySelector(`#${popupId}`);
        popup.classList.add('active');
    });
});

closePopupBtns.forEach(btn => {
    btn.addEventListener('click', () => {
        const popup = btn.closest('.popup');
        popup.classList.remove('active');
    });
});

openPopupBtnsModal2.forEach(btn => {
    btn.addEventListener('click', (event) => {
        event.preventDefault();
        //nombre
        const id_prov = btn.getAttribute('data-prov-id');
        const id_provInput = modal_actualizar_usuario.querySelector('#id_prov');
        id_provInput.value = id_prov;
        //apellido
        const pronombre = btn.getAttribute('data-prov-nombre');
        const pronombreInput = modal_actualizar_usuario.querySelector('#pronombre');
        pronombreInput.value = pronombre;

        const prodireccion = btn.getAttribute('data-prov-direccion');
        const prodireccionInput = modal_actualizar_usuario.querySelector('#prodireccion');
        prodireccionInput.value = prodireccion;

        const protelefono = btn.getAttribute('data-prov-telefono');
        const protelefonoInput = modal_actualizar_usuario.querySelector('#protelefono');
        protelefonoInput.value = protelefono;
        
        const proestado = btn.getAttribute('data-prov-estado');
        const proestadoInput = modal_actualizar_usuario.querySelector('#proestado');
        proestadoInput.value = proestado;
        
        const prodescripcion = btn.getAttribute('data-prov-descripcion');
        const prodescripcionInput = modal_actualizar_usuario.querySelector('#prodescripcion');
        prodescripcionInput.value = prodescripcion;
        
        const procorreo = btn.getAttribute('data-prov-email');
        const procorreoInput = modal_actualizar_usuario.querySelector('#procorreo');
        procorreoInput.value = procorreo;
        
        const prorepresentante = btn.getAttribute('data-prov-repre');
        const prorepresentanteInput = modal_actualizar_usuario.querySelector('#prorepresentante');
        prorepresentanteInput.value = prorepresentante;

        // Activar el modal después de asignar todos los valores
        modal_actualizar_usuario.classList.add('active');
    });
});