class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController

  private

    def sign_up_params
      params.permit(:name,:hobby,:email,:password,:password_confimation)
    end
end
