const saveBtn = document.querySelector('.save');
const form = document.querySelector('form');
const allInputs = Array.from(document.querySelectorAll('.form-box input, textarea'));
const popup = document.querySelector('.popup');
const price = document.querySelector('#price');
const validPrice = /^\d{1,4}\.\d{2}$/;


saveBtn.addEventListener('click', (e) => {
    e.preventDefault();

    let isValid = allInputs.every(el => {
        if (el.value === '') {
            el.parentElement.classList.add("error")
            return false
        } else if (el === price && validPrice.test(price.value) === false) {
            el.parentElement.classList.add("error")
            el.nextElementSibling.textContent = "enter a number with up to 4 digits before the decimal point and 2 digits after the decimal point."
            return false
        } else {
            el.parentElement.classList.remove("error")
            return true
        }
    })
    if (isValid) {
        popup.classList.add("show");
        setTimeout(function () {
            popup.classList.remove("show");
            form.submit();
        }, 2000);
    }
})
