# == Schema Information
#
# Table name: user_preferences
#
#  id         :bigint           not null, primary key
#  data_atual :boolean
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
require 'rails_helper'

RSpec.describe UserPreference, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
