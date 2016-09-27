console.log("The script is running!!");

function addPinkBorder(event) {
 event.target.style.border = "6px solid pink";
}

var photo = document.getElementById("dog-pic");
photo.addEventListener("click", addPinkBorder);


function mouseOver() {
    document.getElementById("diamond");
}

function mouseOut() {
	document.getElementById("diamond");
}

function bigImg(x) {
    gif.style.height = "250px";
    gif.style.width = "250px";
}

function normalImg(x) {
    gif.style.height = "100px";
    gif.style.width = "100px";
}

var gif = document.getElementById("diamond");
gif.addEventListener("mouseover", bigImg);
gif.addEventListener("mouseout", normalImg);