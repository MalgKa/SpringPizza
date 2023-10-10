let toastTimeout;
function Toasty(){
    let mytoast = document.querySelector('.my-toast');
    console.log(mytoast)
    mytoast.classList.remove("my-toast--hidden")
    mytoast.classList.add("my-toast--visible")
    console.log("toast")

    clearTimeout(toastTimeout);

    toastTimeout = setTimeout(function() {
        mytoast.classList.remove("my-toast--visible");
        mytoast.classList.add("my-toast--hidden");
    }, 2000);

}

