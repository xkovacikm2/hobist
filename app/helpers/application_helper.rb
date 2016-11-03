module ApplicationHelper
  def redirect_unauthorized
    flash[:danger] = 'Unauthorized access - permission denied'
    redirect_to root_path
  end

  #verifies if logged in user is user provided in argument
  #arguments accepted are: User class instance or user id
  def current_user? (user)
    if current_user
      return (current_user.id == user.id) if user.class == User
      return (current_user.id == user) if user.class == Fixnum
    end
    false
  end

end
