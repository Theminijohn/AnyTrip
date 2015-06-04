class RegistrationsController < Devise::RegistrationsController

  def create
    if Whitelist.exists?(email: params[:user][:email])
			super
		else
			flash['error'] = "This email isn't approved for Registration"
			redirect_to :back
			return false
		end
  end

end