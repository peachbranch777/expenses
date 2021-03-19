class Income < ApplicationRecord
  with_options presence: true do
    validates :price
    validates :category
    validates :memo
    validates :date
  end

  belongs_to :user
end
