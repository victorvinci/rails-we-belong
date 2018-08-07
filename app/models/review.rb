class Review < ApplicationRecord
  include PgSearch
  multisearchable against: [ :content ]
  belongs_to :user
  belongs_to :company
  has_one :answer
  accepts_nested_attributes_for :answer
  after_create :calculate_weighting

  validate :exists?, on: :save

  private
   def calculate_weighting
    self.answer.minority? ? self.weighting = 130 : 100
    self.save!
   end
end
