const saveBtn = document.querySelector('.save');
const form = document.querySelector('form');
const allInputs = Array.from(document.querySelectorAll('.form-box input, textarea'));
const popup = document.querySelector('.popup');


saveBtn.addEventListener('click', (e) => {
    e.preventDefault();

    let isValid = allInputs.every(el => {
        if (el.value === '') {
            el.parentElement.classList.add("error")
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
