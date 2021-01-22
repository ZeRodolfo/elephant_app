class PareceresController < ApplicationController
  before_action :set_patient
  before_action :set_parecer, only: [:show, :edit, :update, :destroy]

  def show
    send_data @parecer.pdf.render, filename: 'parecer.pdf', type: 'application/pdf', disposition: 'inline'
  end

  def new
    @parecer = Parecer.new
  end

  def edit
  end

  def index
    redirect_to new_patient_parecer_path
  end

  def create
    @parecer = Parecer.new(parecer_params)
    @parecer.patient_id = @patient.id

    if @parecer.save
      redirect_to patient_formularios_path, notice: 'Parecer criado com sucesso.'
    else
      render :new
    end
  end


  def update
    byebug
    if @parecer.update(parecer_params)
      redirect_to patient_formularios_path, notice: 'Parecer atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @parecer.destroy
    redirect_to patient_formularios_path, notice: 'Parecer excluido com sucesso'
  end

  private
    def set_parecer
      @parecer = current_user.patients.find(@patient.id).pareceres.find(params[:id])
    end

    def set_patient
      @patient = current_user.patients.find(params[:patient_id])
    end

    def parecer_params
      params.require(:parecer).permit(:analysis, :conclusion, :crp, :description, :references)
    end
end
