class Table < ActiveRecord::Base
  belongs_to :repository
  has_many :columns
  has_many :table_words
end
