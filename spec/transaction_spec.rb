require "transaction"

describe Transaction do

  subject( :transaction ){ described_class.new }
  let( :date ){ double :date_klass }

  before( :each ) do
    allow( date ).to receive( :strftime ).and_return( "01/01/2017" )
  end

  it "should stored the date, the number and the balance" do
    transaction.store_transaction( date, 50, "", 50 )
    expect( transaction.record ).to eq({ date: "01/01/2017", credit: 50, debit: "", balance: 50 })
  end

end
