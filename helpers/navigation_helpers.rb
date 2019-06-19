module NavigationHelpers
  def navbar_link(label, section_id, current_section_id, target, options = {})
    link = link_to(%Q{<span>#{label}</span>}, url_for(target),
      { 'data-nav-section': [section_id].flatten.last }.merge(options))
    if current_section_id_matches?(current_section_id, section_id)
      %Q{<li class="active">#{link}</li>}
    else
      %Q{<li>#{link}</li>}
    end
  end

  def navbar_dropdown(label, section_id, current_section_id)
    link = link_to(%Q{<span>#{label} <span class="caret"></span></span>},
      '#',
      class: 'dropdown-toggle',
      role: 'button',
      'data-toggle': 'dropdown',
      'aria-haspopup': true,
      'aria-expanded': false)
    active_class =
      if current_section_id_matches?(current_section_id, section_id)
        'active'
      else
        nil
      end
    concat %Q{<li class="dropdown #{active_class}">#{link}<ul class="dropdown-menu">}
    yield
    concat %Q{</ul></li>}
  end

private
  def current_section_id_matches?(current_section_id, section_id)
    if section_id.is_a?(Array)
      section_id.include?(current_section_id)
    else
      section_id == current_section_id
    end
  end
end
