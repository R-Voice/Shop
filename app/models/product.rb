class Product < ActiveRecord::Base
	validates :title, :description, :image_url, :price, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates	:title, uniqueness:true
	IMAGE_FORMAT = %r{\.(gif|jpg|png)\z}i
	validates :image_url, allow_blank: true, format: {with: IMAGE_FORMAT}
	 # message: {"URL должен указывать на изображение формата GIF, JPG, PNG."}

	has_many :line_items
	has_many :orders, through: :line_items
	before_destroy :ensure_not_referenced_by_any_line_item

	private

	def ensure_not_referenced_by_any_line_item
		if line_items.empty?
			return true
		else
			errors.add(:base, "существуют товарные позиции")
			return false
		end
	end
end
