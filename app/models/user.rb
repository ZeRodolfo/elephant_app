# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  category               :integer
#  document_number        :string
#  document_type          :string           default("cpf")
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  phone                  :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  mercado_pago_id        :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :patients, dependent: :destroy
  has_many :addresses

  enum category: [:Empresa, :Autônomo]
  enum document_type: { cpf: 'CPF', cnpj: 'CNPJ' }

  with_options presence: true do
    validates :phone
    validates :first_name
    validates :last_name
    validates :document_number
  end

  def name
    "#{first_name} #{last_name}"
  end

  # Whether the user is registered on mercado pago
  def integrated?
    mercado_pago_id.present?
  end
end
