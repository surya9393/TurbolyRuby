class HomeController < ApplicationController
  add_flash_types :info, :error, :success
  def homepage
  end
  def dashboard
    if user_signed_in?
      @no = 0
      @currentUser = current_user.id
      @getTask = Task.where(uid: @currentUser)
    else
      redirect_to('/')
      flash[:alert] = "Silahkan Login Terlebih Dahulu"
    end
  end
end
