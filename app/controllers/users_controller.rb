class UsersController < ApplicationController
	before_action :admin_user,		 only: [:index]

	def index
    @users = User.paginate(page: params[:page])
# Paginate method basically just returns the 30 entries at a time
	end
	
	def show
		@user = User.find(params[:id])
		@comments = @user.comments.paginate(page: params[:page])
	end

	def home
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User destroyed."
		redirect_to users_url
	end

	
private 

	def user_params
		params.require(:user).permit(:name, :email, :password,
																 :password_confirmation)
	end

	def admin_user
		unless current_user.admin?
			redirect_to(root_url)
	 		flash[:danger] = "Only Admin Users may access user list at this time."
		end
	end

# Defining params like this keeps people from passing malicious content
# into your site.
end
