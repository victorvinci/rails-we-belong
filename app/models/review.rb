class Review < ApplicationRecord
  include PgSearch
  multisearchable against: [ :content ]
  belongs_to :user
  belongs_to :company
end
