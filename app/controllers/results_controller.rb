# app/controllers/results_controller.rb
class ResultsController < ApplicationController
  def index
    @search_results = Apprentice.search_everywhere(params[:query])
  end
end
