class Company < ApplicationRecord
  has_many :reviews
  belongs_to :industry
end
