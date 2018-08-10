import "bootstrap";
import { initUpdateNavbarOnScroll } from '../components/_navbar_home';
import { showMore } from '../components/_showMore'


$('[data-toggle="tooltip"]').tooltip()
initUpdateNavbarOnScroll();
showMore();
