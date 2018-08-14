class Review < ApplicationRecord
  include PgSearch
  belongs_to :user
  belongs_to :company
  has_one :answer
  has_many :votes
  accepts_nested_attributes_for :answer

  validates :content, length: { minimum: 40, too_short: ": Este conteúdo deve ter mais de 40 caracteres."}

  pg_search_scope :search,
      against: [ :content ],
      # associated_against: {
      #   company: [ :name ]
      # },
      # :ranked_by => ":tsearch",
      using: {
        tsearch: {
          prefix: true,
          any_word: true,
          highlight: {
            StartSel: '<strong>',
            StopSel: '</strong>',
            MaxWords: 123,
            MinWords: 456,
            ShortWord: 4,
            HighlightAll: true,
            MaxFragments: 3,
            FragmentDelimiter: '&hellip;'
          }
        },
        :trigram => {
                    :threshold => 0.5
                  }
      }
  paginates_per 5

end
