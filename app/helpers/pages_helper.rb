module PagesHelper
  def tabs_open_helper tab_param
    case tab_params
    when "user-information"
      "active"
    when "favorites"
      "active"
    when "purchases"
      "active"
    when "contact"
      "active"
    else
      ""
    end
  end
end
