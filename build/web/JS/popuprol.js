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
        
        const id_Rol = btn.getAttribute('data-rol-id');
        const id_RolInput = modal_actualizar_usuario.querySelector('#id_Rol');
        id_RolInput.value = id_Rol;
        //nombre
        const rolnombre = btn.getAttribute('data-rol-nombre');
        const rolnombreInput = modal_actualizar_usuario.querySelector('#rolnombre');
        rolnombreInput.value = rolnombre;
        
        modal_actualizar_usuario.classList.add('active');

    });
});
