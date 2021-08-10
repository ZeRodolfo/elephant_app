# == Schema Information
#
# Table name: atestados
#
#  id             :bigint           not null, primary key
#  certificate_at :date
#  cidade         :string
#  crp            :string
#  text           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  patient_id     :bigint
#
# Indexes
#
#  index_atestados_on_patient_id  (patient_id)
#
# Foreign Keys
#
#  fk_rails_...  (patient_id => patients.id)
#
require 'rails_helper'

RSpec.describe Atestado, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
