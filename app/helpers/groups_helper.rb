module GroupsHelper
  def membership_for(group:, user:)
    membership = group.memberships.find { |m| m.user_id == user.id }

    if membership
      [membership, true]
    else
      [group.memberships.build(user: user), false]
    end
  end
end
