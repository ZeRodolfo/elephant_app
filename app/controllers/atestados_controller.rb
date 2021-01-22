class AtestadosController < ApplicationController
  before_action :set_patient
  before_action :set_atestado, only: [:show, :edit, :update, :destroy]

  def show
    render :edit
  end

  def new
    @atestado = Atestado.new
  end

  def edit
  end

  def index
    redirect_to new_patient_atestado_path
  end

  def create
    @atestado = Atestado.new(atestado_params)
    @atestado.patient_id = @patient.id

    if @atestado.save
      redirect_to patient_formularios_path, notice: 'Atestado criado com sucesso.'
    else
      render :new
    end
  end


  def update
    if @atestado.update(atestado_params)
      redirect_to patient_formularios_path, notice: 'Atestado atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @atestado.destroy
    redirect_to patient_formularios_path, notice: 'Atestado excluido com sucesso'
  end

  private
    def set_atestado
      @atestado = current_user.patients.find(@patient.id).atestados.find(params[:id])
    end

    def set_patient
      @patient = current_user.patients.find(params[:patient_id])
    end

    def atestado_params
      params.require(:atestado).permit(:cidade, :crp, :text)
    end
end
