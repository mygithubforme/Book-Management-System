class Page < ActiveRecord::Base

   belongs_to :subject
   has_many :sections
   has_and_belongs_to_many :editors, :class_name => "AdminUser"

   validates_presence_of :name
   
   scope :visible, lambda {where(:visible => true)}
   scope :invisible, lambda {where(:visible => false)}
   scope :sorted, lambda {order("pages.position ASC")}
   scope :newest_first, lambda {order("pages.position DESC")}
   scope :search, lambda {|query|
   where(["name LIKE ?","%#{query}%"])
   }

end
