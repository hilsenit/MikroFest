module PagesHelper

  # I've created a helper to open a certain user page(partial) if a param is added to the path
  def tabs_open_helper tabs_param:, tab_id:, active_class: "active", inactive_class: "", default_tab: false
    if default_tab && tabs_param.nil? # If no param is given the default should be active
      active_class
    else
      if tabs_param == tab_id
        active_class
      else
        inactive_class
      end
    end
  end

  def current_user_email_short_helper
    current_user.email.split("@")[0]
  end

  def return_title_helper title_id
    Title.find(title_id)
  end

end
