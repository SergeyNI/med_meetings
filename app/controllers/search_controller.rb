class SearchController < ApplicationController
  def index
    @doctors = Doctor.where('specialty_id > 1')
  end
end
