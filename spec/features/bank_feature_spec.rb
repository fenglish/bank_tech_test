require "bank"

describe Bank do
  let(:bank){ described_class.new }
  # As a bank customer
  # so that I can keep my money at a safe place
  # I want to deposit my money
  it "should keep amount of money when user want to deposit" do
    bank.deposit(50)
    expect(bank.account).to eq 50
  end
end
