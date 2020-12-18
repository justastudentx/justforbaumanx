class LabResult < ApplicationRecord
    validates_uniqueness_of :number
    validates_presence_of :number, :array, :double_array, :count
end
