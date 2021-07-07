class Article < ApplicationRecord
  belongs_to :user, optional: true
  validates :title, presence: true, length: { minimum: 3 }
  validates :content, presence: true, length: { minimum: 10 }
  validates :publish, presence: true
end
