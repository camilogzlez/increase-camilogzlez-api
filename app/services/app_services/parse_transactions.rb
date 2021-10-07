module AppServices

  class ParseTransactions
    require 'faraday'
    ​ 
    response = Faraday.get('https://increase-transactions.herokuapp.com/file.txt') do |req|
      req.headers['Authorization'] = 'Bearer 1234567890qwertyuiopasdfghjklzxcvbnm'
    end
    ​
    lines = response.body.split(/\n/)
    ​
    counter = 0
    results = []
    lines.each do |line|
      results[counter] ||= []
      results[counter] << line
      counter += 1 if line[0] == "4"
    end
    ​
    results.each do |result|
      user = User.find_or_create_by(external_id: result.last[24..55])
      payment_args = {
        user: user,
        external_id: result[0][1..32],
        currency_code: result[0][36..38],
        amount: result[0][39..51],
        discounts_amount: result[0][52..64],
        net_amount: result[0][65..77],
      }
      payment = Payment.create(payment_args)
      transaction_lines = result.select { |line| line[0] == "2" }
      transaction_lines.each do |transaction_line|
        transaction_args = {
          user: user,
          payment: payment,
          external_id: transaction_line[1..32],
          amount: transaction_line[33..45],
          status: transaction_line[51]
        }
        Transaction.create(transaction_args)
      end
      discount_lines = result.select { |line| line[0] == "3" }
      discount_lines.each do |discount_line|
        discount_args = {
          user: user,
          payment: payment,
          external_id: discount_line[1..32],
          amount: discount_line[33..45],
          status: discount_line[49]
        }
        Discount.create(discount_args)
      end
    end

  end
end