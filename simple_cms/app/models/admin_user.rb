class AdminUser < ActiveRecord::Base
  attr_accessible :title, :body , :first_name , :last_name , :username , :email , :hashed_password , :salt
  # set_table_name("admin_users")
  has_and_belongs_to_many :pages
  has_many :section_edits
  has_many :sections, :through => :section_edits
end
