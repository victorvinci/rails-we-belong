class Answer < ApplicationRecord
  belongs_to :review
  #User must give an answqer between 0 & 5. Corresponds to N/A, Strongly Disagree - Strongly Agree
  validates :answer_1, :answer_2, :answer_3, :answer_4, :answer_5, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
end
