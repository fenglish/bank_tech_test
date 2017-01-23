require "bank"

describe Bank do

  let(:bank){ described_class.new }
  let(:date1){ Date }

  it { is_expected.to respond_to :deposite }
  it { is_expected.to respond_to :withdraw }
  it { is_expected.to respond_to :print_bank_statement }

  context "#deposite" do
    it "should stored the date and the number" do
      allow(Date).to receive_message_chain(:today,:strftime).and_return("01/01/2017")
      bank.deposite(50)
      expect( bank.transaction ).to eq({ "01/01/2017" => [50] })
    end
    it "should stored just the number when the date is already exist" do
      allow(Date).to receive_message_chain(:today,:strftime).and_return("01/01/2017")
      bank.deposite(50)
      bank.deposite(30)
      expect( bank.transaction ).to eq({ "01/01/2017" => [30,50] })
    end
  end

  context "#withdraw" do
    it "should stored the date and the minus number" do
      allow(Date).to receive_message_chain(:today,:strftime).and_return("01/01/2017")
      bank.deposite(100)
      bank.withdraw(30)
      expect( bank.transaction ).to eq({ "01/01/2017" => [-30,100] })
    end
    it "should raise an error when the passed number is bigger than the number of the account" do
      expect{ bank.withdraw(20) }.to raise_error "You cannot withdraw over the amount of money you have deposited."
    end
  end

  context "#print_bank_statement" do
    it "should print 'No transaction' as a default" do
      expect{ bank.print_bank_statement }.to output("No transaction\n").to_stdout
    end
  end


end
