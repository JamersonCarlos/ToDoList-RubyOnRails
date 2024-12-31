class ListsController < ApplicationController
  before_action :set_list, only: %i[ show edit update destroy ]

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
    if list_params[:title].present? && @list.update(list_params) 
      flash[:notice] = "List updated successfully"     
    else
      flash[:error] = "Title is a required attribute"
    end
    redirect_to request.referrer
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:list).permit(:title);
    end
end
 