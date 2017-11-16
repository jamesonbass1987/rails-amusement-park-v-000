module AttractionsHelper

  def admin_edit_controls(attraction)
    link_to "Edit Attraction", edit_attraction_path(attraction) unless !current_user.is_admin?
  end

  def admin_delete_controls(attraction)
    link_to "Delete Attraction", attraction_path(attraction), :method => :delete unless !current_user.is_admin?
  end

  def admin_create_controls
    link_to "Create New Attraction", new_attraction_path unless !current_user.is_admin?
  end

  def admin_attraction_show_controls(attraction)
    if current_user.is_admin?
      link_to "Show #{attraction.name}", attraction_path(attraction)
    else
      link_to "Go on #{attraction.name}", attraction_path(attraction)
    end
  end

end
