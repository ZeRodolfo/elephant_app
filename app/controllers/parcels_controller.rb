class ParcelsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_parcel, only: [:edit, :update, :destroy]
  before_action :set_office_visit, only: [:index, :create]


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

  private

    def set_office_visit
      @office_visit = OfficeVisit.find(params[:office])
    end

    def set_parcel
      @parcel = Parcel.find(params[:id])
    end


    def parcel_params
      params.require(:parcel).permit(:value, :observation)
    end
end
