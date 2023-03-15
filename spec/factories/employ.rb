FactoryBot.define do
    factory :employ do
        name { 'Suresh' }
        role  { 'Employee' }
        emp_status { 'Permanent' }
        department { 'IT' }
        email {'Suresh@gmail.com'}
        address {'678,Greens corner,Race course road'}
        password {'welcome123'}
    end
  end 