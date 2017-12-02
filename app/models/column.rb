class Column < ActiveRecord::Base
  belongs_to :table
  has_many :column_words
end
