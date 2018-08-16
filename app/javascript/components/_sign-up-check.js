function signUpCheck() {
checkbox.addEventListener("click", (event) => {
  const button = document.getElementById( "sign-up-button");
  const checkbox = document.getElementById("terms-check-box");
  button.disabled = true;
  console.log("test");
  if (checkbox.checked) {
    button.disabled = false;
    } else {
      button.disabled = true;
    }
});
}
export { signUpCheck }
