const button = document.getElementById( "sign-up-button");
const checkbox = document.getElementById("terms-check-box");
button.disabled = true;
checkbox.addEventListener("click", (event) => {
  console.log("test");
  if (checkbox.checked) {
    button.disabled = false;
    } else {
      button.disabled = true;
    }
});
