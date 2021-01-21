# == Schema Information
#
# Table name: parecers
#
#  id          :bigint           not null, primary key
#  analysis    :string
#  conclusion  :string
#  crp         :string
#  description :string
#  references  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  patient_id  :bigint
#
# Indexes
#
#  index_parecers_on_patient_id  (patient_id)
#
# Foreign Keys
#
#  fk_rails_...  (patient_id => patients.id)
#
require 'rails_helper'

RSpec.describe Parecer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
