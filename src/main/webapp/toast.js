function addToCart(event, itemId) {
    event.preventDefault();
    fetch(`/addToCart?itemId=${itemId}`, {method: 'GET'})
        .then(response => {
            if (response.ok) {
                Toasty();
                updateCartCount();
            } else {
                console.error("Failed to add to cart");
            }
        })
        .catch(error => console.error("Error:", error));
}

function updateCartCount() {
    fetch('/count', {method: 'GET'})
        .then(response => response.json())
        .then(data => {
            const cartCountElement = document.querySelector('.cart-numberItems span');
            cartCountElement.textContent = data;
        })
        .catch(error => console.error("Error fetching cart count:", error));
}

let toastTimeout;

function Toasty() {
    let mytoast = document.querySelector('.my-toast');
    mytoast.classList.remove("my-toast--hidden")
    mytoast.classList.add("my-toast--visible")

    clearTimeout(toastTimeout);

    toastTimeout = setTimeout(function () {
        mytoast.classList.remove("my-toast--visible");
        mytoast.classList.add("my-toast--hidden");
    }, 600);
}

