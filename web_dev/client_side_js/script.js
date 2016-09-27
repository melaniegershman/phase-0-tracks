console.log("The script is running!!");

function addPinkBorder(event) {
 event.target.style.border = "6px solid pink";
}

var photo = document.getElementById("dog-pic");
photo.addEventListener("click", addPinkBorder);