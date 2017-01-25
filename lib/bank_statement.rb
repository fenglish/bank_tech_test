class BankStatement

  def print( transactions )
    puts header
    transactions.all.reverse_each do |transaction|
      transaction = transaction.record
      puts set_in_format( transaction[:date], transaction[:credit], transaction[:debit], transaction[:balance] )
    end
  end

  private

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
