class Page < ActiveRecord::Base
   attr_accessible :title, :body, :name, :permalink, :position, :visible
  belongs_to :subject , {:foreign_key => "subject_id"} # you don't need to add {:foreign_key => "subject_id"} as rails will know subject_id is foreign key as per convention
  has_many :sections
  has_and_belongs_to_many :editors, :class_name => "AdminUser"
end
