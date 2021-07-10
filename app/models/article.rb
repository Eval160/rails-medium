class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_rich_text :rich_content
  has_one_attached :blob
  validates :title, presence: true, length: { minimum: 3 }
  validates :rich_content, presence: true
end
