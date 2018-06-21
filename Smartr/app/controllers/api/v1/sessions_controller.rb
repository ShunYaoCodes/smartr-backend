class Api::V1::SessionsController < ApplicationController
  def create
    #byebug
    @user = User.find_by(name: params['name'])
    # if (@user && @user.authenticate(params["password"]))
    #   token = generate_token
    #
    #   render json: {
    #     token: token,
    #     id: @user.id
    #   }
    # else
    #   render json: {
    #     errors: "Those credentials don't match anything we have in our database"
    #   }, status: :unauthorized
    # end
    render json: @user
  end
end
