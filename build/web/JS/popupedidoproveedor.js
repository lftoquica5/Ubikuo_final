const openPopupBtnsModal1 = document.querySelectorAll('.open-popup[data-popup="popup1"]');
const openPopupBtnsModal3 = document.querySelectorAll('.open-popup[data-popup="popup3"]');
const openPopupBtnsModal4 = document.querySelectorAll('.open-popup[data-popup^="popup4_"]');
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
openPopupBtnsModal4.forEach(btn => {
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
        
        const id_proped = btn.getAttribute('data-ped-id');
        const id_propedInput = modal_actualizar_usuario.querySelector('#id_proped');
        id_propedInput.value = id_proped;
        
        const ped_id_proveedor = btn.getAttribute('data-ped-prov');
        const ped_id_proveedorInput = modal_actualizar_usuario.querySelector('#ped_id_proveedor');
        ped_id_proveedorInput.value = ped_id_proveedor;
        //apellido
        const id_usuario = btn.getAttribute('data-ped-usu');
        const id_usuarioInput = modal_actualizar_usuario.querySelector('#id_usuario');
        id_usuarioInput.value = id_usuario;

        const proped_fecha = btn.getAttribute('data-ped-fecha');
        const proped_fechaInput = modal_actualizar_usuario.querySelector('#proped_fecha');
        proped_fechaInput.value = proped_fecha;

        const Total_proped = btn.getAttribute('data-ped-total');
        const Total_propedInput = modal_actualizar_usuario.querySelector('#Total_proped');
        Total_propedInput.value = Total_proped;
        
        const propedestado = btn.getAttribute('data-ped-estado');
        const propedestadoInput = modal_actualizar_usuario.querySelector('#propedestado');
        propedestadoInput.value = propedestado;
       

        // Activar el modal después de asignar todos los valores
        modal_actualizar_usuario.classList.add('active');

    });
});

