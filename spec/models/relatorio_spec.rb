# == Schema Information
#
# Table name: relatorios
#
#  id          :bigint           not null, primary key
#  analysis    :string
#  atendido    :string
#  conclusion  :string
#  crp         :string
#  description :string
#  goal        :string
#  procedure   :string
#  solicitante :string
#  type        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  patient_id  :bigint
#
# Indexes
#
#  index_relatorios_on_patient_id  (patient_id)
#
# Foreign Keys
#
#  fk_rails_...  (patient_id => patients.id)
#
require 'rails_helper'

RSpec.describe Relatorio, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
