# require "bank"
#
# describe Bank do
#   let(:bank){ described_class.new }
#   # As a bank customer
#   # so that I can keep my money at a safe place
#   # I want to deposit my money
#   it "should keep the amount of money when user want to deposit" do
#     transaction_date = Date.today
#     bank.deposite(50, transaction_date)
#     expect( bank.show_balance ).to eq 50
#   end
#
#   # As a bank customer
#   # so that I can take out my money whenever I want
#   # I want to withdraw my money I've deposited
#   it "should take out the amount of money when user want to withdraw" do
#     transaction_date = Date.today
#     bank.deposite(100, transaction_date)
#     bank.withdraw(30, transaction_date)
#     expect( bank.show_balance ).to eq 70
#   end
#
#   # As a bank customer
#   # so that I can see my money transaction ordered by date
#   # I want to see my bank statement
#   it "should show the money transaction ordered by date" do
#     transaction_date = Date.today
#     bank.deposite(100, transaction_date)
#     bank.withdraw(30, transaction_date)
#     expect{ bank.print_bank_statement }.to output("date        || credit  || debit   || balance\n23/01/2017  ||         || 30.00   || 70.00\n23/01/2017  || 100.00  ||         || 100.00\n").to_stdout
#   end
#
# end
