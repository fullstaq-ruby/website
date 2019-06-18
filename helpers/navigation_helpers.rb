module NavigationHelpers
  def navbar_link(label, id, current_id, target)
    link = link_to("<span>#{h label}</span>", url_for(target), 'data-nav-section': id)
    if id == current_id
      "<li class=\"active\">#{link}</li>"
    else
      "<li>#{link}</li>"
    end
  end
end
