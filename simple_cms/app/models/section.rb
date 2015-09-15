class Section < ActiveRecord::Base
   attr_accessible :title, :body, :name, :position, :visible, :content_type, :content
  belongs_to :page
  has_many :section_edits
  has_many :editors, :through => :section_edits , :class_name => "AdminUser"
end
