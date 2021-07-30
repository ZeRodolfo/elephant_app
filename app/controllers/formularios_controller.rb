class FormulariosController < ApplicationController
  before_action :set_patient
  before_action :set_formulario_infantil, only: [:edit_infantil, :update_infantil, :show_infantil]
  before_action :set_formulario_adulto, only: [:edit_adulto, :update_adulto, :show_adulto]
  before_action :set_formulario, only: [:destroy, :show]

  def show
    # puts @model.content
    send_data @model.pdf.render, filename: 'formulario.pdf', type: 'application/pdf', disposition: 'inline'
  end

  def new_infantil
    @form = AnamneseInfantilFormV2.new
    @model = Formulario.new
  end

  def new_adulto
    @form = AnamneseAdultoFormV2.new
    @model = Formulario.new
  end

  def create_infantil
    @form = AnamneseInfantilFormV2.new
    @form.fill(permitted_params)
    @model = Formulario.new
    @model.kind = "Anamnese Infantil"
    @model.identifier = Formulario::INFANTIL
    @model.content = @form.serialize
    @model.version = @form.version
    @model.patient_id = @patient.id

    if @model.save
      redirect_to patient_formularios_path(@patient), notice: "Anamnese Infantil criada com sucesso."
    else
      render :new_infantil
    end
  end

  def create_adulto
    @form = AnamneseAdultoFormV2.new
    @form.fill(permitted_params)
    @model = Formulario.new
    @model.kind = "Anamnese Adulto"
    @model.identifier = Formulario::ADULTO
    @model.content = @form.serialize
    @model.version = @form.version
    @model.patient_id = @patient.id

    if @model.save
      redirect_to patient_formularios_path(@patient), notice: "Anamnese Adulto criada com sucesso."
    else
      render :new_adulto
    end
  end

  def update_infantil
    @form = AnamneseInfantilFormV2.new
    @form.fill(permitted_params)

    if @model.update({ content: @form.serialize })
      redirect_to patient_formularios_path(@patient), notice: "Anamnese Infantil atualizada com sucesso."
    else
      render :edit_infantil
    end
  end

  def update_adulto
    @form = AnamneseAdultoFormV2.new
    @form.fill(permitted_params)

    if @model.update({ content: @form.serialize, version: @form.version })
      redirect_to patient_formularios_path(@patient), alert: "Anamnese Adulto atualizada com sucesso."
    else
      render :edit_adulto
    end
  end

  def edit_infantil
    if @model.version == '1'
      @form = AnamneseInfantilFormV1.new
      @form.deserialize(@model.content, @model.version)
    elsif @model.version == '2'
      @form = AnamneseInfantilFormV2.new
      @form.deserialize(@model.content, @model.version)
    else
      redirect_to patient_formularios_path(@patient), alert: "Anamnese Infantil se encontra da versão antiga para edição."
    end
  end

  def edit_adulto
    if @model.version == '1'
      @form = AnamneseAdultoFormV1.new
      @form.deserialize(@model.content, @model.version)
    elsif @model.version == '2'
      @form = AnamneseAdultoFormV2.new
      @form.deserialize(@model.content, @model.version)
    else
      redirect_to patient_formularios_path(@patient), notice: "Anamnese Adulto se encontra da versão antiga para edição."
    end
  end

  def index_adulto
    redirect_to anamnese_adulto_new_patient_formularios_path
  end

  def index_infantil
    redirect_to anamnese_infantil_new_patient_formularios_path
  end

  def destroy
    @model.destroy
    redirect_to patient_formularios_path(@patient), notice: "Formulário excluido com sucesso!"
  end

  def index
    @infantis = @patient.formularios.where(identifier: Formulario::INFANTIL).order("id ASC")
    @adultos = @patient.formularios.where(identifier: Formulario::ADULTO).order("id ASC")
    @relatorios = @patient.relatorios.where(patient_id: @patient.id).order("id ASC")
    @laudos = @patient.laudos.where(patient_id: @patient.id).order("id ASC")
    @declaracoes = @patient.declaracoes.where(patient_id: @patient.id).order("id ASC")
    @pareceres = @patient.pareceres.where(patient_id: @patient.id).order("id ASC")
    @atestados = @patient.atestados.where(patient_id: @patient.id).order("id ASC")
  end

  private

  def permitted_params
    params.except(:utf8, :authenticity_token, :commit, :controller, :action).permit!
  end

  def set_patient
    @patient = current_user.patients.find(params[:patient_id])
  end

  def set_formulario_infantil
    @model = current_user.patients.find(@patient.id).formularios.find_by!(id: params[:formulario_id], identifier: Formulario::INFANTIL)
  end

  def set_formulario
    @model = current_user.patients.find(@patient.id).formularios.find(params[:id])
  end

  def set_formulario_adulto
    @model = current_user.patients.find(@patient.id).formularios.find_by!(id: params[:formulario_id], identifier: Formulario::ADULTO)
  end
end
