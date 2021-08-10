class RelatorioPdf < PdfDocument
  def build
    add_document_header_logo()
    if !user.clinic_name.nil? and !user.clinic_name.empty?
      add_document_description("#{user.clinic_name}")
    end
    if form.psicologico?
      add_document_header('Relatório Psicológico', margin_top: 20)
    else
      add_document_header('Relatório Psicológico ou Multidisciplinar', margin_top: 20)
    end

    add_section('Identificação:', margin_top: 0)

    add_table([
      ['Nome do atendido', patient.name],
      ['Nome do Solicitante', form.solicitante],
      ['Nome da autora', patient.user.name],
      ['Nº de registro no CRP', form.crp],
      ['Data de elaboração do Relatório', form.created_at.to_date.to_s],
    ])

    add_section('Finalidade:')
    add_paragraph form.goal

    add_section('Descrição da Demanda:')
    add_paragraph form.description

    add_section('Procedimento:')
    add_paragraph form.procedure

    add_section('Análise:')
    add_paragraph form.analysis

    add_section('Conclusão:')
    add_paragraph form.conclusion
  end
end
