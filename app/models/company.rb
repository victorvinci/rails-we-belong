class Company < ApplicationRecord
  include PgSearch

  has_many :reviews
  belongs_to :industry

  pg_search_scope :search,
      against: [ :name ],
      associated_against: {
        industry: [ :name ]
      },
      using: {
        tsearch: { prefix: true, any_word: true }
      }
end
