class Section < ActiveRecord::Base

  belongs_to :page
  has_many :section_edits
  has_many :editors, :through => :section_edits, :class_name => "AdminUser"

  validates_presence_of :name
  
  scope :visible, lambda {where(:visible => true)}
  scope :invisible, lambda {where(:visible => false)}
  scope :sorted, lambda {order("sections.position ASC")}
  scope :newest_first, lambda {order("sections.position DESC")}
  scope :search, lambda {|query|
  where(["name LIKE ?","%#{query}%"])
  }
end
