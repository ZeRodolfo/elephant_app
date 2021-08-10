# == Schema Information
#
# Table name: patients
#
#  id                         :bigint           not null, primary key
#  avatar                     :json
#  birth_date                 :date
#  code                       :string
#  cpf                        :string
#  default_office_visit_value :decimal(, )
#  email                      :string
#  gender                     :integer
#  name                       :string
#  naturalidade               :string
#  phone                      :string
#  profession                 :string
#  relative_phone             :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  address_id                 :bigint
#  user_id                    :bigint
#
# Indexes
#
#  index_patients_on_address_id  (address_id)
#  index_patients_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (address_id => addresses.id)
#
require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
