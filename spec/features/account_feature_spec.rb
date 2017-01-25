require "account"
require "transactions"

describe Account, "features" do
  let(:my_account){ Account.new( Transactions.new, Transaction ) }
  # As a bank customer
  # so that I can keep my money at a safe place
  # I want to deposit my money
  it "should keep the amount of money when user want to deposit" do
    transaction_date = Date.today
    my_account.deposit(50, transaction_date)
    expect( my_account.balance ).to eq 50
  end

  # As a bank customer
  # so that I can take out my money whenever I want
  # I want to withdraw my money I've deposited
  it "should take out the amount of money when user want to withdraw" do
    transaction_date = Date.today
    my_account.deposit(100, transaction_date)
    my_account.withdraw(30, transaction_date)
    expect( my_account.balance ).to eq 70
  end

  # As a bank customer
  # so that I can see my money transaction ordered by date
  # I want to see my bank statement
  it "should show the money transaction ordered by date" do
    date1 = Date.new(2012, 1, 10)
    my_account.deposit(1000, date1)

    date2 = Date.new(2012, 1, 13)
    my_account.deposit(2000, date2)

    date3 = Date.new(2012, 1, 14)
    my_account.withdraw(500, date3)

    expect{ my_account.print_bank_statement }.to output("date        || credit      || debit       || balance     \n14/01/2012  ||             || 500.00      || 2500.00     \n13/01/2012  || 2000.00     ||             || 3000.00     \n10/01/2012  || 1000.00     ||             || 1000.00     \n").to_stdout
  end

end
