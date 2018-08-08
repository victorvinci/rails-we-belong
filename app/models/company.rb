class Company < ApplicationRecord
  include PgSearch

  has_many :reviews
  belongs_to :industry

  pg_search_scope :search,
      against: [ :name ],
      :using => {
                  tsearch: { prefix: true, any_word: true },
                  :trigram => {
                    :threshold => 0.1
                  }
                }
  paginates_per 5
end
