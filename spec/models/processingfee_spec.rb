require 'rails_helper'

RSpec.describe Processingfee, type: :model do
  it "calculates the processed fees" do
    pf = Processingfee.new(amount: 5000)
    expect(pf.calculate(5000)).to eq(125)
end
describe "Validations" do
  it { should validate_presence_of(:amount) }
end
# context "wrong calculation"

end
