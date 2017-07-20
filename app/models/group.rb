class Group < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships

  accepts_nested_attributes_for :memberships, allow_destroy: true

  validates :name, presence: true, uniqueness: true
end
