class ContributesController < ApplicationController
  before_action :get_category
  def manga
  end

  def column
  end

  def novel
  end

  def photo
  end

  def music
  end

  def business
  end

  def lifestyle
  end

  def tech
  end

  def entertainment
  end

  def pickup
  end

  def categories
  end

  def hashtag
  end

  def help
  end

  private
    def get_category
      @category= params[:action]
    end
end
