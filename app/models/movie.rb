class Movie < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
  has_many :bookmarks
  before_destroy :check_for_bookmarks?

  private

  def check_for_bookmarks?
    errors.add(:base, "cannot delete movie without bookmarks") unless bookmarks.count == 0
    errors.blank?
  end
end
