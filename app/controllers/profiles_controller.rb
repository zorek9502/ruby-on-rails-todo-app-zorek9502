class ProfilesController < ApplicationController
  before_action :require_login, except: [:index]

  def create
  end

  def destroy
  end

  def edit
  end

  def index
  end

  def new
  end

  def show
  end

  def update
  end

  def require_login
    unless user_signed_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to profile_index_path
    end
  end
end
