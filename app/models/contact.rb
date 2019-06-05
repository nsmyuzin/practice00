class Contact < ApplicationRecord
  validates :email, presence: true, length: {maximum:255}, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  validates :full_name, presence: true
  validates :title, presence: true
  validates :message, presence: true
end
