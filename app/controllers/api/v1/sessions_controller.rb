module Api
  module V1
    class SessionsController < Devise::SessionsController
        respond_to :json

        private

        def respond_with(resource, _opts = {})
            render json: { message: 'Login exitoso', user: resource }, status: :ok
        end

        def respond_to_on_destroy
            jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1],
                                Rails.application.credentials.devise[:jwt_secret_key]).first
            current_user = User.find(jwt_payload['sub'])
            if current_user
                render json: { message: "Logout exitoso" }, status: :ok
            else
                render json: { message: "Error en logout" }, status: :unauthorized
            end
        end
    end
  end
end
