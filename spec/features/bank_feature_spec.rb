require "bank"

describe Bank do
  let(:bank){ described_class.new }
  # As a bank customer
  # so that I can keep my money at a safe place
  # I want to deposit my money
  it "should keep the amount of money when user want to deposit" do
    bank.deposite(50)
    expect(bank.account).to eq 50
  end

  # As a bank customer
  # so that I can take out my money whenever I want
  # I want to withdraw my money I've deposited
  it "should take out the amount of money when user want to withdraw" do
    bank.deposite(100)
    bank.withdraw(30)
    expect(bank.account).to eq 70
  end
end
