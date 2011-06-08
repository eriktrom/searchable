module SearchableControllerHelper
  
  # requires inherited_resources and friendly_id
  def redirect_to_best_friendly_id(friendly_url = resource_url, parent = nil, nested = false)
   if request.url != friendly_url
     if nested == true
       if !resource.friendly_id_status.best?
         redirect_to friendly_url, :status => :moved_permanently
       elsif !parent.friendly_id_status.best?
         redirect_to friendly_url, :status => :moved_permanently
       end
     else
       if !resource.friendly_id_status.best?
         redirect_to friendly_url, :status => :moved_permanently
       end
     end
   end
  end

  def google_show_page(resource_class = resource_class, resource = resource)
   @google = Google.where(:googleable_type => resource_class, :googleable_id => resource.id).first
  end

  def google_landing_page(resource_class = controller_name.classify.constantize.to_s)
   @google = Google.find_or_create_by_googleable_type(resource_class)
  end

  def build_google_resource(resource_class = resource_class, resource = resource)
   resource.build_google(:googleable_type => resource_class, :googleable_id => resource.id)
  end
  
end