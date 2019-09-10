module NavigationHelpers
  def navbar_link(label, section_id, current_section_id, target, options = {})
    link_options = {
      class: 'nav-link',
      'data-nav-section': [section_id].flatten.last
    }.merge(options)
    link = link_to(%Q{<span>#{label}</span>}, url_for(target), link_options)
    if current_section_id_matches?(current_section_id, section_id)
      %Q{<li class="nav-item active">#{link}</li>}
    else
      %Q{<li class="nav-item">#{link}</li>}
    end
  end

  def navbar_dropdown(label, section_id, current_section_id)
    link = link_to(%Q{<span>#{label}</span>},
      '#',
      id: "navbar_dropdown_#{section_id}",
      class: 'nav-link dropdown-toggle',
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
    concat %Q{
      <li class="nav-item dropdown #{active_class}">
        #{link}
        <div class="dropdown-menu" aria-labelledby="navbar_dropdown_#{section_id}">
    }
    yield
    concat %Q{</div></li>}
  end

  def navbar_dropdown_item(label, section_id, current_section_id, target, options = {})
    link_options = {
      class: 'dropdown-item',
      'data-nav-section': [section_id].flatten.last
    }
    if current_section_id_matches?(current_section_id, section_id)
      link_options[:class] << ' active'
    end
    link_options.merge!(options)
    link_to(%Q{<span>#{label}</span>}, url_for(target), link_options)
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
