class Expense < ApplicationRecord
    belongs_to :employ
    validates :invoice_number,presence: true, on: :create
end
