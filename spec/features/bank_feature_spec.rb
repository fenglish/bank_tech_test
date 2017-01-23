require "bank"

describe Bank do
  let(:bank){ described_class.new }
  # As a bank customer
  # so that I can keep my money at a safe place
  # I want to deposit my money
  it "should keep the amount of money when user want to deposit" do
    transaction_date = Date.today.strftime("%d/%m/%Y")
    bank.deposite(50)
    expect( bank.account ).to eq({ transaction_date => [50] })
  end

  # As a bank customer
  # so that I can take out my money whenever I want
  # I want to withdraw my money I've deposited
  it "should take out the amount of money when user want to withdraw" do
    bank.deposite(100)
    bank.withdraw(30)
    expect(bank.account).to eq 70
  end

  # As a bank customer
  # so that I can see my money transaction ordered by date
  # I want to see my bank statement
  it "should show the money transaction ordered by date" do
    bank.deposite(100)
    bank.withdraw(30)
    expect(bank.print_bank_statement).to eq ""
  end

end
