# This class should store single transaction record

class Transaction

  attr_reader :record

  def initialize
    @record = {}
  end

  def store( date, credit, debit, balance )
    transaction_date = date.strftime("%d/%m/%Y")
    @record = { date: transaction_date, credit: credit, debit: debit, balance: balance }
  end

end
