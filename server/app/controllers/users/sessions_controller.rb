# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    # POST /users/sign_in
    def create
      self.resource = warden.authenticate!(auth_options)
      sign_in(resource_name, resource)
      render json: { user: current_user.as_json, errors: {} },
             status: 200
    end

    # DELETE /users/sign_out
    def destroy
      sign_out(resource_name)
      render json: { errors: {} }, status: 200
    end

    private

    def respond_to_on_destroy
      render json: { errors: 'You need to sign in or sign up before continuing.' }, status: 401
    end
  end
end