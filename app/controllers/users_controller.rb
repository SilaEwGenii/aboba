class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def show 
        @user = User.find(params[:id]) #выводит выбранный элемент и показывает его

    end

    def create
        @user = User.new(users_params)         #создание аккаунтов
        if @user.save                              # если аккаунт создаётся переводит на страницу нового акканта 
            redirect_to @user                   # если аккаунт создаётся переводит на страницу нового акканта 
        else                                      # если нет то возвращает на страницу создания аккаунтов
            render 'new'# если нет то возвращает на страницу создания аккаунтов
        end# если нет то возвращает на страницу создания аккаунтов
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user= User.find(params[:id])                    #редактирование аккаунтов       
        if @user.update(users_params)            # если аккаунт редактируется переводит на страницу отредактированного акканта 
            redirect_to @user# если аккаунт редактируется переводит на страницу отредактированного акканта 
        else
            render 'edit'                                 #если нет по возвращает на страницу редактирования аккаунтов
        end
    end



    def destroy
        @user = User.find(params[:id])  #выбирает по айди
        @user.destroy        #Удаляет строку из таблицы 
        redirect_to users_path    # возвращает на страницу аккаунтов
    end

    private 
  def users_params
    params.require(:user).permit(:name, :email)
  end

end
