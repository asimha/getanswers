class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :user

  validates :question, presence: true

  scope :search, lambda {|query| where("LOWER(question) LIKE LOWER('%#{query}%')") }

  mount_uploader :photo, PhotoUploader
end
