class Author < ApplicationRecord
	has_many :books
	validates :name ,presence: true, length: {minimum: 3}
	validates :contact, presence: true, length: {minimum: 4},numericality: {greater_than: 0}
	before_save :down


	def down
		self.name.downcase!
	end
	

end
