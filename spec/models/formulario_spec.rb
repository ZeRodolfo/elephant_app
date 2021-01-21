# == Schema Information
#
# Table name: formularios
#
#  id         :bigint           not null, primary key
#  content    :json
#  identifier :integer
#  kind       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  patient_id :bigint
#
# Indexes
#
#  index_formularios_on_patient_id  (patient_id)
#
# Foreign Keys
#
#  fk_rails_...  (patient_id => patients.id)
#
require 'rails_helper'

RSpec.describe Formulario, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
