class Movie < ApplicationRecord
  has_many :bookmarks
  validates :title, uniqueness: true, presence: true
  validates :overview, presence: true

  before_destroy :has_bookmarks?

  private
  def has_bookmarks?
    errors.add(:base, "Cannot delete movie with bookmarks") unless bookmarks.count == 0
    errors.blank? #return false, to not destroy the element, otherwise, it will delete.
  end
end
