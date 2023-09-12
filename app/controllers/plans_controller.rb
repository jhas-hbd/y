class PlansController < ApplicationController
  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.user_id = current_user.id
    @plan.save
    redirect_to plans_path(@plan)
  end

  def index
    @plans = Plan.all
  end

  private

  def plan_params
    params.require(:plan).permit(:title, :prefecture, :stay_days, :budget, :main_vehicle, :impression, :plan_image)
  end
end
