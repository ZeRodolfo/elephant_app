class ParcelsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_parcel, only: [:edit, :update, :destroy]
  before_action :set_office_visit, only: [:index, :create]
  before_action :set_patient, only: [:low_all]


  def index
    @parcels = @office_visit.parcels

    @parcel = Parcel.new
  end

  def create
    @parcel = Parcel.new(parcel_params)
    @parcel.office_visit = @office_visit

    if @parcel.save
      redirect_to request.referrer, notice: 'Parcela criada com sucesso!'
    else
      redirect_to request.referrer, alert: 'Erro ao salvar parcela.'
    end
  end


  def destroy
    @parcel.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: 'Parcela excluída com sucesso!' }
      format.json { head :no_content }
    end
  end

  def low_all
    @patient.office_visits.each do |office_visit|
      total_value = office_visit.get_total_value_of_parcels

      if !office_visit.value.nil?
        if total_value < office_visit.value
          diff_value = office_visit.value - total_value
          
          parcel = Parcel.new
          parcel.value = diff_value
          parcel.observation = 'Baixado a diferença de valores que se encontrava em aberto.'
          parcel.office_visit = office_visit

          if !current_user.user_preference.nil?
            if current_user.user_preference.data_atual
              parcel.created_at =  office_visit.date.strftime("%Y-%m-%d") # rever essa data na hr que for gerar o relatorio em finanças
            end
          end

          parcel.save
        end
      end
    end

    redirect_to request.referrer, notice: 'Baixas realizadas com sucesso!'
  end

  private

    def set_office_visit
      @office_visit = OfficeVisit.find(params[:office])
    end

    def set_parcel
      @parcel = Parcel.find(params[:id])
    end

    def set_patient
      @patient = Patient.find(params[:patient_id])
    end

    def parcel_params
      params.require(:parcel).permit(:value, :observation)
    end
end
