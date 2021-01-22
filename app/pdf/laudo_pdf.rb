class LaudoPdf < PdfDocument
  def build
    if form.psicologico?
      add_document_header('Laudo Psicológico')
    else
      add_document_header('Laudo Neuropsicológico')
    end

    add_section('Identificação:')

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

    add_section('Análise:')
    add_paragraph form.analysis

    add_section('Conclusão:')
    add_paragraph form.conclusion

    add_section('Referências:')
    add_paragraph form.references
  end
end
