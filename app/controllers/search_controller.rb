class SearchController < ApplicationController
  
  def index
    @doctors = Doctor.where('specialty_id > 1')
    @doctors = @doctors.where(specialty_id: search_params[:specialty_id]) if search_params[:specialty_id]
  end

    
  private

    def search_params
      params.permit(:specialty_id)
    end
end
