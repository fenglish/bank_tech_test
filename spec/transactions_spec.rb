require "transactions"

describe Transactions do

  subject( :transactions ){ described_class.new }
  let( :transaction ){ double :transaction_klass }

  before(:each) do
    allow( transaction ).to receive( :new ).and_return( transaction )
  end

  it "should create a instance of Transaction class" do
    expect( transactions.create_transaction( transaction ) ).to eq( transactions.current_transaction )
  end

  it "should store passed data to an instance of Transaction class" do
    transactions.create_transaction( transaction )
    date = "01/01/2017"
    credit = 50
    debit = ""
    balance = 50
    allow( transaction ).to receive( :store ).and_return( [ date, credit, debit, balance ] )
    expect( transactions.store_data_to_transaction( date, credit, debit, balance ) ).to eq( ["01/01/2017", 50, "", 50] )
  end

  it "should store current transaction to all" do
    transactions.create_transaction( transaction )
    transactions.store_current_transaction
    expect( transactions.all[0] ).to eq( transaction )
  end

end
