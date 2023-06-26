/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
const inputs = document.querySelectorAll(".input");


function addcl(){
	let parent = this.parentNode.parentNode;
	parent.classList.add("focus");
}

function remcl(){
	let parent = this.parentNode.parentNode;
	if(this.value == ""){
		parent.classList.remove("focus");
	}
}

inputs.forEach(input => {
	input.addEventListener("focus", addcl);
	input.addEventListener("blur", remcl);
});

const carouselImages = document.querySelectorAll('.carousel-image');
const carouselButtons = document.querySelectorAll('.carousel-button');

let currentImage = 0;

function showImage(index) {
    carouselImages.forEach((image, i) => {
        if (i === index) {
            image.classList.add('active');
        } else {
            image.classList.remove('active');
        }
    });

    carouselButtons.forEach((button, i) => {
        if (i === index) {
            button.classList.add('active');
        } else {
            button.classList.remove('active');
        }
    });
}

carouselButtons.forEach((button, i) => {
    button.addEventListener('click', () => {
        currentImage = i;
        showImage(currentImage);
    });
});

setInterval(() => {
    currentImage = (currentImage + 1) % carouselImages.length;
    showImage(currentImage);
}, 3000);
