class Blog < ApplicationRecord
	has_one_attached :image
	has_many :comments, dependent: :delete_all
	paginates_per 5
end
