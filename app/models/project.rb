class Project < ApplicationRecord
	enum category: {Product:0, Collaboration:1, Consulting: 2}
	
  has_attached_file :image
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	
	validates :category, presence: true
	validates :name, presence: true
	validates :text, presence: true

	serialize :imageurls, Array

	before_save do
		if text.present?
			self.imageurls = Nokogiri::HTML.fragment(text).css('img').map{|img| img.attribute('src')}.collect(&:to_s)
		end
	end
end
