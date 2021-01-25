# == Schema Information
#
# Table name: user_preferences
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserPreference < ApplicationRecord
  include ActiveStorage::Downloading

  has_one :user, dependent: :nullify
  has_one_attached :papel_timbrado

  validates :papel_timbrado, content_type: %w[image/png image/jpg image/jpeg]
end
