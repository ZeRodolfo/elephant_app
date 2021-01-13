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
class Subscription < ApplicationRecord
  belongs_to :user

  enum status: [:active, :suspended, :cancelled]

  with_options presence: true do
    validates :mercado_pago_id
  end
end
