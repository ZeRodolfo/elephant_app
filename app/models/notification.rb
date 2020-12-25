# == Schema Information
#
# Table name: notifications
#
#  id         :bigint           not null, primary key
#  data       :string
#  status     :integer          default("pendent")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Notification < ApplicationRecord
  enum status: %i[pendent processing processed]
end
