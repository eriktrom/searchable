module SearchableViewHelper
  
  def title(show_title = true, meta_title = @google.meta_title, page_title = @google.page_title || meta_title, meta_desc = @google.meta_desc || nil) #returns custom slug titles
    content_for(:title) { meta_title.to_s } 
    content_for(:h1_title) { page_title.to_s }
    content_for(:meta_desc) { meta_desc.to_s }
    @show_title = show_title
    @title_is_defined = true
  end
  
  def hide_title?
    !@show_title
  end
  
  def title_is_defined?
    defined?(@title_is_defined) ? true : false
  end
  
end