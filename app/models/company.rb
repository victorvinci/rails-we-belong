class Company < ApplicationRecord
  include PgSearch
  pg_search_scope :search_by_name,
    against: [ :name ]
  pg_search_scope :search_by_industry,
    against: [ :name ]
  pg_search_scope :global_search,
      against: [ :name ],
      associated_against: {
        industry: [ :name ]
      }
  multisearchable against: [ :name ]
  has_many :reviews
  belongs_to :industry
end
