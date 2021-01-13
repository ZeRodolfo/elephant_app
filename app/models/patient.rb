# == Schema Information
#
# Table name: patients
#
#  id             :bigint           not null, primary key
#  age            :integer
#  avatar         :json
#  code           :string
#  company        :string
#  marital_status :string
#  name           :string
#  office         :string
#  schooling      :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  form_id        :bigint
#  user_id        :bigint
#
# Indexes
#
#  index_patients_on_form_id  (form_id)
#  index_patients_on_user_id  (user_id)
#
class Patient < ApplicationRecord
  belongs_to :user
  has_one :form, dependent: :destroy

  has_many :office_visits

  validates_presence_of :company, :code, :marital_status, :name, :schooling, :age, :office

  validates :avatar, presence: false

  mount_uploader :avatar, AvatarUploader


  def validate_code(code)
  	if self.code == code
  		return true
  	end
  end

end
