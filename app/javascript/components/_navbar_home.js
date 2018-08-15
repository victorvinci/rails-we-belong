
function initUpdateNavbarOnScroll() {

  const navbar = document.querySelector('.navbar-wb');

    if (navbar && document.querySelector('.home-banner')) {
      window.addEventListener('scroll', () => {
        if (window.scrollY >= window.innerHeight-260) {
          navbar.classList.add('navbar-wb-home');
          document.getElementById('custom-search-input').classList.remove('hide');
          document.getElementById('linkone').classList.remove('navbar-wb-link-hiden');
          document.getElementById('linkone').classList.add('navbar-wb-link');
          document.getElementById('linktwo').classList.remove('navbar-wb-link-hiden');
          document.getElementById('linktwo').classList.add('navbar-wb-link');

        } else {
          navbar.classList.remove('navbar-wb-home');
          document.getElementById('custom-search-input').classList.add('hide');
          document.getElementById('linkone').classList.remove('navbar-wb-link');
          document.getElementById('linkone').classList.add('navbar-wb-link-hiden');
          document.getElementById('linktwo').classList.remove('navbar-wb-link');
          document.getElementById('linktwo').classList.add('navbar-wb-link-hiden');
        }
      })}
    else {
        navbar.classList.add('navbar-wb-pages');
        document.getElementById('custom-search-input').classList.remove('hide');
        document.getElementById('custom-search-input').classList.remove('hide');

      };
    }




export { initUpdateNavbarOnScroll };

