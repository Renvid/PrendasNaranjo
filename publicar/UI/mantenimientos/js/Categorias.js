// Obtener el modal y la imagen dentro del modal
var modal = document.getElementById("imageModal");
var modalImage = document.getElementById("modalImage");

// Obtener todos los elementos con la clase 'product__item__pic'
var productImages = document.getElementsByClassName("product__item__pic");

// Agregar un evento de click a cada imagen del producto
for (var i = 0; i < productImages.length; i++) {
    productImages[i].addEventListener("click", function () {
        // Obtener la URL de la imagen
        var imageUrl = this.querySelector("img").src;

        // Establecer la imagen en el modal
        modalImage.src = imageUrl;

        // Mostrar el modal
        modal.style.display = "block";
    });
}

// Agregar un evento click
var closeButton = document.getElementsByClassName("close")[0];
closeButton.addEventListener("click", function () {
    // Ocultar el modal
    modal.style.display = "none";
});
