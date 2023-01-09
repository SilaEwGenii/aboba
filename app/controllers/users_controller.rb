class UsersController < ApplicationController
    before_action :set_user, only: [:show, :subscribe, :unsubscribe]
    before_action :authenticate_user!, exept: [:index, :show]
    
    def index
        @users = User.all
    end

    def show
    end
  
    def subscribe 
      if current_user.id == @user.id
        redirect_to user_path(@user), notice: 'Вы не можете подписаться сами на себя.'
      else
        if current_user.subscribes.exists?(subscribable_id: @user.id)
          redirect_to user_path(@user), notice: 'Вы уже подписаны на данного пользователя.'
        else
          @subscribe = current_user.subscribes.build
          @subscribe.subscribable_id = @user.id
          if @subscribe.save
              redirect_to user_path(@user), notice: 'Вы подписались на этого пользователя.'
          end
        end
      end
    end

    def unsubscribe
      if current_user.id == @user.id
        redirect_to user_path(@user), notice: 'Вы не можете подписаться сами на себя.'
      else
        if current_user.subscribes.exists?(subscribable_id: @user.id)
          @subscribe = current_user.subscribes.find_by_subscribable_id(@user.id)
          @subscribe.destroy
          redirect_to user_path(@user), notice: 'Вы отписались от него'
        else
          redirect_to user_path(@user), notice: 'Вы не были подписаны на данного пользователя.'
        end
      end
    end

    private

    def set_user
        @user = User.find(params[:id])
    end
end
