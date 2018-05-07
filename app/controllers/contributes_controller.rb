class ContributesController < ApplicationController
  before_action :get_category

  private
  def get_category
    @category= params[:action]
  end
end
