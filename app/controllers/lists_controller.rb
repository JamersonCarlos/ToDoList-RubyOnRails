class ListsController < ApplicationController
  before_action :set_list, only: %i[ show edit update destroy ]
  before_action :set_view, only: %i[ index update]

  # GET /lists or /lists.json
  def index
    @list = List.new
    @list_selected = List.new
    @lists = List.all
  end

  # GET /lists/1 or /lists/1.json
  def show
    @list = List.new
    @list_selected = List.find(params[:id])
    @lists = List.all
    @tasks = Task.where(list_id: @list_selected.id)
    @current_filter = params[:filter] || 'all'
    render "lists/index"
  end

  # POST /lists or /lists.json
  def create
    @list = List.new(list_params)
    if List.where(title: list_params['title']) == []
      if @list.save
        flash[:notice] = "List was successfully created."
      else
        flash[:error] = "Title cannot be empty"
      end
    else
      flash[:error] = "There is already a list with that title" 
    end
    redirect_to request.referrer
  end

  # DELETE /lists/1 or /lists/1.json
  def destroy
    @list = List.find_by(id: params[:id])
    if @list
      if @list.destroy!
        flash[:notice] = "List was successfully destroyed."
        redirect_to root_path
      else
        flash[:error] = "Error when deleting list"
        redirect_to request.referrer
      end
    end
   
  end

  
  # PATCH/PUT /lists/1 or /lists/1.json
  def update
    respond_to do |format|
      if list_params[:title].present? && @list.update(list_params) 
        format.html { redirect_to root_path }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { redirect_to request.referrer, notice: "Title is a required attribute"}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find_by(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:list).permit(:title);
    end
end
