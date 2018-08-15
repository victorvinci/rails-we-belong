module ApplicationHelper
  def home_class_for_navbar
    output = 'navbar-wb-item navbar-wb-link'
    if current_page?(root_path)
      output << ' navbar-wb-link-hiden'
    end
    output
  end
end
