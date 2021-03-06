require "account"

describe Account do

  subject(:account){ described_class.new( transactions, transaction, bank_statement ) }
  let(:transactions){ double :transactions_klass }
  let(:transaction ){ double :transaction_klass }
  let(:bank_statement){ double :bank_statement_klass }
  let(:date1){ double :date_klass }
  let(:date2){ double :date_klass }

  before(:each) do
    allow(date1).to receive(:strftime).and_return("01/01/2017")
    allow(date2).to receive(:strftime).and_return("02/01/2017")
    allow(transactions).to receive(:create_transaction)
    allow(transactions).to receive(:store_data_to_transaction)
    allow(transactions).to receive(:store_current_transaction)
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
      allow(transactions).to receive(:all).and_return([])
      expect{ account.print_bank_statement }.to output("No transaction\n").to_stdout
    end
    it "should print transactions" do
      allow(transactions).to receive(:all).and_return([{ date: "01/01/2017", credit: 50.00, debit: "", balance: 50.00 }])
      allow(bank_statement).to receive(:print).and_return({ date: "01/01/2017", credit: 50.00, debit: "", balance: 50.00 })
      expect( account.print_bank_statement ).to eq({ date: "01/01/2017", credit: 50.00, debit: "", balance: 50.00 })
    end
  end


end
