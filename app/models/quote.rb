class Quote < ApplicationRecord
  validates_presence_of :author
  validates_presence_of :content

  scope :search_content, -> (query) { where("content like ?", "%#{query}%")}
end
