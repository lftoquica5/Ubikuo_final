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
        
        const id_cat = btn.getAttribute('data-cat-id');
        const id_catInput = modal_actualizar_usuario.querySelector('#id_cat');
        id_catInput.value = id_cat;
        //nombre
        const catnombre = btn.getAttribute('data-cat-nombre');
        const catnombreInput = modal_actualizar_usuario.querySelector('#catnombre');
        catnombreInput.value = catnombre;
        
        const catdescripcion = btn.getAttribute('data-cat-descripcion');
        const catdescripcionInput = modal_actualizar_usuario.querySelector('#catdescripcion');
        catdescripcionInput.value = catdescripcion;
        
        const catestado = btn.getAttribute('data-cat-estado');
        const catestadoInput = modal_actualizar_usuario.querySelector('#catestado');
        catestadoInput.value = catestado;
        //apellido
        modal_actualizar_usuario.classList.add('active');

    });
});
