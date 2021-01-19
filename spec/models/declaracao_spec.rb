# == Schema Information
#
# Table name: declaracaos
#
#  id         :bigint           not null, primary key
#  city       :string
#  crp        :string
#  text       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  patient_id :bigint
#
# Indexes
#
#  index_declaracaos_on_patient_id  (patient_id)
#
# Foreign Keys
#
#  fk_rails_...  (patient_id => patients.id)
#
require 'rails_helper'

RSpec.describe Declaracao, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
