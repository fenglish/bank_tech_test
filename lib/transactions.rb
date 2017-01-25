# This class should create single transactions and store them

class Transactions

  attr_reader :all, :current_transaction

  def initialize( transaction_klass )
    @current_transaction = transaction_klass
    @all = []
  end

  def create_transaction
    @current_transaction = @current_transaction.new
  end

  def store_data_to_transaction( data )
    @current_transaction.store( data )
  end

end
