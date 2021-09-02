class Join < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :community, optional: true
  validates_uniqueness_of :community_id, scope: :user_id 
end
