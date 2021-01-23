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
#  fk_rails_...  (laudo_id => laudos.id)
#
class Grafico < ApplicationRecord
    belongs_to :laudo
    enum kind: { bar: 'Barra', pizza: 'Pizza' }
    # radar: 'Radar'
    def self.kind_for_select
        self.kinds.to_a.map{ |x| [x[1], x[0]] }
    end
    
    def readable_kind
        self.class.kinds[self.kind]
    end
end
