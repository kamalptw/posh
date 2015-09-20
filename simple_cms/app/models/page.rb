require 'position_mover'
class Page < ActiveRecord::Base
  include PositionMover
  attr_accessible :title, :body, :name, :permalink, :position, :visible, :subject_id, :created_at, :updated_at

  belongs_to :subject , {:foreign_key => "subject_id"} # you don't need to add {:foreign_key => "subject_id"} as rails will know subject_id is foreign key as per convention
  has_many :sections
  has_and_belongs_to_many :editors, :class_name => "AdminUser"

  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  validates :permalink , :length => {:within => 3..255}
  #validate_uniqueness_of :permalink
  #for unique values by subject , :scope => :subject_id

  scope :sorted, order('pages.position ASC')
  scope :visible, where(:visible => true)
  scope :invisible, where(:visible => false)
  private

  def position_scope
    "pages.subject_id = #{subject_id.to_i}"
  end
end
