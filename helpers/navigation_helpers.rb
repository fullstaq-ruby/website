module NavigationHelpers
  def navbar_link(label, id, current_id, target)
    link = link_to(%Q{<span>#{h label}</span>}, url_for(target), 'data-nav-section': id)
    if id == current_id
      %Q{<li class="active">#{link}</li>}
    else
      %Q{<li>#{link}</li>}
    end
  end

  def navbar_dropdown(label, id, current_id)
    link = link_to(%Q{<span>#{h label} <span class="caret"></span></span>},
      '#',
      class: 'dropdown-toggle',
      role: 'button',
      'data-toggle': 'dropdown',
      'aria-haspopup': true,
      'aria-expanded': false)
    active_class =
      if id == current_id
        'active'
      else
        nil
      end
    concat %Q{<li class="dropdown #{active_class}">#{link}<ul class="dropdown-menu">}
    yield
    concat %Q{</ul></li>}
  end
end
