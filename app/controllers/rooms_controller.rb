class RoomsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @room = Room.create(user_id: current_user.id)
    @entry1 = Entry.create(:room_id => @room.id, :user_id => current_user.id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(:room_id => @room.id))
    redirect_to "/rooms/#{@room.id}"
  end
end
