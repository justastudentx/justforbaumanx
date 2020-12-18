class UserInteractionController < ApplicationController
  skip_before_action :require_login, only: [:login, :auth, :register, :create_new_user]

  def login
    @error = (params[:error] == nil) ? '' : params[:error]
  end

  def logout
    @user.session_id = "0"
    @user.save
    redirect_to "/login"
  end

  def auth
    name = params[:name]
    password = Digest::SHA1.hexdigest params[:password]
    
    error = ""
    if user = User.find_by_name(name)
      unless user.password == password
        error = "Введен неверный пароль"
      else 
        user.session_id = session[:session_id]
        user.save
      end
    else
      error = 'Пользователь не найден'
    end
    
    if error == ""
      redirect_to "/"
      return
    else
      redirect_to :action => "login", :error => error
      return
    end
    
  end

  def register
    @error = (params[:error] == nil) ? '' : params[:error]
  end

  def create_new_user
    name = params[:name]
    email = params[:email]
    password = params[:password]
    another_password = params[:another_password]
    
    if password != another_password
      redirect_to :action => "register", :error => 'Введенные пароли не совпадают'
      return
    end
        
    error = ""
    if user = User.find_by_name(name)
      error = 'Пользователь с таким именем уже существует'
    end
    
    if user = User.find_by_email(email)
      error = 'Пользователь с такой почтой уже существует'
    end
        
    unless error == ''
      redirect_to :action => "register", :error => error
      return
    end
    
    password = Digest::SHA1.hexdigest password
    @user = User.new(name: name, email: email, password: password, session_id: session[:session_id])
    unless @user.valid?
      redirect_to :action => "register", :error => 'Проверьте правильность введенных данных'
      return
    end
    @user.save
    
    redirect_to "/"
  end

  def users
    @users = User.all
    render xml: @users
  end
end
