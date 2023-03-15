require 'rails_helper'
RSpec.describe Employ,type: :model do
  subject {Employ.new(name: "Raghitha",role: "employee" ,emp_status: "Permanent",department: "IT",
      email: "Raghitha@gmail.com",address: "870,R.C ROAD,Bengaluru",password: "welcome123")}
  
      before {subject.save}
      it 'Employ email should be present' do
        byebug
          Employ.email = nil
          expect(subject).to_not be_valid
      end

      before {subject.save}
      it 'Employ password should be present' do
          Employ.password = nil
          expect(subject).to_not be_valid
      end

      it 'password should not be too short' do
            Employ.password = 'w'
            expect(employ).to_not be_valid
            end




  # let(:employ) { build(:employ) }
  # employ = build(:employ,name: "Raghitha",role: "employee" ,emp_status: "Permanent",department: "IT",
  #   email: "Raghitha@gmail.com",address: "870,R.C ROAD,Bengaluru",password: "welcome123")

  #   it 'email should be present' do
  #     employ.email = nil
  #       expect(email).to_not be_valid
  #   end

  #   it 'email should be of this format' do
  #     employ.email.match?(EMAIL_REGEXP)
  #     expect(email).to be_valid
  # end

  #   it "has a unique email" do
#   employ1 = create(:employ, email: "Remya@email.com")
#   employ2 = build(:employ, email: "Remya@email.com")
#   expect(employ2).to_not be_valid
# end

  #   it 'password should not be too short' do
  #     employ.password = 'w'
  #       expect(employ).to_not be_valid
  #     end

  #     it 'password should be present' do
  #       employ.password = nil
  #       expect(password).to_not be_valid
  #   end
  #   it 'password is present' do
  #     employ.password = "welcome1234"
  #     expect(password).to be_valid
  # end

      

end