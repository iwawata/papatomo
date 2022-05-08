class Admins::CustomersController < ApplicationController
  def index
    @end_users = EndUser.all
  end

  def show
    @end_user = EndUser.find(params[:id])
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    if @end_user.update(customer_params)
      redirect_to admins_customers_path
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:end_user).permit(:nick_name, :email, :is_deleted, :profile_image )
  end
end
