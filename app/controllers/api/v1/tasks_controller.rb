class Api::V1::TasksController < ApplicationController
  before_filter :authenticate_user!

  respond_to :json

  def index
    id = current_user.id
    respond_with Task.where('owner_id = ? OR performer_id = ?', id, id)
  end

  def show
    respond_with Task.find(params[:id])
  end

  def create
    if params[:task][:performer].present?
      params[:task][:performer_id] = params[:task][:performer][:id]
      params[:task].delete(:performer)
    end
    p params

    task = Task.new(params[:task])
    task.owner = current_user
    task.state = 'opened'

    if task.save
      render json: task, status: :ok
    else
      render json: task.errors, status: :unprocessable_entity
    end

  end

  def update
    task = Task.find(params[:id])
    params[:task][:created_at] = nil

    if task.update_attributes(params[:task])
      render json: task, status: :ok
    else
      render json: task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    render json: nil, status: :ok
  end

end
