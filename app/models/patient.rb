# == Schema Information
#
# Table name: patients
#
#  id             :bigint           not null, primary key
#  avatar         :json
#  birth_date     :date
#  code           :string
#  cpf            :string
#  gender         :integer
#  name           :string
#  naturalidade   :string
#  phone          :string
#  profession     :string
#  relative_phone :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  address_id     :bigint
#  user_id        :bigint
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
class Patient < ApplicationRecord
  belongs_to :user
  belongs_to :address

  accepts_nested_attributes_for :address

  enum gender: { outro: 0, masculino: 1, feminino: 2 }

  has_many :office_visits, dependent: :delete_all

  has_many :pareceres, class_name: 'Parecer', dependent: :delete_all
  has_many :declaracoes, class_name: 'Declaracao', dependent: :delete_all
  has_many :laudos, dependent: :delete_all
  has_many :relatorios, dependent: :delete_all
  has_many :formularios, dependent: :delete_all
  has_many :atestados, dependent: :delete_all

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

  def self.gender_for_select
    self.genders.to_a.map{ |x| [x[0].humanize, x[0]] }
  end

  def readable_gender
    (self.gender || 'Indefinido').humanize
  end

  def validate_code(code)
  	if self.code == code
  		return true
  	end
  end

end
