# == Schema Information
#
# Table name: laudos
#
#  id          :bigint           not null, primary key
#  analysis    :string
#  conclusion  :string
#  crp         :string
#  description :string
#  kind        :string           default("psicologico")
#  procedure   :string
#  references  :string
#  solicitante :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  patient_id  :bigint
#
# Indexes
#
#  index_laudos_on_patient_id  (patient_id)
#
# Foreign Keys
#
#  fk_rails_...  (patient_id => patients.id)
#
require 'rails_helper'

RSpec.describe Laudo, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
