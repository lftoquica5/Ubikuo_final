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
        
        const id_cliente = btn.getAttribute('data-cli-id');
        const id_clienteInput = modal_actualizar_usuario.querySelector('#id_cliente');
        id_clienteInput.value = id_cliente;
        
        const clinombre = btn.getAttribute('data-cli-nombre');
        const clinombreInput = modal_actualizar_usuario.querySelector('#clinombre');
        clinombreInput.value = clinombre;
        
        const clicorreo = btn.getAttribute('data-cli-correo');
        const clicorreoInput = modal_actualizar_usuario.querySelector('#clicorreo');
        clicorreoInput.value = clicorreo;
        //apellido
        const cliapellido = btn.getAttribute('data-cli-apellido');
        const cliapellidoInput = modal_actualizar_usuario.querySelector('#cliapellido');
        cliapellidoInput.value = cliapellido;
;
        const clidireccion = btn.getAttribute('data-cli-direccion');
        const clidireccionInput = modal_actualizar_usuario.querySelector('#clidireccion');
        clidireccionInput.value = clidireccion;

        const clitelefono = btn.getAttribute('data-cli-telefono');
        const clitelefonoInput = modal_actualizar_usuario.querySelector('#clitelefono');
        clitelefonoInput.value = clitelefono;
        
        const clidescripcion = btn.getAttribute('data-cli-descripcion');
        clidescripcionInput = modal_actualizar_usuario.querySelector('#clidescripcion');
        clidescripcionInput.value = clidescripcion;
        // Activar el modal después de asignar todos los valores
        modal_actualizar_usuario.classList.add('active');

    });
});
