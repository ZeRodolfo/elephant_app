class LaudoPdf < PdfDocument
  def build
    add_document_header_logo()
    add_document_description("SETOR DE PSICOLOGIA APLICADA – SPA")
    add_document_description("CLÍNICA DE #{user.clinic_name}")

    if form.psicologico?
      add_document_header('Laudo Psicológico', margin_top: 20)
    else
      add_document_header('Laudo Neuropsicológico', margin_top: 20)
    end

    add_section('Identificação:', margin_top: 0)

    add_table([
      ['Paciente', patient.name],
      ['Data de Nascimento', patient.birth_date.to_s],
      ['Idade', patient.age],
      ['Naturalidade', patient.naturalidade],
      ['Solicitante do laudo', form.solicitante],
      ['Parecerista (CRP)', form.crp],
      ['Data de elaboração do parecer', form.created_at.to_date.to_s],
    ])

    add_section('Descrição da Demanda:')
    add_paragraph form.description

    add_section('Procedimento:')
    add_paragraph form.procedure

    if form&.picture&.present?
      add_section('Imagem Anexada: ', margin_bottom: 0)
      pdf.image File.join(Rails.root, 'public', form.picture), position: :center, height: 222, width: 400

      add_section('', margin_bottom: 0)
    end

    grafico_data = form&.grafico&.data.present? ? JSON.parse(form&.grafico&.data) : nil

    grafico_has_content = form&.grafico&.bar? ? grafico_data.present? : grafico_data.present? && grafico_data['data'].present?

    # grafico_data = form&.grafico&.data.present? ? JSON.parse(form&.grafico&.data) : nil
    # grafico_has_content = grafico_data.present?
    # grafico_has_content = grafico_has_content && grafico_data['data'].present? unless form&.grafico&.bar?

    if grafico_has_content && form&.grafico&.image&.present?
      pdf.image StringIO.new(Base64.decode64(form.grafico.image)), position: :center, height: 222, width: 222
    end

    add_section('Análise:')
    add_paragraph form.analysis

    # new_page

    add_section('Conclusão:')
    add_paragraph form.conclusion

    add_section('Referências:')
    add_paragraph form.references

  rescue JSON::ParserError
  end
end
