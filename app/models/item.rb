class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  belongs_to :user
  has_one :order

  has_one_attached :image

end
