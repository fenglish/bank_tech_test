class Transaction

  attr_reader :record

  def initialize
    @record = {}
  end

  def store_transaction( date, credit, debit, balance )
    transaction_date = date.strftime("%d/%m/%Y")
    @record = { date: transaction_date, credit: credit, debit: debit, balance: balance }
  end

end
