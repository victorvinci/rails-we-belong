function initUpdateNavbarOnScroll() {

  const navbar = document.querySelector('.navbar-wb');

    if (navbar && document.querySelector('.carousel slide')) {
      window.addEventListener('scroll', () => {
        if (window.scrollY >= window.innerHeight-400) {
          navbar.classList.add('navbar-wagon-white');
        } else {
          navbar.classList.remove('navbar-wagon-white');
        }
      })}
    else {
        navbar.classList.add('navbar-wagon-pages');
      };
    }




export { initUpdateNavbarOnScroll };

