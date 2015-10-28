class Recipe < ActiveRecord::Base
	validates :title, length: { minimum: 5 }, allow_blank: false
	validates :description, presence: true

	has_attached_file :image, styles: { medium: "300x300#" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
