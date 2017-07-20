class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :user, :group, presence: true
  validates :user_id, uniqueness: {scope: [:group_id]}
end
