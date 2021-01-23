class AnamneseInfantilPdf < PdfDocument
  def build
    alphabet = ('a'..'z').map{ |a| "#{a}) " }

    add_document_header('ANAMNÉSE INFANTIL')
    add_section('1 - Identificação')
    add_table([
      ['Data Inicial', form.data_inicial&.value&.to_date&.to_s],
      ['Data Término', form.data_termino&.value&.to_date&.to_s],
      ['Data de Nascimento', patient.birth_date&.to_s],
      ['Idade', patient.age.to_s],
      ['Sexo', patient.gender.to_s],
      ['CPF', patient.cpf.to_s],
      ['Endereço', patient.address.resume],
      ['Telefone', patient.phone.to_s],
    ])

    render_fields(
      :nome_pai, :profissao_pai, :escolaridade_pai,
      :nome_mae, :profissao_mae, :escolaridade_mae,
      :divorciados, :quantidade_irmaos, :nome_escola,
      :turma_escola, :serie_escola, :nome_professor,
      :telefone_escola
    )

    move_down 20
    add_section('2 - Histórico')
    move_down 20

    render_fields(:natural, :natural_obs, :pre_natal, :gravidez_planejada)

    move_down 20
    add_section('3 - Problemas')
    move_down 20

    render_fields(
      :problema_gravidez,
      :problema_pressao,
      :problema_queda,
      :problema_infeccao,
      :problema_sangue,
      :problema_aborto,
      :problema_fumo,
      :problema_alcool,
      :problema_droga,
      :problema_medicamento,
      :problema_obs,
      prefix_enum: alphabet.each
    )

    move_down 20
    add_section('4 - Parto')
    move_down 20

    render_fields(
      :nasceu_em_casa,
      :parto_normal,
      :cesariana,
      :forceps,
      :precisou_oxigenio,
      :prematuro,
      :a_termo,
      :demorou_para_chorar,
      :incubadora,
      :parto_obs,
      prefix_enum: alphabet.each
    )

    move_down 10

    render_fields(
      :peso,
      :altura,
      :problemas_depois_nascimento,
      :problemas_depois_nascimento_obs
    )

    move_down 20
    add_section('5 - Amamentação')
    move_down 20

    render_fields(
      :peito_exclusivo,
      :peito_complemento,
      :mamadeira,
      :sopa_frutas,
      :mudanca_alimentacao,
      :onde_faz_alimentacao,
      :chupeta,
      :chupeta_retirada,
      :dedo,
      :dedo_retirada,
      prefix_enum: alphabet.each
    )

    move_down 20
    add_section('6 - Sono')
    move_down 20

    render_fields(
      :calmo,
      :agitado,
      :dificuldade_sono,
      :acorda_a_noite,
      :horario_sono,
      :fala_sono,
      prefix_enum: alphabet.each
    )

    move_down 20
    add_section('7 - Desenvolvimento')
    move_down 20

    render_fields(
      :sentou,
      :engatinhou,
      :andou,
      :falou,
      :falou_frase,
      :fralda_dia,
      :fralda_noite,
      :equilibro,
      prefix_enum: alphabet.each
    )

    move_down 20
    add_section('8 - Saúde')
    move_down 20

    render_fields(
      :dor_ouvido,
      :infeccao,
      :convulsao,
      :meningite,
      :pneumonia,
      :cirurgia,
      :internações,
      :asma_bronquite,
      :saude_obs,
      prefix_enum: alphabet.each
    )

    move_down 10

    render_fields(
      :saude_tratamento,
      :saude_vacinas,
      :saude_aprendizagem,
      :saude_psiquiatrico,
      :saude_psiquiatrico_quais,
    )

    move_down 20
    add_section('9 - Escola e Lazer')
    move_down 20

    render_fields(
      :pre_escola,
      :repetencia,
      :repetencia_quando,
      :escolas_frequentadas,
      :desempenho_matematica,
      :desempenho_historia,
      :desempenho_portugues,
      :desempenho_ciencias,
      :desempenho_outras,
      :problemas_desempenho_escolar,
      :esportes_preferidos,
      :brincadeiras_preferidos,
      prefix_enum: alphabet.each
    )

    move_down 20
    add_section('10 - Relacionamentos')
    move_down 20

    render_fields(
      :grupo_extra_curricular,
      :atividade_extra_curricular,
      :amigos,
      :saidas,
      :comparado_irmaos,
      :comparado_outras,
      :comparado_pais,
      :comparado_sozinho,
      :comparado_grupo,
      :maiores_preocupacoes,
      :qualidades_obs,
      prefix_enum: alphabet.each
    )

    move_down 20
    add_section('11 - Comportamento da Criança/Adolescente')
    move_down 20

    text 'Para cada item abaixo coloque um nº de acordo com o relato do responsável:'
    text '(0) falso/ausente (1) mais ou menos verdadeiro (2) bastante verdadeiro.'
    move_down 20

    render_fields(
      :comportamento_calmo,
      :comportamento_agitado,
      :comportamento_sem_concentracao,
      :comportamento_nao_termina,
      :comportamento_sem_prazer,
      :comportamento_convencido,
      :comportamento_dependente,
      :comportamento_obsessivo,
      :comportamento_obsessivo_obs,
      :queixa_se_de_solidao,
      :parece_confuso,
      :chora_muito,
      :fica_no_mundo_da_lua,
      :machuca_se_de_proposito_ou_ja_tentou_suicidio,
      :exige_que_prestem_atencao_nele_destroi_as_propriascoisas,
      :e_desobediente_em_casa,
      :e_desobediente_na_escola,
      :e_dificil_para_comer,
      :nao_se_da_bem_com_outras_criancas,
      :nao_demonstra_arrependimento,
      :fica_com_ciumes_facilmente,
      :desrespeita_regras,
      :tem_medo_de_certos_animais_situacoes_e_lugares_nao_incluir_a_escola,
      :tem_medo_de_certos_animais_situacoes_e_lugares_nao_incluir_a_escola_obs,
      :tem_medo_da_escola,
      :tem_medo_da_escola_obs,
      :tem_medo_de_pensar_ou_de_fazer_algo_destrutivo_contra_si_ou_outros,
      :tem_mania_de_perfeicao_de_fazer_tudo_certo,
      :acha_que_ninguem_gosta_dele,
      :acha_que_os_outros_o_perseguem,
      :sente_se_desvalorizado_inferior,
      :machuca_se_com_freqüencia__sofre_muitos_acidentes,
      :entra_em_muitas_brigas,
      :e_alvo_de_gozacao_com_freqüencia,
      :anda_em_mas_companhias,
      :escuta_sons_ou_vozes_que_nao_existem,
      :e_impulsivo_nao_consegue_se_controlar,
      :prefere_ficar_sozinho,
      :mente_ou_engana_os_outros,
      :roi_unhas,
      :e_nervoso_ou_tenso,
      :tem_tique_nervosococoetes,
      :tem_tique_nervosococoetes_obs,
      :tem_pesadelos,
      :as_outras_criancas_nao_gostam_dele,
      :tem_prisao_de_ventre,
      :e_apreensivo_aflito_ou_ansioso_demais,
      :tem_tonturas,
      :sente_se_excessivamente_culpado,
      :come_exageradamente,
      :sente_se_cansado_demais_sem_motivo,
      :esta_gordo_demais,
      :na_sua_opiniao_apresenta_problemas_fisicos_por_nervoso_s_causa_medica,
      :dores_de_cabeca,
      :nauseas_enjoos,
      :problemas_com_os_olhos_que_nao_desaparecem_com_o_uso_de_oculosdescreva,
      :problemas_com_os_olhos_que_nao_desaparecem_com_o_uso_de_oculosdescreva_obs,
      :problemas_de_pele,
      :dores_de_estomagobarriga,
      :vomitos,
      :outras_queixasdores,
      :comportamento_muito_sexualizado,
      :tem_problemas_sexuais,
      :tem_problemas_sexuais_obs,
      :possui_problema_de_coordenacao_motoradesajeitado_ou_desastrado,
      :prefere_conviver_com_criancas_mais_velhas,
      :recusa_se_a_falar,
      :repete_certos_atos_varias_vezes_compulsoes,
      :repete_certos_atos_varias_vezes_compulsoes_obs,
      :fica_sem_jeito_na_frente_dos_outros_com_facilidade_preocupado_com_o_que_as_pessoas_possam_achardele,
      :poe_fogo_nas_coisas,
      :fica_se_mostrando_ou_fazendo_palhacadas,
      :e_muito_timido,
      :dorme_menos_que_a_maioria_das_criancas,
      :dorme_mais_que_a_maioria_das_criancas,
      :dorme_mais_que_a_maioria_das_criancas_obs,
      :tem_problemas_na_fala,
      :tem_problemas_na_fala_obs,
      :fica_com_o_olhar_parado,
      :rouba_em_casa,
      :rouba_fora_de_casa,
      :junta_coisas_que_nao_precisa_e_que_nao_servem_para_nada,
      :junta_coisas_que_nao_precisa_e_que_nao_servem_para_nada_obs,
      :tem_comportamento_estranho,
      :tem_comportamento_estranho_obs,
      :tem_ideias_estranhas,
      :tem_ideias_estranhas_obs,
      :e_mal_humorado_irrita_se_com_facilidade,
      :tem_mudancas_repentinas_de_humor_ou_sentimentos,
      :e_desconfiado,
      :xinga_ou_fala_palavroes,
      :fala_que_vai_se_matar,
      :fala_demais,
      :gosta_de_gozar_os_outros,
      :tem_acessos_de_raiva,
      :ameaca_as_pessoas,
      :fuma,
      :mata_aula,
      :bebe,
      :usa_drogas,
      :e_pouco_ativo_falta_lhe_energia,
      :e_infeliz_triste_ou_deprimido,
      :e_barulhento_demais_destroi_ou_estraga_coisas_publicas,
      :faz_xixi_na_cama,
      :faz_manha,
      :gostaria_de_ser_do_sexo_oposto,
      :outros_problemas_obs,
      use_alternative: true
    )
  end
end
