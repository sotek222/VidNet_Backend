class Api::V1::InboxesController < ApplicationController
  skip_before_action :authorized, only: [:index]

  def index
    inboxes = Inbox.all

    render json: inboxes
  end
end
