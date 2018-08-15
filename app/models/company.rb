class Company < ApplicationRecord
  include PgSearch

  has_many :reviews
  belongs_to :industry
  after_create :set_default_scores

  pg_search_scope :search,
      against: [:name],
      :using => {
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
                    :threshold => 0.1
                  }
                }
  paginates_per 5

  private

  def set_default_scores
    self.answer_1_total_score = 0
    self.answer_2_total_score = 0
    self.answer_3_total_score = 0
    self.answer_4_total_score = 0
    self.answer_5_total_score = 0
    self.answer_1_average_score = 50
    self.answer_2_average_score = 50
    self.answer_3_average_score = 50
    self.answer_4_average_score = 50
    self.answer_5_average_score = 50
    self.final_rating = 50
    self.save!
  end
end
