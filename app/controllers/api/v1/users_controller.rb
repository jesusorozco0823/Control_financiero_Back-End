module Api
    module V1
        class Api::V1::UsersController < ApplicationController
            before_action :authenticate_user!

            def profile
                render json: current_user, status: :ok
            end
        end
    end
end
