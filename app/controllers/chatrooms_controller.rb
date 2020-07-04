class ChatroomsController < ApplicationController
  before_action :authorize_access_request!, only: [:show, :create, :update, :destroy]    
  before_action :set_chatroom, only: [:show, :update, :destroy]

  # GET /chatrooms
  def index
    subquery = Chat.where(chatrooms_id: chatrooms.id).last()
    @chatrooms = Chatroom.select('chatrooms.*, Chat.where(chatroom_id: chatrooms.id).limit(1) AS last_chat')
    render json: @chatrooms
  end

  # GET /chatrooms/1
  def show
    render json: @chatroom
  end

  # POST /chatrooms
  def create
    @chatroom = current_user.chatroom.build(chatroom_params)

    if @chatroom.save
      render json: @chatroom, status: :created, location: @chatroom
    else
      render json: @chatroom.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /chatrooms/1
  def update
    if @chatroom.update(chatroom_params)
      render json: @chatroom
    else
      render json: @chatroom.errors, status: :unprocessable_entity
    end
  end

  # DELETE /chatrooms/1
  def destroy
    @chatroom.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chatroom
      @chatroom = current_user.chatroom.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def chatroom_params
      params.require(:chatroom).permit(:name)
    end
end