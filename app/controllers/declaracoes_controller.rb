class DeclaracoesController < ApplicationController
  before_action :set_patient
  before_action :set_declaracao, only: [:show, :edit, :update, :destroy]

  def show
    render :edit
  end

  def new
    @declaracao = Declaracao.new
  end

  def edit
  end

  def index
    redirect_to new_patient_declaracao_path
  end

  def create
    @declaracao = Declaracao.new(declaracao_params)
    @declaracao.patient_id = @patient.id

    if @declaracao.save
      redirect_to patient_formularios_path, notice: 'Declaração criada com sucesso.'
    else
      render :new
    end
  end


  def update
    if @declaracao.update(declaracao_params)
      redirect_to patient_formularios_path, notice: 'Declaração atualizada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @declaracao.destroy
    redirect_to patient_formularios_path, notice: 'Declaração excluida com sucesso'
  end

  private
    def set_declaracao
      @declaracao = current_user.patients.find(@patient.id).declaracoes.find(params[:id])
    end

    def set_patient
      @patient = current_user.patients.find(params[:patient_id])
    end

    def declaracao_params
      params.require(:declaracao).permit(:city, :crp, :text)
    end
end
