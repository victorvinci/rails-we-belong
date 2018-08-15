module ApplicationHelper
  def home_class_for_navbar
    output = 'navbar-wb-item navbar-wb-link'
    output << ' navbar-wb-link-hiden' if current_page?(root_path)
    output
  end
end
