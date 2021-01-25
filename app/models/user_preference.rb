# == Schema Information
#
# Table name: user_preferences
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_user_preferences_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class UserPreference < ApplicationRecord
  include ActiveStorage::Downloading

  belongs_to :user
  has_one_attached :papel_timbrado

  validates :papel_timbrado, content_type: %w[image/png image/jpg image/jpeg]
end
