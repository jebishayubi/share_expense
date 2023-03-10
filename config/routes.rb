Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root 'pages#home'
  # Employee View
  # Signup Page
  post "/emp/signup" => "employ#create"
  # Signin Page
  post "/user/signin"  => "login#create"
  # Add Expense
  post "/employexp/addexpense"  => "expense#create" 
  # View Expense
  get "/expense/myexpense" => "expense#myexpense"
  # View Report
  get "/expense/expensereport" => "expense#expensereport"
  # Delete Expense
  delete "/expense/deleteexpense" => "expense#destroyexpense"
  # Reply on Expense
  put "/expense/reply" => "expense#reply"

  # Add comment
  post "/emp/comment" => "expense#addcomment"
  # View comment
  get "/emp/viewcomment" => "expense#viewcomment"

  # View Single Employee by id
  get "/employee/empbyid" => "employ#show"


# Admin View
# Change employ to admin
put "/emp/changerole" => "employ#update"
# Approve/reject expense
put "/expense/statusapproval" => "expense#approval"
# comment on Expense
put "/expense/admincomment" => "expense#admincomment"
# Delete the expense
delete "/expense/deletebyadmin" => "expense#admindelete"
# View all the employees
get "/emp/allemployee" => "employ#index"
# View Permanent Employees
get "/employee/permanent" => "employ#displaypermanent" 

# Delete the employee
delete "/emp/admindelete" => "employ#admindelete"
# Logout
get "employee/logout"  => "logout#index"
# View expense by employeeid
get "employee/expensebyid/" => "expense#show"
# Validating the invoice
get "employee/invoicevalidate" => "expense#invoicevalidation"
post "employee/invoice" => "expense#invoicevalidationcheck"



get "employee/check" => "login#showe"

end
