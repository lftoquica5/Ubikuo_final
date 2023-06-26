const openPopupBtnsModal1 = document.querySelectorAll('.open-popup[data-popup="popup1"]');
const openPopupBtnsModal3 = document.querySelectorAll('.open-popup[data-popup="popup3"]');
const openPopupBtnsModal4 = document.querySelectorAll('.open-popup[data-popup^="popup4_"]');
const closePopupBtns = document.querySelectorAll('.cancelarbtn');
const openPopupBtnsModal2 = document.querySelectorAll('.actualizar-pedido');
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
        
        const id_ped = btn.getAttribute('data-ped-id');
        const id_pedInput = modal_actualizar_pedido.querySelector('#id_ped');
        id_pedInput.value = id_ped;
        
        const ped_id_cliente = btn.getAttribute('data-ped-cli');
        const ped_id_clienteInput = modal_actualizar_pedido.querySelector('#ped_id_cliente');
        ped_id_clienteInput.value = ped_id_cliente;
        
        const ped_id_usuario = btn.getAttribute('data-ped-usu');
        const ped_id_usuarioInput = modal_actualizar_pedido.querySelector('#ped_id_usuario');
        ped_id_usuarioInput.value = ped_id_usuario;

        const pedfecha = btn.getAttribute('data-ped-fecha');
        const pedfechaInput = modal_actualizar_pedido.querySelector('#pedfecha');
        pedfechaInput.value = pedfecha;

        const Totalped = btn.getAttribute('data-ped-total');
        const TotalpedInput = modal_actualizar_pedido.querySelector('#Totalped');
        TotalpedInput.value = Totalped;
        
        const pedestado = btn.getAttribute('data-ped-estado');
        const pedestadoInput = modal_actualizar_pedido.querySelector('#pedestado');
        pedestadoInput.value = pedestado;

        // Activar el modal después de asignar todos los valores
        modal_actualizar_pedido.classList.add('active');

    });
});
