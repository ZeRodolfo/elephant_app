class RelatoriosController < ApplicationController
  before_action :set_patient
  before_action :set_relatorio, only: [:show, :edit, :update, :destroy]

  def show
    render :edit
  end

  def new
    @relatorio = Relatorio.new
  end

  def edit
  end

  def index
    redirect_to new_patient_relatorio_path
  end

  def create
    @relatorio = Relatorio.new(relatorio_params)
    @relatorio.patient_id = @patient.id

    if @relatorio.save
      redirect_to patient_formularios_path, notice: 'Relatório criado com sucesso.'
    else
      render :new
    end
  end


  def update
    if @relatorio.update(relatorio_params)
      redirect_to patient_formularios_path, notice: 'Relatório atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @relatorio.destroy
    redirect_to patient_formularios_path, notice: 'Relatório excluido com sucesso'
  end

  private
    def set_relatorio
      @relatorio = current_user.patients.find(@patient.id).relatorios.find(params[:id])
    end

    def set_patient
      @patient = current_user.patients.find(params[:patient_id])
    end

    def relatorio_params
      params.require(:relatorio).permit(:analysis, :atendido, :conclusion, :crp, :description, :goal, :procedure, :solicitante, :kind)
    end
end
