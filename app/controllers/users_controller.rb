class UsersController < ApplicationController
    before_action :set_user, only: [:show, :subscribe, :unsubscribe]
    
    def index
        @users = User.all
    end

    def show
        
    end

    def subscribe
        
        # @subscribe = Subscribe.new(user: current_user, subscribable: @user.id)
        # @subscribe.save
        # redirect_to user_path(@user)
        @subscribe = current_user.subscribes.build
        @subscribe.subcribable_id = @user.id
        # @subscribe.save
        if @subscribe.save
            redirect_to user_path(@user), notice: 'Вы подписались на него'
        end
    end

    def unsubscribe
        @subscribe = current_user.subscribes.find_by_subcribable_id(@user.id)
        @subscribe.destroy
        redirect_to user_path(@user), notice: 'Вы отписались от него'
    end

    private

    def set_user
        @user = User.find(params[:id])
    end
end
