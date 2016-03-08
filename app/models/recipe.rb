class Recipe < ActiveRecord::Base

  belongs_to :user
  has_many :ingredients
  has_many :directions
  
  has_attached_file :image, styles: { medium: "300x300#" }
  
  validates :title, length: { minimum: 5 }, allow_blank: false
  validates :description, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  accepts_nested_attributes_for :ingredients, 
                                reject_if: proc{ |attributes| attributes['name'].blank? }, 
                                allow_destroy: true
  accepts_nested_attributes_for :directions,  
                                reject_if: proc{ |attributes| attributes['step'].blank?},
                                allow_destroy: true

end