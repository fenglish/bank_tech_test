require 'bank_statement'

describe BankStatement do

  subject(:bank_statement){ described_class.new }
  let(:transactions){ double :transactions }
  let(:transaction ){ double :transaction }

  context "#print" do
    it "should print transaction" do
      allow(transactions).to receive(:all).and_return([transaction])
      allow(transaction).to receive(:record).and_return({ date: "01/01/2017", credit: 50.00, debit: "", balance: 50.00 })
      expect{ bank_statement.print( transactions ) }.to output("date        || credit      || debit       || balance     \n01/01/2017  || 50.00       ||             || 50.00       \n").to_stdout
    end
  end

end
