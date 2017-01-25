# This class should create single transactions and store them

require_relative './transaction.rb'

class Transactions

  attr_reader :all, :current_transaction

  def initialize
    @current_transaction = nil
    @all = []
  end

  def create_transaction( transaction_klass )
    @current_transaction = transaction_klass.new
  end

  def store_data_to_transaction( date, credit, debit, balance )
    @current_transaction.store( date, credit, debit, balance )
  end

  def store_current_transaction
    @all << @current_transaction
  end

end
