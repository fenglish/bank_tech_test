require "transactions"

describe Transactions do

  subject( :transactions ){ described_class.new( transaction ) }
  let( :transaction ){ double :transaction_klass }

  it "should create a instance of Transaction class" do
    allow( transaction ).to receive( :new ).and_return( transaction )
    expect( transactions.create_transaction ).to eq( transactions.current_transaction )
  end

  it "should store passed data to an instance of Transaction class" do
    data = { date: "01/01/2017", credit: 50, debit: "", balance: 50 }
    allow( transaction ).to receive( :store ).and_return( data )
    expect( transactions.store_data_to_transaction( data ) ).to eq( data )
  end

end
