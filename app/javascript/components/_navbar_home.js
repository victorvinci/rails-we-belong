function initUpdateNavbarOnScroll() {

  const navbar = document.querySelector('.navbar-wb');

    if (navbar && document.querySelector('.home-banner')) {
      window.addEventListener('scroll', () => {
        if (window.scrollY >= window.innerHeight-400) {
          navbar.classList.add('navbar-wb-home');
        } else {
          navbar.classList.remove('navbar-wb-home');
        }
      })}
    else {
        navbar.classList.add('navbar-wb-pages');
      };
    }




export { initUpdateNavbarOnScroll };

