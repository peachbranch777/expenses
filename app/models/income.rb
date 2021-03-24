class Income < ApplicationRecord
  with_options presence: true do
    validates :price, inclusion: { in: 1..100000000 }, format: {with: /\A[0-9]+\z/}, numericality: true 
    validates :category
    validates :memo
    validates :date
  end

  def start_time
    self.date
  end

  def self.chart_date
    order(result_date: :asc).pluck('result_date', 'result').to_h
  end



  belongs_to :user
end
