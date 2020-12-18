class BaseController < ApplicationController
  def index
    @result = LabResult.all
  end

  def create
    @number = params[:number].to_i
    @result = LabResult.all
    @is_a_new_element = true
    if result = LabResult.find_by_number(@number)
      @double_array = result.double_array
      @is_a_new_element = false
      @count = result.count
      @array = result.array
    else
      @array = @number.times.select { |x| (x**2).to_s == (x**2).to_s.reverse }
      @double_array = @array.map { |x| x**2 }.join(' ')
      @count = @array.length
      @array = @array.join(' ')
      if @count > 0
        result = LabResult.create(:number => @number, :array => @array, :double_array => @double_array, :count => @count)
        result.save
      else
        result = LabResult.create(:number => @number, :array => "Нет чисел <= #{@number}", :double_array => "Нет чисел <= #{@number}", :count => @count)
        result.save
      end
    end
  end

  def results
    @result = LabResult.all
    render xml: @result
  end
end
