# == Schema Information
#
# Table name: subscriptions
#
#  id              :bigint           not null, primary key
#  status          :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  mercado_pago_id :string
#  pag_seguro_id   :string
#  user_id         :bigint
#
# Indexes
#
#  index_subscriptions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Subscription, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
