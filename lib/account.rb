require 'date'
require_relative './transaction.rb'

class Account

  attr_reader :balance

  def initialize( transaction_klass_new )
    @balance = 0
    @transaction  = transaction_klass_new
    @transactions = []
  end

  def deposit(money, date)
    @balance += money
    @transaction.store_transaction( date, money, "", @balance )
    @transactions << @transaction.record
  end

  def withdraw(money, date)
    raise "You cannot withdraw over the amount of money you have deposited." if over_withdraw?(money)
    @balance -= money
    @transaction.store_transaction( date, "", money, @balance )
    @transactions << @transaction.record
  end

  def print_bank_statement
    if no_transactions?
      puts "No transaction"
    else
      puts header
      @transactions.reverse_each do |transaction|
        puts set_in_format( transaction[:date], transaction[:credit], transaction[:debit], transaction[:balance] )
      end
    end
  end

  private

  def over_withdraw?(money)
    balance < money
  end

  def no_transactions?
    @transactions.count == 0
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
