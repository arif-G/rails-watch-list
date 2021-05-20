class Movie < ApplicationRecord
  has_many :bookmarks
  validates :title, uniqueness: true, presence: true
  validates :overview, presence: true

  before_destroy :bookmarks?

  private

  def bookmarks?
    errors.add(:base, 'Cannot delete movie with bookmarks') unless bookmarks.count.zero?
    errors.blank?
  end
end
