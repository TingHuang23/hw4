class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user["username"] = params["user"]["username"] #add
    @user["email"] = params["user"]["email"]
    # @user["password"] = params["user"]["password"]
    @user["password"] = BCrypt::Password.create(params["user"]["password"])
    @user.save
    redirect_to "/login"
  end
end

# class UsersController < ApplicationController
#   def new
#     @user = User.new
#   end

#   def create
#     @user = User.new(user_params)
    
#     if @user.save
#       flash[:notice] = "User created successfully. Please log in."
#       redirect_to login_path
#     else
#       flash[:notice] = "Failed to create user."
#       render :new
#     end
#   end

#   private

#   def user_params
#     params.require(:user).permit(:username, :password)
#   end
# end
