class UsersController < ApplicationController

    before_action :authenticate_user!, exept: [:index]
    def index
        @user = User.all
    end

end
