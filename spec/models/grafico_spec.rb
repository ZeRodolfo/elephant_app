# == Schema Information
#
# Table name: graficos
#
#  id         :bigint           not null, primary key
#  data       :json
#  kind       :string           default(NULL)
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  laudo_id   :bigint
#
# Indexes
#
#  index_graficos_on_laudo_id  (laudo_id)
#
# Foreign Keys
#
#  fk_rails_...  (laudo_id => laudos.id) ON DELETE => cascade
#
require 'rails_helper'

RSpec.describe Grafico, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
