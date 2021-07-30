class AnamneseInfantilFormV1 < BaseForm
  def initialize
    super
    @fields = [
      {
        type: 'header', label: 'Identificação'
      },
      { # identificacao
        name: 'data_inicial', type: 'date', classes: '', label: 'Data inicial'
      },
      {
        name: 'data_termino', type: 'date', classes: '', label: 'Data final'
      },
      {
        name: 'nome_pai', type: 'text', classes: '', label: 'Nome do pai'
      },
      {
        name: 'profissao_pai', type: 'text', classes: '', label: 'Profissão do pai'
      },
      {
        name: 'escolaridade_pai', type: 'text', classes: '', label: 'Escolaridade do pai'
      },
      {
        name: 'nome_mae', type: 'text', classes: '', label: 'Nome da mãe'
      },
      {
        name: 'profissao_mae', type: 'text', classes: '', label: 'Profissão da mãe'
      },
      {
        name: 'escolaridade_mae', type: 'text', classes: '', label: 'Escolaridade da mãe'
      },
      {
        name: 'divorciados', type: 'select', options: [['Sim', 1],
                                                       ['Não', 0]], classes: '', label: 'Pais são separados?'
      },
      {
        name: 'quantidade_irmaos', type: 'number', min: 0, classes: '', label: 'Quantidade de irmãos'
      },
      {
        name: 'nome_escola', type: 'text', label: 'Nome da escola'
      },
      {
        name: 'turma_escola', type: 'text', label: 'Turma'
      },
      {
        name: 'serie_escola', type: 'text', label: 'Série'
      },
      {
        name: 'nome_professor', type: 'text', label: 'Nome do professor'
      },
      {
        name: 'telefone_escola', type: 'text', classes: 'telefone', label: 'Contato da escola'
      },
      {
        type: 'header', label: 'Histórico'
      },
      { # historico
        name: 'natural', type: 'select', options: [['Sim', 1], ['Não', 0]], label: 'Filho natural?'
      },
      {
        name: 'natural_obs', type: 'text', label: 'Observações'
      },
      {
        name: 'pre_natal', type: 'select', options: [['Sim', 1],
                                                     ['Não', 0]], label: 'Fez pré natal?'
      },
      {
        name: 'gravidez_planejada', type: 'select', options: [['Sim', 1],
                                                              ['Não', 0]], label: 'Gravidez planejada?'
      },
      {
        type: 'header', label: 'Problemas'
      },
      { # problemas
        name: 'problema_gravidez', type: 'select', options: [['Sim', 1],
                                                             ['Não', 0]], label: 'Gravidez?'
      },
      {
        name: 'problema_pressao', type: 'checkbox', label: 'Pressão alta'
      },
      {
        name: 'problema_queda', type: 'checkbox', label: 'Queda'
      },
      {
        name: 'problema_infeccao', type: 'checkbox', label: 'Infecções'
      },
      {
        name: 'problema_sangue', type: 'checkbox', label: 'Perda de sangue'
      },
      {
        name: 'problema_aborto', type: 'checkbox', label: 'Tentativa de aborto'
      },
      {
        name: 'problema_fumo', type: 'checkbox', label: 'Fumo'
      },
      {
        name: 'problema_alcool', type: 'checkbox', label: 'Álcool'
      },
      {
        name: 'problema_droga', type: 'checkbox', label: 'Drogas'
      },
      {
        name: 'problema_medicamento', type: 'checkbox', label: 'Medicamentos'
      },
      {
        name: 'problema_obs', type: 'text', label: 'Observações'
      },
      {
        type: 'header', label: 'Parto'
      },
      { # parto
        name: 'nasceu_em_casa', type: 'select', options: [['Sim', 1],
                                                          ['Não', 0]], label: 'Nasceu em casa'
      },
      {
        name: 'parto_normal', type: 'checkbox', label: 'Medicamentos'
      },
      {
        name: 'cesariana', type: 'checkbox', label: 'Cesariana'
      },
      {
        name: 'forceps', type: 'checkbox', label: 'Fórceps'
      },
      {
        name: 'precisou_oxigenio', type: 'checkbox', label: 'Precisou de oxigênio'
      },
      {
        name: 'prematuro', type: 'checkbox', label: 'Prematuro'
      },
      {
        name: 'a_termo', type: 'checkbox', label: 'A termo'
      },
      {
        name: 'demorou_para_chorar', type: 'checkbox', label: 'Demorou para chorar'
      },
      {
        name: 'incubadora', type: 'checkbox', label: 'Ficou na incubadora'
      },
      {
        name: 'parto_obs', type: 'text', label: 'Observações'
      },
      {
        name: 'peso', type: 'number', min: 0, classes: '', label: 'Peso'
      },
      {
        name: 'altura', type: 'number', min: 0, classes: '', label: 'Altura'
      },
      {
        name: 'problemas_depois_nascimento', type: 'select', options: [['Sim', 1],
                                                                       ['Não',
                                                                        0]], label: 'Depois do nascimento, apresentou algum problema?'
      },
      {
        name: 'problemas_depois_nascimento_obs', type: 'text', label: 'Quais?'
      },
      {
        type: 'header', label: 'Amamentação'
      },
      { # amamentacao
        name: 'peito_exclusivo', type: 'number', min: 0, classes: '', label: 'Exclusivo peito até quantos meses'
      },
      {
        name: 'peito_complemento', type: 'number', min: 0, classes: '', label: 'Peito com complemento até quantos meses'
      },
      {
        name: 'mamadeira', type: 'number', min: 0, classes: '', label: 'Mamadeira'
      },
      {
        name: 'sopa_frutas', type: 'number', min: 0, classes: '', label: 'Sopa/frutas'
      },
      {
        name: 'mudanca_alimentacao', type: 'textarea', label: 'Como foi a aceitação da criança à mudança de alimentação'
      },
      {
        name: 'onde_faz_alimentacao', type: 'text', label: 'Onde faz as refeições?'
      },
      {
        name: 'chupeta', type: 'select', options: [['Sim', 1], ['Não', 0]], label: 'Chupetas'
      },
      {
        name: 'chupeta_retirada', type: 'number', min: 0, classes: '', label: 'Retirada'
      },
      {
        name: 'dedo', type: 'select', options: [['Sim', 1], ['Não', 0]], label: 'Chupou o dedo'
      },
      {
        name: 'dedo_retirada', type: 'number', min: 0, classes: '', label: 'Até'
      },
      {
        type: 'header', label: 'Sono'
      },
      { # sono
        name: 'calmo', type: 'checkbox', label: 'Calmo'
      },
      {
        name: 'agitado', type: 'checkbox', label: 'Agitado'
      },
      {
        name: 'dificuldade_sono', type: 'checkbox', label: 'Dificuldade para dormir'
      },
      {
        name: 'acorda_a_noite', type: 'checkbox', label: 'Acorda durante a noite'
      },
      {
        name: 'horario_sono', type: 'select', options: [['Sim', 1],
                                                        ['Não', 0]], label: 'Tem horário para dormir/acordar?'
      },
      {
        name: 'fala_sono', type: 'select', options: [['Sim', 1],
                                                     ['Não', 0]], label: 'Fala ou anda dormindo'
      },
      {
        type: 'header', label: 'Desenvolvimento'
      },
      { # desenvolvimento
        name: 'sentou', type: 'number', min: 0, classes: '', label: 'Idade que sentou sem apoio'
      },
      {
        name: 'engatinhou', type: 'number', min: 0, classes: '', label: 'Idade que engatinhou'
      },
      {
        name: 'andou', type: 'number', min: 0, classes: '', label: 'Idade que andou'
      },
      {
        name: 'falou', type: 'number', min: 0, classes: '', label: 'Idade que falou 1a palavra'
      },
      {
        name: 'falou_frase', type: 'number', min: 0, classes: '', label: 'Idade que falou frases'
      },
      {
        name: 'fralda_dia', type: 'number', min: 0, classes: '', label: 'Idade que parou de usar fraldas de dia'
      },
      {
        name: 'fralda_noite', type: 'number', min: 0, classes: '', label: 'Idade que parou de usar fraldas de noite'
      },
      {
        name: 'equilibro', type: 'select', options: [['Sim', 1],
                                                     ['Não', 0]], label: 'Apresenta equilíbrio motor?'
      },
      {
        type: 'header', label: 'Saúde'
      },
      { # saude
        name: 'dor_ouvido', type: 'checkbox', label: 'Agitado'
      },
      {
        name: 'infeccao', type: 'checkbox', label: 'Infecções'
      },
      {
        name: 'convulsao', type: 'checkbox', label: 'Convulsões'
      },
      {
        name: 'meningite', type: 'checkbox', label: 'Meningite'
      },
      {
        name: 'pneumonia', type: 'checkbox', label: 'Pneumonia'
      },
      {
        name: 'cirurgia', type: 'checkbox', label: 'Cirurgia'
      },
      {
        name: 'internações', type: 'checkbox', label: 'Internações'
      },
      {
        name: 'asma_bronquite', type: 'checkbox', label: 'Asma/bronquite'
      },
      {
        name: 'saude_obs', type: 'textarea', label: 'Outros'
      },
      {
        name: 'saude_tratamento', type: 'textarea', label: 'Faz algum tratamento? Qual? A quanto tempo? Como o responsável avalia esse tratamento?'
      },
      {
        name: 'saude_vacinas', type: 'select', options: [['Sim', 1],
                                                         ['Não', 0]], label: 'Vacinas em dia?'
      },
      {
        name: 'saude_aprendizagem', type: 'textarea', label: 'Algum familiar com histórico de problema de aprendizagem'
      },
      {
        name: 'saude_psiquiatrico', type: 'textarea', label: 'Algum familiar com histórico de problemas de saúde e psiquiátricos'
      },
      {
        name: 'saude_psiquiatrico_quais', type: 'textarea', label: 'Quais?'
      },
      {
        type: 'header', label: 'Escola e Lazer'
      },
      { # escpla e lazer
        name: 'pre_escola', type: 'select', options: [['Sim', 1],
                                                      ['Não', 0]], label: 'Fez Pré-Escola'
      },
      {
        name: 'repetencia', type: 'select', options: [['Sim', 1], ['Não', 0]], label: 'Repetência?'
      },
      {
        name: 'repetencia_quando', type: 'text', label: 'Quando?'
      },
      {
        name: 'escolas_frequentadas', type: 'number', min: 0, classes: '', label: 'Quantas escolas frequentou antes?'
      },
      {
        name: 'desempenho_matematica', type: 'select', options: [%w[Insuficiente i], %w[Pior p],
                                                                 ['Igual', '='], %w[Melhor m]], label: 'Desempenho em Matemática, em relação à média'
      },
      {
        name: 'desempenho_historia', type: 'select', options: [%w[Insuficiente i], %w[Pior p],
                                                               ['Igual', '='], %w[Melhor m]], label: 'Desempenho em História, Geografia, Estudos Sociais, em relação à média'
      },
      {
        name: 'desempenho_portugues', type: 'select', options: [%w[Insuficiente i], %w[Pior p],
                                                                ['Igual', '='], %w[Melhor m]], label: 'Desempenho em Português/Literatura, em relação à média'
      },
      {
        name: 'desempenho_ciencias', type: 'select', options: [%w[Insuficiente i], %w[Pior p],
                                                               ['Igual', '='], %w[Melhor m]], label: 'Desempenho em Ciências, em relação à média'
      },
      {
        name: 'desempenho_outras', type: 'select', options: [%w[Insuficiente i], %w[Pior p],
                                                             ['Igual', '='], %w[Melhor m]], label: 'Desempenho em Outras (exceto Ed. Física, Artes), em relação à média'
      },
      {
        name: 'problemas_desempenho_escolar', type: 'textarea', label: 'Quando começaram os problemas de desempenho escolar?'
      },
      {
        name: 'esportes_preferidos', type: 'textarea', label: 'Esportes que gosta de praticar'
      },
      {
        name: 'brincadeiras_preferidos', type: 'textarea', label: 'Atividades e brincadeiras preferidas'
      },
      {
        type: 'header', label: 'Relacionamentos'
      },
      { # relacionamentos
        name: 'grupo_extra_curricular', type: 'textarea', label: 'Grupos, clubes ou times que participa fora da escola'
      },
      {
        name: 'atividade_extra_curricular', type: 'textarea', label: 'Faz algum trabalho ou tarefa além das escolares?'
      },
      {
        name: 'amigos', type: 'number', min: 0, classes: '', label: 'Quantos amigos íntimos ele tem? (0) (1) (2 ou 3) (4 ou mais) Obs. Não incluir irmãos'
      },
      {
        name: 'saidas', type: 'number', min: 0, classes: '', label: 'Quantas vezes por semana encontra os amigos? (menos que 1) (1 ou 2) (3 ou mais)'
      },
      {
        name: 'comparado_irmaos', type: 'select', options: [%w[Pior p], ['Igual', '='],
                                                            %w[Melhor m]], label: 'Comparado com outros da idade de que forma a criança, se dá com os irmãos'
      },
      {
        name: 'comparado_outras', type: 'select', options: [%w[Pior p], ['Igual', '='],
                                                            %w[Melhor m]], label: 'Comparado com outros da idade de que forma a criança, se dá com outras crianças'
      },
      {
        name: 'comparado_pais', type: 'select', options: [%w[Pior p], ['Igual', '='],
                                                          %w[Melhor m]], label: 'Comparado com outros da idade de que forma a criança, se comporta em relação aos pais'
      },
      {
        name: 'comparado_sozinho', type: 'select', options: [%w[Pior p], ['Igual', '='],
                                                             %w[Melhor m]], label: 'Comparado com outros da idade de que forma a criança, brinca ou trabalha sozinho'
      },
      {
        name: 'comparado_grupo', type: 'select', options: [%w[Pior p], ['Igual', '='],
                                                           %w[Melhor m]], label: 'Comparado com outros da idade de que forma a criança, brinca ou trabalha em grupo'
      },
      {
        name: 'maiores_preocupacoes', type: 'textarea', label: 'Quais as maiores preocupações em relação à criança/adolescente?'
      },
      {
        name: 'qualidades_obs', type: 'textarea', label: 'Descreva as maiores qualidades ou pontos positivos da criança/adolescente'
      },
      {
        type: 'header', label: 'Comportamento da Criança/Adolescente'
      },
      { # Comportamento da Criança/Adolescente
        name: 'comportamento_calmo', type: 'select', options: [['Falso/Ausente', 0],
                                                               ['Mais ou menos verdadeiro', 1], ['Bastante verdadeiro', 2]], label: 'Calmo'
      },
      {
        name: 'comportamento_agitado', type: 'select', options: [['Falso/Ausente', 0],
                                                                 ['Mais ou menos verdadeiro', 1], ['Bastante verdadeiro', 2]], label: 'Agitado'
      },
      {
        name: 'comportamento_sem_concentracao', type: 'select', options: [['Falso/Ausente', 0],
                                                                          ['Mais ou menos verdadeiro', 1], ['Bastante verdadeiro', 2]], label: 'Não se concentra'
      },
      {
        name: 'comportamento_nao_termina', type: 'select', options: [['Falso/Ausente', 0],
                                                                     ['Mais ou menos verdadeiro', 1], ['Bastante verdadeiro', 2]], label: 'Não consegue terminar o que começa'
      },
      {
        name: 'comportamento_sem_prazer', type: 'select', options: [['Falso/Ausente', 0],
                                                                    ['Mais ou menos verdadeiro', 1], ['Bastante verdadeiro', 2]], label: 'Poucas coisas lhe dão prazer'
      },
      {
        name: 'comportamento_convencido', type: 'select', options: [['Falso/Ausente', 0],
                                                                    ['Mais ou menos verdadeiro', 1], ['Bastante verdadeiro', 2]], label: 'Conta vantagem/é convencido'
      },
      {
        name: 'comportamento_dependente', type: 'select', options: [['Falso/Ausente', 0],
                                                                    ['Mais ou menos verdadeiro', 1], ['Bastante verdadeiro', 2]], label: 'É dependente dos adultos'
      },
      {
        name: 'comportamento_obsessivo', type: 'select', options: [['Falso/Ausente', 0],
                                                                   ['Mais ou menos verdadeiro', 1], ['Bastante verdadeiro', 2]], label: 'Não consegue tirar pensamentos da cabeça (obsessões).'
      },
      {
        name: 'comportamento_obsessivo_obs', type: 'textarea', label: 'Quais?'
      },
      {
        name: 'queixa_se_de_solidao',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Queixa-se de solidão'
      },
      {
        name: 'parece_confuso',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Parece confuso'
      },
      {
        name: 'chora_muito',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Chora muito'
      },
      {
        name: 'fica_no_mundo_da_lua',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Fica no “mundo da lua'
      },
      {
        name: 'machuca_se_de_proposito_ou_ja_tentou_suicidio',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Machuca-se de propósito ou já tentou suicídio'
      },
      {
        name: 'exige_que_prestem_atencao_nele_destroi_as_propriascoisas',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Exige que prestem atenção nele destrói as próprias coisas'
      },
      {
        name: 'e_desobediente_em_casa',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'É desobediente em casa'
      },
      {
        name: 'e_desobediente_na_escola',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'É desobediente na escola'
      },
      {
        name: 'e_dificil_para_comer',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'É difícil para comer'
      },
      {
        name: 'nao_se_da_bem_com_outras_criancas',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Não se dá bem com outras crianças'
      },
      {
        name: 'nao_demonstra_arrependimento',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Não demonstra arrependimento'
      },
      {
        name: 'fica_com_ciumes_facilmente',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Fica com ciúmes facilmente'
      },
      {
        name: 'desrespeita_regras',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Desrespeita regras'
      },
      {
        name: 'tem_medo_de_certos_animais_situacoes_e_lugares_nao_incluir_a_escola',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label:
              'Tem medo de certos animais, situações e lugares (não incluir a escola).'
      },
      {
        name: 'tem_medo_de_certos_animais_situacoes_e_lugares_nao_incluir_a_escola_obs', type: 'textarea', label: 'Quais?'
      },
      {
        name: 'tem_medo_da_escola',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Tem medo da escola'
      },
      {
        name: 'tem_medo_da_escola_obs', type: 'textarea', label: 'Como?'
      },
      {
        name: 'tem_medo_de_pensar_ou_de_fazer_algo_destrutivo_contra_si_ou_outros',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label:
              'Tem medo de pensar ou de fazer algo destrutivo (contra si ou outros)'
      },
      {
        name: 'tem_mania_de_perfeicao_de_fazer_tudo_certo',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Tem “mania de perfeição”/ de fazer tudo certo'
      },
      {
        name: 'acha_que_ninguem_gosta_dele',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Acha que ninguém gosta dele'
      },
      {
        name: 'acha_que_os_outros_o_perseguem',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Acha que os outros o perseguem'
      },
      {
        name: 'sente_se_desvalorizado_inferior',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Sente-se desvalorizado, inferior'
      },
      {
        name: 'machuca_se_com_freqüencia__sofre_muitos_acidentes',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Machuca-se com freqüência / sofre muitos acidentes'
      },
      {
        name: 'entra_em_muitas_brigas',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Entra em muitas brigas'
      },
      {
        name: 'e_alvo_de_gozacao_com_freqüencia',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'É alvo de gozação com freqüência'
      },
      {
        name: 'anda_em_mas_companhias',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Anda em más companhias'
      },
      {
        name: 'escuta_sons_ou_vozes_que_nao_existem',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Escuta sons ou vozes que não existem'
      },
      {
        name: 'e_impulsivo_nao_consegue_se_controlar',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'É impulsivo/ não consegue se controlar'
      },
      {
        name: 'prefere_ficar_sozinho',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Prefere ficar sozinho'
      },
      {
        name: 'mente_ou_engana_os_outros',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Mente ou engana os outros'
      },
      {
        name: 'roi_unhas',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Rói unhas'
      },
      {
        name: 'e_nervoso_ou_tenso',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'É nervoso ou tenso'
      },
      {
        name: 'tem_tique_nervosococoetes',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Tem tique nervoso/cocoetes.'
      },
      {
        name: 'tem_tique_nervosococoetes_obs', type: 'textarea', label: 'Quais?'
      },
      {
        name: 'tem_pesadelos',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Tem pesadelos'
      },
      {
        name: 'as_outras_criancas_nao_gostam_dele',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'As outras crianças não gostam dele'
      },
      {
        name: 'tem_prisao_de_ventre',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Tem prisão de ventre'
      },
      {
        name: 'e_apreensivo_aflito_ou_ansioso_demais',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'É apreensivo, aflito ou ansioso demais'
      },
      {
        name: 'tem_tonturas',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Tem tonturas'
      },
      {
        name: 'sente_se_excessivamente_culpado',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Sente-se excessivamente culpado'
      },
      {
        name: 'come_exageradamente',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Come exageradamente'
      },
      {
        name: 'sente_se_cansado_demais_sem_motivo',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Sente-se cansado demais sem motivo'
      },
      {
        name: 'esta_gordo_demais',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Está gordo demais'
      },
      {
        name:
            'na_sua_opiniao_apresenta_problemas_fisicos_por_nervoso_s_causa_medica',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label:
              'Na sua opinião apresenta problemas físicos por “nervoso” (s/ causa médica)'
      },
      {
        name: 'dores_de_cabeca',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Dores de cabeça'
      },
      {
        name: 'nauseas_enjoos',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Náuseas, enjôos'
      },
      {
        name:
            'problemas_com_os_olhos_que_nao_desaparecem_com_o_uso_de_oculosdescreva',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label:
              'Problemas com os olhos que não desaparecem com o uso de óculos. Descreva'
      },
      {
        name: 'problemas_com_os_olhos_que_nao_desaparecem_com_o_uso_de_oculosdescreva_obs', type: 'textarea', label: 'Descreva'
      },
      {
        name: 'problemas_de_pele',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Problemas de pele'
      },
      {
        name: 'dores_de_estomagobarriga',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Dores de estômago/barriga'
      },
      {
        name: 'vomitos',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Vômitos'
      },
      {
        name: 'outras_queixasdores',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Outras queixas/dores'
      },
      {
        name: 'comportamento_muito_sexualizado',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Comportamento muito sexualizado'
      },
      {
        name: 'tem_problemas_sexuais',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Tem problemas sexuais'
      },
      {
        name: 'tem_problemas_sexuais_obs', type: 'textarea', label: 'Quais?'
      },
      {
        name: 'possui_problema_de_coordenacao_motoradesajeitado_ou_desastrado',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Possui problema de coordenação motora/desajeitado ou desastrado'
      },
      {
        name: 'prefere_conviver_com_criancas_mais_velhas',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Prefere conviver com crianças mais velhas'
      },
      {
        name: 'recusa_se_a_falar',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Recusa-se a falar'
      },
      {
        name: 'repete_certos_atos_varias_vezes_compulsoes',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Repete certos atos várias vezes (compulsões)'
      },
      {
        name: 'repete_certos_atos_varias_vezes_compulsoes_obs', type: 'textarea', label: 'Quais?'
      },
      {
        name:
            'fica_sem_jeito_na_frente_dos_outros_com_facilidade_preocupado_com_o_que_as_pessoas_possam_achardele',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label:
              "Fica sem jeito na frente dos outros com facilidade, preocupado com o que as pessoas possam achar\ndele"
      },
      {
        name: 'poe_fogo_nas_coisas',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Põe fogo nas coisas'
      },
      {
        name: 'fica_se_mostrando_ou_fazendo_palhacadas',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Fica se mostrando ou fazendo palhaçadas'
      },
      {
        name: 'e_muito_timido',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'É muito tímido'
      },
      {
        name: 'dorme_menos_que_a_maioria_das_criancas',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Dorme menos que a maioria das crianças'
      },
      {
        name: 'dorme_mais_que_a_maioria_das_criancas',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Dorme mais que a maioria das crianças'
      },
      {
        name: 'dorme_mais_que_a_maioria_das_criancas_obs', type: 'textarea', label: 'Descreva'
      },
      {
        name: 'tem_problemas_na_fala',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Tem problemas na fala'
      },

      {
        name: 'tem_problemas_na_fala_obs', type: 'textarea', label: 'Descreva'
      },
      {
        name: 'fica_com_o_olhar_parado',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Fica com o olhar parado'
      },
      {
        name: 'rouba_em_casa',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Rouba em casa'
      },
      {
        name: 'rouba_fora_de_casa',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Rouba fora de casa'
      },
      {
        name: 'junta_coisas_que_nao_precisa_e_que_nao_servem_para_nada',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Junta coisas que não precisa e que não servem para nada'
      },
      {
        name: 'junta_coisas_que_nao_precisa_e_que_nao_servem_para_nada_obs', type: 'textarea', label: 'Descreva'
      },
      {
        name: 'tem_comportamento_estranho',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Tem comportamento estranho'
      },
      {
        name: 'tem_comportamento_estranho_obs', type: 'textarea', label: 'Descreva'
      },
      {
        name: 'tem_ideias_estranhas',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Tem idéias estranhas'
      },
      {
        name: 'tem_ideias_estranhas_obs', type: 'textarea', label: 'Descreva'
      },
      {
        name: 'e_mal_humorado_irrita_se_com_facilidade',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'É mal humorado, irrita-se com facilidade'
      },
      {
        name: 'tem_mudancas_repentinas_de_humor_ou_sentimentos',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Tem mudanças repentinas de humor ou sentimentos'
      },
      {
        name: 'e_desconfiado',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'É desconfiado'
      },
      {
        name: 'xinga_ou_fala_palavroes',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Xinga ou fala palavrões'
      },
      {
        name: 'fala_que_vai_se_matar',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Fala que vai se matar'
      },
      {
        name: 'fala_demais',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Fala demais'
      },
      {
        name: 'gosta_de_gozar_os_outros',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Gosta de gozar os outros'
      },
      {
        name: 'tem_acessos_de_raiva',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Tem acessos de raiva'
      },
      {
        name: 'ameaca_as_pessoas',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Ameaça as pessoas'
      },
      {
        name: 'fuma',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Fuma'
      },
      {
        name: 'mata_aula',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Mata aula'
      },
      {
        name: 'bebe',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Bebe'
      },
      {
        name: 'usa_drogas',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Usa drogas'
      },
      {
        name: 'e_pouco_ativo_falta_lhe_energia',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'É pouco ativo, falta-lhe energia'
      },
      {
        name: 'e_infeliz_triste_ou_deprimido',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'É infeliz, triste ou deprimido'
      },
      {
        name: 'e_barulhento_demais_destroi_ou_estraga_coisas_publicas',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'É barulhento demais destrói ou estraga coisas públicas'
      },
      {
        name: 'faz_xixi_na_cama',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Faz xixi na cama'
      },
      {
        name: 'faz_manha',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Faz manha'
      },
      {
        name: 'gostaria_de_ser_do_sexo_oposto',
        type: 'select',
        options: [
          ['Falso/Ausente', 0],
          ['Mais ou menos verdadeiro', 1],
          ['Bastante verdadeiro', 2]
        ],
        label: 'Gostaria de ser do sexo oposto'
      },
      {
        name: 'outros_problemas_obs', type: 'textarea', label: 'Outros problemas observados'
      }
    ]
  end
end