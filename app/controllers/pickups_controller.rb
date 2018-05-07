class PickupsController < ApplicationController
  before_action :get_category

  private
  def get_category
    @category= params[:controller]
  end
end
