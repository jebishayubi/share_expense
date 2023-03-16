RSpec.describe Employ,type: :model do

  subject {Employ.new(name: "Raghitha",role: "employee" ,emp_status: "Permanent",department: "IT",
  email: "Raghitha@gmail.com",address: "870,R.C ROAD,Bengaluru",password: "welcome123")}
    before {subject.save}
  describe "Validations" do
    byebug
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password)}
    it { should validate_uniqueness_of(:email) }
  end
end






  # subject {Employ.new(name: "Raghitha",role: "employee" ,emp_status: "Permanent",department: "IT",
  #     email: "Raghitha@gmail.com",address: "870,R.C ROAD,Bengaluru",password: "welcome123")}
  
  #     before {subject.save}
  #     it 'Employ email should be present' do
        
  #       subject.email = nil
  #       subject.save
  #       expect(subject).to_not be_valid
  #     end

  #     before {subject.save}
  #     it 'Employ password should be present' do
  #       subject.password = nil
  #         expect(subject).to_not be_valid
  #     end

  #     it 'password should not be too short' do
  #       subject.password = 'w'
  #           expect(employ).to_not be_valid
  #           end






      

# end