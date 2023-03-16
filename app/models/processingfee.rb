class Processingfee < ApplicationRecord
    validates :amount,  presence: true
    def calculate(amount)
        amount = (amount/100)*2.5
    end
end
