class Review < ApplicationRecord
  include PgSearch
  belongs_to :user
  belongs_to :company
  has_one :answer
  accepts_nested_attributes_for :answer
  after_create :calculate_weighting

  pg_search_scope :search,
      against: [ :content ],
      associated_against: {
        company: [ :name ]
      },
      using: {
        tsearch: { prefix: true, any_word: true },
        :trigram => {
                    :threshold => 0.1
                  }
      }


  private

  def calculate_weighting
    self.answer.minority? ? self.weighting = 130 : 100
    self.save!
  end
end
