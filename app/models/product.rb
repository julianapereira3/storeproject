class Product < ApplicationRecord
	belongs_to :department, optional: true, foreign_key: 'id_department'
  validates :price, :department, presence: true
  validates :name, length: { minimum: 4 }
end