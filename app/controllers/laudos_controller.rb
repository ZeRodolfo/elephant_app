class LaudosController < ApplicationController
  before_action :set_patient
  before_action :set_laudo, only: [:show, :edit, :update, :destroy]

  def show
    send_data @laudo.pdf.render, filename: 'laudo.pdf', type: 'application/pdf', disposition: 'inline'
  end

  def new
    @laudo = Laudo.new
    @laudo.grafico = Grafico.new
  end

  def edit
  end

  def index
    redirect_to new_patient_laudo_path
  end

  def create
    @laudo = Laudo.new(laudo_params)
    @laudo.patient_id = @patient.id

    if @laudo.save
      redirect_to patient_formularios_path, notice: 'Laudo criado com sucesso.'
    else
      render :new
    end
  end


  def update
    if @laudo.update(laudo_params)
      redirect_to patient_formularios_path, notice: 'Laudo atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @laudo.destroy
    redirect_to patient_formularios_path, notice: 'Laudo excluido com sucesso'
  end

  private
    def set_laudo
      @laudo = current_user.patients.find(@patient.id).laudos.find(params[:id])
    end

    def set_patient
      @patient = current_user.patients.find(params[:patient_id])
    end

    def laudo_params
      params
        .require(:laudo)
        .permit(
          :analysis,
          :conclusion,
          :crp,
          :description,
          :procedure,
          :references,
          :solicitante,
          :kind,
          grafico_attributes: [:id, :data, :title, :kind, :image]
        )
    end
end
