class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :group_users
  has_many :members, through: :group_users
  has_many :groupposts
  accepts_nested_attributes_for :group_users
  def self.search(search)
    search ? where('title LIKE ?', "%#{search}%") : all
  end
end
