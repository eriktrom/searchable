class Google < ActiveRecord::Base
  belongs_to :googleable, :polymorphic => true
  before_create :remember_parent_title_on_create
  before_update :remember_parent_title_on_update
  after_save :save_parent
  
  def truncate(str, length)
		return '' if str.blank?
		truncated = str.size > length
		(str.mb_chars[0..(length)]).to_s
	end
	
	def meta_desc
    self[:meta_desc] = truncate(self[:meta_desc], 165)
	end
  
  private
  
  def remember_parent_title_on_create
    if defined? self.googleable
      unless self.googleable == nil
        @parent_title = self.googleable.page_title
      end
    end
  end
  
  def remember_parent_title_on_update
    unless googleable_id == nil
      unless self.googleable == nil
        @parent_title = self.googleable.page_title
      end
    end
  end
  
  def save_parent
    unless googleable_id == nil
      unless self.googleable == nil
        unless self.page_title == @parent_title
          self.googleable.save
        end
      end
    end
  end
  
end
