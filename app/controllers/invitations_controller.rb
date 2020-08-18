class InvitationsController < ApplicationController
  def new
    @invitation = current_user.created_invitations.build
  end

  def create
    @invitation = current_user.created_invitations.build(invitation_params)

    if current_user.created_events.pluck(:id).include?(@invitation.event_id) && @invitation.save
      redirect_to invitation_path(@invitation)
    else
      render :new
    end
  end

  def show
    @invitation = Invitation.find(params[:id])
  end

  def accept
    @invitation = Invitation.find(params[:id])
    @user = @invitation.recipient
    @event = @invitation.event

    @user.attended_events << @event

    redirect_to event_path(@event)
  end

  private
    def invitation_params
      params.require(:invitation).permit(:recipient_id, :event_id)
    end
end

