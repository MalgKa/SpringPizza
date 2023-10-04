const timestampElements = document.querySelectorAll('.timestamp');
timestampElements.forEach((element) => {
    const timestamp = new Date(element.textContent);
    console.log(timestamp)


    const currentTime = new Date();
    const timeDifference = currentTime - timestamp;

    const statusElement = element.closest('tr').querySelector('.establishedStatus');
    console.log(statusElement)


    if (timeDifference >= 2 * 60 * 1000 && (statusElement.textContent === "new" || statusElement.textContent === "in progress")) {
        element.style.color = 'red';
        element.style.fontWeight = 'bold'
    }
});