require "transactions"

describe Transactions do

  subject( :transactions ){ described_class.new }

  it "should create a instance of Transaction class" do
    expect( transactions.create_transaction ).to be_an_instance_of( Transaction )
  end

end
