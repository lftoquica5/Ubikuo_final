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
        
        const id_cot = btn.getAttribute('data-cot-id');
        const id_cotInput = modal_actualizar_usuario.querySelector('#id_cot');
        id_cotInput.value = id_cot;
        
        const cot_id_cliente = btn.getAttribute('data-cot-cli');
        const cot_id_clienteInput = modal_actualizar_usuario.querySelector('#cot_id_cliente');
        cot_id_clienteInput.value = cot_id_cliente;
        //apellido
        const cot_id_usuario = btn.getAttribute('data-cot-usu');
        const cot_id_usuarioInput = modal_actualizar_usuario.querySelector('#cot_id_usuario');
        cot_id_usuarioInput.value = cot_id_usuario;

        const cotfecha = btn.getAttribute('data-cot-fecha');
        const cotfechaInput = modal_actualizar_usuario.querySelector('#cotfecha');
        cotfechaInput.value = cotfecha;

        const Totalcot = btn.getAttribute('data-cot-total');
        const TotalcotInput = modal_actualizar_usuario.querySelector('#Totalcot');
        TotalcotInput.value = Totalcot;
        
        const cotestado = btn.getAttribute('data-cot-estado');
        const cotestadoInput = modal_actualizar_usuario.querySelector('#accotestado');
        cotestadoInput.value = cotestado;

        // Activar el modal después de asignar todos los valores
        modal_actualizar_usuario.classList.add('active');

    });
});







