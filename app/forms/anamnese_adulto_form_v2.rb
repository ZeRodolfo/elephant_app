class AnamneseAdultoFormV2 < BaseFormV2
  def initialize
    super
    @fields = [
      { 
        type: 'topic',
        name: 'identificacao',
        column_right: [
          { name: 'identificacao_observacao', type: 'observation', label: 'Observação'},
        ],
        column_left: [
          { type: 'header', label: 'Identificação'},
          { name: 'identidade', type: 'text', label: 'Identidade' },
          { name: 'religiao', type: 'text', label: 'Religião' },
          { name: 'escolaridade', type: 'text', label: 'Escolaridade' },
          {
            name: 'filhos_nome_idade_e_sexo',
            type: 'textarea',
            label: 'Filhos (nome, idade e sexo)'
          },
          { name: 'estado_civil', type: 'textarea', label: 'Estado civil' },
          {
            name: 'conjuge_nome_idade_profissao_escolaridade',
            type: 'textarea',
            label: 'Cônjuge (nome, idade, profissão, escolaridade)'
          },
          { name: 'queixa_principal', type: 'textarea', label: 'Queixa principal' },
          {
            name: 'possibilidade_de_horarios',
            type: 'textarea',
            label: 'Possibilidade de horários'
          },
          {
            name: 'fez_terapia_anteriormente?_citar_qual_e_quando',
            type: 'textarea',
            label: 'Fez terapia anteriormente? (citar qual e quando)'
          },
          {
            name: 'expectativas_e_objetivos_do_paciente',
            type: 'textarea',
            label: 'Expectativas e objetivos do paciente'
          },
          {
            name: 'sintomas_apresentados',
            type: 'textarea',
            label: 'Sintomas apresentados'
          },
          { name: 'doencas_fisicas', type: 'textarea', label: 'Doenças físicas' },
          {
            name: 'estressores_psicossociais',
            type: 'textarea',
            label: 'Estressores psicossociais'
          },
          {
            name: 'funcionamento_global',
            type: 'textarea',
            label: 'Funcionamento global'
          },
          {
            name: 'conceituacao_psicologica_do_caso',
            type: 'textarea',
            label: 'Conceituação psicológica do caso'
          },
          {
            name: 'transtornos_psiquiatricos_anteriores',
            type: 'textarea',
            label: 'Transtornos psiquiátricos anteriores'
          },
          {
            name: 'transtornos_psiquiatricos_familiares',
            type: 'textarea',
            label: 'Transtornos psiquiátricos familiares'
          },
          {
            name: 'doencas_importantes_que_teve',
            type: 'textarea',
            label: 'Doenças importantes que teve'
          },
          {
            name: 'medicacao_que_esta_tomando',
            type: 'textarea',
            label: 'Medicação que está tomando'
          },
          {
            name: 'medicacao_alternativa_chas_compostos_etc',
            type: 'textarea',
            label: 'Medicação alternativa (chás, compostos, etc.)'
          },
          {
            name: 'aplicacao_de_testes?_se_sim_qual_e_resultado',
            type: 'textarea',
            label: 'Aplicação de testes? se sim, qual e resultado'
          },
          { type: 'add_ask', label: 'Adicionar Pergunta', values: [], name: 'identificacao_pergunta_'},
        ],
      },
      { 
        type: 'topic',
        name: 'historico_queixa',
        column_right: [
          { name: 'historico_queixa_observacao', type: 'observation', label: 'Observação'},
        ],
        column_left: [
          { type: 'header', label: 'Histórico da queixa'},
          { name: 'quando_se_iniciou', type: 'textarea', label: 'Quando se iniciou' },
          {
            name: 'eventos_traumaticos_de_vida',
            type: 'textarea',
            label: 'Eventos traumáticos de vida'
          },
          {
            name: 'eventosfatores_que_precipitam_ou_agravam_crises',
            type: 'textarea',
            label: 'Eventos/fatores que precipitam ou agravam crises'
          },
          { name: 'uso_de_drogas', type: 'textarea', label: 'Uso de drogas' },
          {
            name: 'tentativa_de_suicidio',
            type: 'textarea',
            label: 'Tentativa de suicídio'
          },
          {
            name: 'focos_de_intervencao_psicoterapica',
            type: 'textarea',
            label: 'Focos de intervenção psicoterápica'
          },
          { type: 'add_ask', label: 'Adicionar Pergunta', values: [], name: 'historico_queixa_pergunta_'},
        ],
      },
      { 
        type: 'topic',
        name: 'relacionamentos_importantes',
        column_right: [
          { name: 'relacionamentos_importantes_observacao', type: 'observation', label: 'Observação'},
        ],
        column_left: [
          { type: 'header', label: 'Relacionamentos Importantes'},
          { name: 'conjuje', type: 'textarea', label: 'Conjuje' },
          { name: 'mae', type: 'textarea', label: 'Mãe' },
          { name: 'pai', type: 'textarea', label: 'Pai' },
          { name: 'irmaos', type: 'textarea', label: 'Irmãos' },
          { name: 'filhos', type: 'textarea', label: 'Filhos' },
          {
            name: 'outros_importantes',
            type: 'textarea',
            label: 'Outros importantes'
          },
          {
            name: 'observacoes_sobre_dinâmica_familiar_atual',
            type: 'textarea',
            label: 'Observações sobre dinâmica familiar atual'
          },
          { type: 'add_ask', label: 'Adicionar Pergunta', values: [], name: 'relacionamentos_importantes_pergunta_'},
        ]
      },
      { 
        type: 'topic',
        name: 'infancia',
        column_right: [
          { name: 'infancia_observacao', type: 'observation', label: 'Observação'},
        ],
        column_left: [
          { type: 'header', label: 'Infância'},
          {
            name: 'gravidez_planejada_ou_nao_parto_intercorrencias_obstetricas',
            type: 'textarea',
            label: 'Gravidez (planejada ou não), parto, intercorrências obstétricas'
          },
          { name: 'amamentacao', type: 'textarea', label: 'Amamentação' },
          {
            name: 'treinamento_de_higiene',
            type: 'textarea',
            label: 'Treinamento de higiene'
          },
          {
            name: 'estressores_na_infância_crises',
            type: 'textarea',
            label: 'Estressores na infância, crises'
          },
          {
            name:
              'outros_transtornos_infantis_sono_alimentacao_psicomotor_gagueira_tiques_sonambulismo_aprendizagem',
            type: 'textarea',
            label:
              'Outros transtornos infantis (sono, alimentação, psicomotor, gagueira, tiques, sonambulismo, aprendizagem)'
          },
          {
            name: 'outros_comentarios',
            type: 'textarea',
            label: 'Outros comentários'
          },
          { type: 'add_ask', label: 'Adicionar Pergunta', values: [], name: 'infancia_pergunta_'},
        ]
      },
      { 
        type: 'topic',
        name: 'adolescencia',
        column_right: [
          { name: 'adolescencia_observacao', type: 'observation', label: 'Observação'},
        ],
        column_left: [
          { type: 'header', label: 'Adolescência'},
          {
            name: 'experiencias_afetivas_marcantes',
            type: 'textarea',
            label: 'Experiências afetivas marcantes'
          },
          {
            name: 'experiencias_sexuais_marcantes',
            type: 'textarea',
            label: 'Experiências sexuais marcantes'
          },
          {
            name: 'independencia_primeiros_empregos',
            type: 'textarea',
            label: 'Independência/ primeiros empregos'
          },
          {
            name: 'circulo_de_amizades',
            type: 'textarea',
            label: 'Círculo de amizades'
          },
          { type: 'add_ask', label: 'Adicionar Pergunta', values: [], name: 'adolescencia_pergunta_'},
        ]
      },
      { 
        type: 'topic',
        name: 'vida_adulta',
        column_right: [
          { name: 'vida_adulta_observacao', type: 'observation', label: 'Observação'},
        ],
        column_left: [
          { type: 'header', label: 'Vida Adulta'},
          {
            name: 'relacionamento_com_parceiro',
            type: 'textarea',
            label: 'Relacionamento com parceiro'
          },
          { name: 'vida_sexual_atual', type: 'textarea', label: 'Vida sexual atual' },
          {
            name: 'situacao_financeira',
            type: 'textarea',
            label: 'Situação financeira'
          },
          {
            name: 'abortos_espontâneosprovocados',
            type: 'textarea',
            label: 'Abortos espontâneos/provocados'
          },
          {
            name: 'apoio_social_disponivel',
            type: 'textarea',
            label: 'Apoio social disponível'
          },
          {
            name: 'outros_transtornos_atuais_sono_alimentacao_tiquesetc',
            type: 'textarea',
            label: 'Outros transtornos atuais (sono, alimentação, tiques,etc.)'
          },
          {
            name: 'principais_lazeres_vida_social',
            type: 'textarea',
            label: 'Principais lazeres, vida social'
          },
          {
            name: 'observacao_e_linguagem_nao_verbal_do_paciente',
            type: 'textarea',
            label: 'Observação e linguagem não verbal do paciente:'
          },
          { type: 'add_ask', label: 'Adicionar Pergunta', values: [], name: 'vida_adulta_pergunta_'},
        ]
      },
      { 
        type: 'topic',
        name: 'atendimentos_prestados',
        column_right: [
          { name: 'atendimentos_prestados_observacao', type: 'observation', label: 'Observação'},
        ],
        column_left: [
          { type: 'header', label: 'Atendimentos Prestados'},
          { name: 'profissional', type: 'text', label: 'Profissional' },
          {
            name: 'encaminhamentos_feitos',
            type: 'textarea',
            label: 'Encaminhamentos feitos'
          },
          {
            name:
              'terapeutica_utilizada_prescricao_de_exercicios_leituras_relaxamento_etc',
            type: 'textarea',
            label:
              'Terapêutica utilizada (prescrição de exercícios, leituras, relaxamento, etc.'
          },
          { type: 'add_ask', label: 'Adicionar Pergunta', values: [], name: 'atendimentos_prestados_pergunta_'},
        ]
      }
    ]
  end
end
