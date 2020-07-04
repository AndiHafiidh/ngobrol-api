class ChatroomMapsController < ApplicationController
  before_action :authorize_access_request!    
  before_action :set_chatroom_map, only: [:destroy]

  # # GET /chatroom_maps
  # def index
  #   @chatroom_maps = current_user.chatroom_maps.all

  #   render json: @chatroom_maps
  # end

  # # GET /chatroom_maps/1
  # def show
  #   render json: @chatroom_map
  # end

  # POST /chatroom_maps
  def create
    @chatroom_map = current_user.chatroom_maps.build(chatroom_map_params)

    if @chatroom_map.save
      render json: @chatroom_map, status: :created, location: @chatroom_map
    else
      render json: @chatroom_map.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /chatroom_maps/1
  # def update
  #   if @chatroom_map.update(chatroom_map_params)
  #     render json: @chatroom_map
  #   else
  #     render json: @chatroom_map.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /chatroom_maps/1
  def destroy
    @chatroom_map.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chatroom_map
      @chatroom_map = current_user.chatroom_maps.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def chatroom_map_params
      params.require(:chatroom_map).permit(:chatroom_id)
    end
end