class Word < ActiveRecord::Base
  attr_accessible :month_count, :score, :text, :today_count
end
