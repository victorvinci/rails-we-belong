class Review < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_one :answer
  has_many :votes
  accepts_nested_attributes_for :answer
  after_create :calculate_weighting

  private
   def calculate_weighting
    binding.pry
    self.answer.minority? ? self.weighting = 130 : self.weighting = 100
    self.save!
   end
end
