module PagesHelper

  # I've created a helper to open a certain user page(partial) if a param is added to the path
  def tabs_open_helper tabs_param:, tab_id:, active_class: "active", inactive_class: "", default_tab: false
    if default_tab && tabs_param.nil?
      active_class
    else
      tabs_param == tab_id ?  active_class : inactive_class
    end
  end

end
