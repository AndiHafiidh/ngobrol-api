class ChatsController < ApplicationController
  before_action :authorize_access_request!    
  before_action :set_chatroom, only: [:show]
  before_action :set_chat, only: [:update, :destroy]

  # GET /chats/1
  def index
    @chats = current_user.chat.all

    render json: @chats
  end

  # GET /chats/1
  def show
    render json: @chat
  end

  # POST /chats
  def create
    @chat = current_user.chat.build(chat_params)

    if @chat.save
      render json: @chat, status: :created, location: @chat
    else
      render json: @chat.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /chats/1
  def update
    if @chat.update(chat_params)
      render json: @chat
    else
      render json: @chat.errors, status: :unprocessable_entity
    end
  end

  # DELETE /chats/1
  def destroy
    @chat.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chatroom
      @chat = current_user.chat.where(chatroom_id: params[:chatroom_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_chat
      @chat = current_user.chat.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def chat_params
      params.require(:chat).permit(:text, :chatroom_id)
    end
end
