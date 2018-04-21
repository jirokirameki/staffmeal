class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def twitter
        @user = User.from_omniauth(request.env["omniauth.auth"].except("extra"))

        # binding.pry

        if @user.persisted?
            sign_in_and_redirect @user
        else
            session["devise.user_attributes"] = @user.attributes
            redirect_to new_user_registration_url
            # redirect_to root_url
        end
    end
end