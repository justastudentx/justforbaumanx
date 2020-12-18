class BaseController < ApplicationController
  def index; end

  def create
    @number = params[:number].to_i
    @array = @number.times.select { |x| (x**2).to_s == (x**2).to_s.reverse }
    @double_array = @array.map { |x| x**2 }.join(' ')
    @count = @array.length
    @array = @array.join(' ')
  end
end
