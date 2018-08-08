function initUpdateNavbarOnScroll() {

  const navbar = document.querySelector('.navbar-wb');

    if (navbar && document.querySelector('.home-banner')) {
      window.addEventListener('scroll', () => {
        if (window.scrollY >= window.innerHeight-340) {
          navbar.classList.add('navbar-wb-home');
          document.getElementById('custom-search-input').classList.remove('hide');
        } else {
          navbar.classList.remove('navbar-wb-home');
          document.getElementById('custom-search-input').classList.add('hide');
        }
      })}
    else {
        navbar.classList.add('navbar-wb-pages');
        document.getElementById('custom-search-input').classList.remove('hide');
      };
    }




export { initUpdateNavbarOnScroll };

