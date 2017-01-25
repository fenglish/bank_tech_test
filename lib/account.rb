require 'date'
require_relative './transactions.rb'

class Account

  attr_reader :balance

  def initialize( transactions_klass_new, transaction_klass )
    @balance = 0
    @transactions = transactions_klass_new
    @transaction  = transaction_klass
  end

  def deposit(money, date)
    @balance += money
    @transactions.create_transaction( @transaction )
    @transactions.store_data_to_transaction( date, money, "", @balance )
    @transactions.store_current_transaction
  end

  def withdraw(money, date)
    raise "You cannot withdraw over the amount of money you have deposited." if over_withdraw?(money)
    @balance -= money
    @transactions.create_transaction( @transaction )
    @transactions.store_data_to_transaction( date, "", money, @balance )
    @transactions.store_current_transaction
  end

  def print_bank_statement
    if no_transactions?
      puts "No transaction"
    else
      puts header
      @transactions.all.reverse_each do |transaction|
        transaction = transaction.record
        puts set_in_format( transaction[:date], transaction[:credit], transaction[:debit], transaction[:balance] )
      end
    end
  end

  private

  def over_withdraw?(money)
    balance < money
  end

  def no_transactions?
    @transactions.all.count == 0
  end

  def header
    set_in_format("date", "credit", "debit", "balance")
  end


  def set_in_format(date, credit, debit, balance)
    if credit != "credit"
      # change into float 100 => 100.00
      credit  = sprintf('%.2f', credit) if credit != ""
      debit   = sprintf('%.2f', debit)  if debit  != ""
      balance = sprintf('%.2f', balance)
    end
    set_indent(date) + "|| " + set_indent(credit) + "|| " + set_indent(debit) + "|| " + set_indent(balance.to_s)
  end

  def set_indent(target)
    target.ljust(12," ")
  end
end
