class PostsController < ApplicationController

    def index
        @post = Post.all
    end
     
    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post= Post.find(params[:id])                    #редактирование аккаунтов       
        if @post.update(postss_params)            # если аккаунт редактируется переводит на страницу отредактированного акканта 
            redirect_to @post# если аккаунт редактируется переводит на страницу отредактированного акканта 
        else
            render 'edit'                                 #если нет по возвращает на страницу редактирования аккаунтов
        end

    end

    def create 
        @post = Post.new(posts_params)         #создание post
        if @post.save                              # если аккаунт создаётся переводит на страницу нового акканта 
            redirect_to @post                   # если аккаунт создаётся переводит на страницу нового акканта 
        else                                      # если нет то возвращает на страницу создания аккаунтов
            render 'new'# если нет то возвращает на страницу создания аккаунтов
        end
    end

    def destroy
        @post = Post.find(params[:id])  #выбирает по айди
        @post.destroy        #Удаляет строку из таблицы 
        redirect_to posts_path    # возвращает на страницу аккаунтов
    end




    private 

    def posts_params
        params.require(:post).permit(:title, :text, :user_id)
    end




end
