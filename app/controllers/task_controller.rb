class TaskController < ApplicationController
  add_flash_types :info, :error, :success
  def index
    @getTime   = Time.now.strftime('%m/%d/%Y');
    @dataTask = Task.where(id: params[:uid]);
  end

  def create
    @createTask = Task.new(uid: params[:uid], title: params[:title], desc: params[:desc], deadline: params[:deadline])
    if @createTask.save
      redirect_to('/dashboard')
      flash[:notice] = "Berhasil membuat Task Baru."
      return

    else
      redirect_to('/dashboard')
      flash[:alert] = "Mohon Periksa lagi"
      return
    end
  end

  def details
    @currentUser = current_user.id
    @task = Task.where(id: params[:id]) and Task.where(uid: @currentUser)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = 'Post was successfully deleted.'
    redirect_to('/dashboard')
    return
  end

  def search
    # @taskSearch = Task.ransack(params[:search])
    # @search = @taskSearch.result(distinct: true)
    @currentUser = current_user.id
    @search = Task.where(uid: @currentUser) and Task.where("title LIKE ? OR deadline LIKE ?", "%" + params[:search] + "%", + params[:search] + "%")
  end
end
