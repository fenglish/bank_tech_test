require 'date'
require_relative './transactions.rb'
require_relative './bank_statement.rb'

class Account

  attr_reader :balance

  def initialize( transactions_klass_new, transaction_klass, bank_statement_klass_new )
    @balance = 0
    @transactions = transactions_klass_new
    @transaction  = transaction_klass
    @bank_statement = bank_statement_klass_new
  end

  def deposit( credit, date )
    @balance += credit
    pass_data_to_transactions( date, credit, debit = "" )
  end

  def withdraw( debit, date )
    raise "You cannot withdraw over the amount of money you have deposited." if over_withdraw?( debit )
    @balance -= debit
    pass_data_to_transactions( date, credit = "", debit )
  end

  def print_bank_statement
    if no_transactions?
      puts "No transaction"
    else
      @bank_statement.print( @transactions )
    end
  end

  private

  def over_withdraw?( debit )
    balance < debit
  end

  def no_transactions?
    @transactions.all.count == 0
  end

  def pass_data_to_transactions( date, credit, debit )
    @transactions.create_transaction( @transaction )
    @transactions.store_data_to_transaction( date, credit, debit, @balance )
    @transactions.store_current_transaction
  end

end
