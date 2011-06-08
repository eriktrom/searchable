class GooglesController < InheritedResources::Base
  respond_to :html, :js, :only => [:update]
  
  def edit
    edit!{(render :layout => false and return) if request.xhr?}
  end
  
  def update
    update!{:back}
  end
  
  private
  
  def interpolation_options
    { :resource_name => 'Your search engine tags(or page title)' }
  end
  
end
