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
        
        const id_prod = btn.getAttribute('data-prod-id');
        const id_prodInput = modal_actualizar_usuario.querySelector('#id_prod');
        id_prodInput.value = id_prod;
        
        const prodnombre = btn.getAttribute('data-prod-nombre');
        const prodnombreInput = modal_actualizar_usuario.querySelector('#prodnombre');
        prodnombreInput.value = prodnombre;
        //apellido
        const prodprecio = btn.getAttribute('data-prod-precio');
        const prodprecioInput = modal_actualizar_usuario.querySelector('#prodprecio');
        prodprecioInput.value = prodprecio;

        const prod_id_categoria = btn.getAttribute('data-prod-categoria');
        const prod_id_categoriaInput = modal_actualizar_usuario.querySelector('#prod_id_categoria');
        prod_id_categoriaInput.value = prod_id_categoria;

        const prodstock_disp = btn.getAttribute('data-prod-dispo');
        const prodstock_dispInput = modal_actualizar_usuario.querySelector('#prodstock_disp');
        prodstock_dispInput.value = prodstock_disp;
        
        const prod_descripcion = btn.getAttribute('data-prod-descripcion');
        const prod_descripcionInput = modal_actualizar_usuario.querySelector('#prod_descripcion');
        prod_descripcionInput.value = prod_descripcion;
        
        const prod_id_prov = btn.getAttribute('data-prod-proveedor');
        const prod_id_provInput = modal_actualizar_usuario.querySelector('#prod_id_prov');
        prod_id_provInput.value = prod_id_prov;
        
        const prodestado = btn.getAttribute('data-prod-estado');
        const prodestadoInput = modal_actualizar_usuario.querySelector('#prodestado');
        prodestadoInput.value = prodestado;

        // Activar el modal después de asignar todos los valores
        modal_actualizar_usuario.classList.add('active');

    });
});
    var inputField = document.getElementById('id_prod');

    inputField.addEventListener('input', function() {
        var inputValue = this.value;
        this.value = inputValue.replace(/[^0-9]/g, ''); // Eliminar cualquier carácter no numérico
    });







