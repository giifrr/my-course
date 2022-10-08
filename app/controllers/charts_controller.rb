class ChartsController < ApplicationController
  def users_created
    render json: User.group_by_hour(:created_at).count.chart_json
  end
end