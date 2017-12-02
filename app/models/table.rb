class Table < ActiveRecord::Base
  belongs_to :repository
  has_many :columns
end
