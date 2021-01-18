# == Schema Information
#
# Table name: patients
#
#  id             :bigint           not null, primary key
#  avatar         :json
#  birth_date     :date
#  code           :string
#  gender         :integer
#  name           :string
#  phone          :string
#  profession     :string
#  relative_phone :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :bigint
#
# Indexes
#
#  index_patients_on_user_id  (user_id)
#
class Patient < ApplicationRecord
  belongs_to :user

  enum gender: [:outro, :masculino, :feminino]

  has_many :office_visits

  validates_presence_of :birth_date, :code, :gender, :name, :phone, :profession

  validates :avatar, presence: false

  mount_uploader :avatar, AvatarUploader

  validate :validity_of_date

  def validity_of_date
    # errors.delete(:birth_date)
    errors.add(:birth_date, "A data é inválida.") if DateHelper.parse(birth_date).nil? 
  end

  def age
    return 0 if birth_date.nil?
    return ((Time.zone.now - birth_date.to_time) / 1.year.seconds).floor
  end

  def validate_code(code)
  	if self.code == code
  		return true
  	end
  end

end
