class Recipe < ActiveRecord::Base
	validates :title, length: { minimum: 5 }, allow_blank: false
	validates :description, presence: true

   	has_attached_file :image, styles: { medium: "300x300#" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

    has_many :ingredients
    accepts_nested_attributes_for :ingredients,
    								reject_if: proc{ |attributes| attributes['name'].blank? },
    								allow_destroy: true

    has_many :directions
    accepts_nested_attributes_for :directions,
    							    reject_if: proc{ |attributes| attributes['step'].blank?},
    							    allow_destroy: true
end
