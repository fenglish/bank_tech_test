require "bank"

describe Bank do

  let(:bank){ described_class.new }
  let(:date1){ double :date_klass }
  let(:date2){ double :date_klass }

  before(:each) do
    allow(date1).to receive(:strftime).and_return("01/01/2017")
    allow(date2).to receive(:strftime).and_return("02/01/2017")
  end

  it { is_expected.to respond_to :deposite }
  it { is_expected.to respond_to :withdraw }
  it { is_expected.to respond_to :print_bank_statement }

  context "#deposite" do
    it "should stored the date and the number" do
      bank.deposite(50, date1)
      expect( bank.transaction ).to eq({ "01/01/2017" => [50] })
      bank.deposite(30, date2)
      expect( bank.transaction ).to eq({ "01/01/2017" => [50], "02/01/2017" => [30] })
    end
    it "should stored just the number when the date is already exist" do
      bank.deposite(50, date1)
      bank.deposite(30, date1)
      expect( bank.transaction ).to eq({ "01/01/2017" => [50,30] })
    end
  end

  context "#withdraw" do
    it "should stored the date and the minus number" do
      bank.deposite(100, date1)
      bank.withdraw(30, date1)
      expect( bank.transaction ).to eq({ "01/01/2017" => [100,-30] })
      bank.withdraw(20, date2)
      expect( bank.transaction ).to eq({ "01/01/2017" => [100,-30], "02/01/2017" => [-20] })
    end
    it "should raise an error when the passed number is bigger than the number of the account" do
      expect{ bank.withdraw(20, date1) }.to raise_error "You cannot withdraw over the amount of money you have deposited."
    end
  end

  context "#print_bank_statement" do
    it "should print 'No transaction' as a default" do
      expect{ bank.print_bank_statement }.to output("No transaction\n").to_stdout
    end
    it "should print transaction" do
      bank.deposite(100, date1)
      bank.withdraw(20, date2)
      expect( bank.transaction ).to eq({ "01/01/2017" => [100], "02/01/2017" => [-20] })
      expect{ bank.print_bank_statement }.to output("date        || credit  || debit   || balance\n02/01/2017  ||         || 20.00   || 80.00\n01/01/2017  || 100.00  ||         || 100.00\n").to_stdout
    end
  end


end
