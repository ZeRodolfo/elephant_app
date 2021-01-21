class AnamneseAdultoPdf < PdfDocument
  def build
    alphabet = ('a'..'z').map{ |a| "#{a}) " }

    add_document_header('ANAMNÉSE DE ADULTO')
    add_section('1 - Identificação')
    move_down 20

    add_oneline_answer('Nome: ', patient.name)
    add_oneline_answer('Idade: ', patient.age.to_s)
    add_oneline_answer('Sexo: ', patient.gender)
    add_oneline_answer('CPF: ', patient.cpf)

    render_fields(
      :identidade,
      :religiao,
      :escolaridade,
      :filhos_nome_idade_e_sexo,
      :estado_civil,
      :conjuge_nome_idade_profissao_escolaridade,
      :queixa_principal,
      :possibilidade_de_horarios,
      :'fez_terapia_anteriormente?_citar_qual_e_quando',
      :expectativas_e_objetivos_do_paciente,
      :sintomas_apresentados,
      :doencas_fisicas,
      :estressores_psicossociais,
      :funcionamento_global,
      :conceituacao_psicologica_do_caso,
      :transtornos_psiquiatricos_anteriores,
      :transtornos_psiquiatricos_familiares,
      :doencas_importantes_que_teve,
      :medicacao_que_esta_tomando,
      :medicacao_alternativa_chas_compostos_etc,
      :'aplicacao_de_testes?_se_sim_qual_e_resultado',
    )

    move_down 20
    add_section('2 - Histórico da Queixa')
    move_down 20

    render_fields(
      :quando_se_iniciou,
      :eventos_traumaticos_de_vida,
      :eventosfatores_que_precipitam_ou_agravam_crises,
      :uso_de_drogas,
      :tentativa_de_suicidio,
      :focos_de_intervencao_psicoterapica,
    )

    move_down 20
    add_section('3 - Relacionamentos Importantes')
    move_down 20

    render_fields(
      :conjuje,
      :mae,
      :pai,
      :irmaos,
      :filhos,
      :outros_importantes,
      :observacoes_sobre_dinâmica_familiar_atual,
    )

    move_down 20
    add_section('4 - Infância')
    move_down 20

    render_fields(
      :gravidez_planejada_ou_nao_parto_intercorrencias_obstetricas,
      :amamentacao,
      :treinamento_de_higiene,
      :estressores_na_infância_crises,
      :outros_transtornos_infantis_sono_alimentacao_psicomotor_gagueira_tiques_sonambulismo_aprendizagem,
      :outros_comentarios,
    )

    move_down 20
    add_section('5 - Adolescência')
    move_down 20

    render_fields(
      :experiencias_afetivas_marcantes,
      :experiencias_sexuais_marcantes,
      :independencia_primeiros_empregos,
      :circulo_de_amizades,
    )

    move_down 20
    add_section('6 - Vida Adulta')
    move_down 20

    render_fields(
      :relacionamento_com_parceiro,
      :vida_sexual_atual,
      :situacao_financeira,
      :abortos_espontâneosprovocados,
      :apoio_social_disponivel,
      :outros_transtornos_atuais_sono_alimentacao_tiquesetc,
      :principais_lazeres_vida_social,
      :observacao_e_linguagem_nao_verbal_do_paciente,
    )

    move_down 20
    add_section('7 - Atendimentos Prestados')
    move_down 20

    render_fields(
      :profissional,
      :encaminhamentos_feitos,
      :terapeutica_utilizada_prescricao_de_exercicios_leituras_relaxamento_etc,
    )
  end
end