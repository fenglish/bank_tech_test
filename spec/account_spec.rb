require "account"

describe Account do

  subject(:account){ described_class.new(transaction) }
  let(:transaction){ double :transaction_klass }
  let(:date1){ double :date_klass }
  let(:date2){ double :date_klass }

  before(:each) do
    allow(date1).to receive(:strftime).and_return("01/01/2017")
    allow(date2).to receive(:strftime).and_return("02/01/2017")
    allow(transaction).to receive(:store_transaction)
    allow(transaction).to receive(:record).and_return({ date: "01/01/2017", credit: 50.00, debit: "", balance: 50.00 })
  end

  it { is_expected.to respond_to :deposit }
  it { is_expected.to respond_to :withdraw }
  it { is_expected.to respond_to :print_bank_statement }

  context "#deposite" do
    it "should add the number to the balance" do
      account.deposit( 100, date1 )
      expect( account.balance ).to eq 100
    end
  end

  context "#withdraw" do
    it "should substract the number from the balance" do
      account.deposit( 100, date1 )
      account.withdraw( 50, date2 )
      expect( account.balance ).to eq 50
    end
    it "should raise an error when the passed number is bigger than the number of the account" do
      expect{ account.withdraw( 20, date1 ) }.to raise_error "You cannot withdraw over the amount of money you have deposited."
    end
  end

  context "#print_bank_statement" do
    it "should print 'No transaction' as a default" do
      expect{ account.print_bank_statement }.to output("No transaction\n").to_stdout
    end
    it "should print transaction" do
      account.deposit(100, date1)
      expect{ account.print_bank_statement }.to output("date        || credit      || debit       || balance     \n01/01/2017  || 50.00       ||             || 50.00       \n").to_stdout
    end
  end


end
