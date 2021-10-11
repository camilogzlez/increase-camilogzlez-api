# frozen_string_literal: true

module AppServices
  class ParseTransaction
    require 'faraday'
    def parse_txt
      response = Faraday.get('https://increase-transactions.herokuapp.com/file.txt') do |req|
        req.headers['Authorization'] = 'Bearer 1234567890qwertyuiopasdfghjklzxcvbnm'
      end

      lines = response.body.split(/\n/)
      counter = 0
      results = []
      lines.each do |line|
        results[counter] ||= []
        results[counter] << line
        counter += 1 if line[0] == '4'
      end

      results.each do |result|
        client = Client.find_or_create_by(external_id: result.last[24..55])
        payment_args = {
          client: client,
          external_id: result[0][1..32],
          currency: result[0][36..38],
          amount: result[0][39..51],
          total_discounts: result[0][52..64],
          net_amount: result[0][65..77],
          payment_date: result.last[16..23]
        }
        payment = Payment.create(payment_args)

        transaction_lines = result.select { |line| line[0] == '2' }
        transaction_lines.each do |transaction_line|
          transaction_args = {
            payment: payment,
            external_id: transaction_line[1..32],
            amount: transaction_line[33..45],
            status: transaction_line[51].to_i
          }
          Transaction.create(transaction_args)
        end

        discount_lines = result.select { |line| line[0] == '3' }
        discount_lines.each do |discount_line|
          discount_args = {
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
end
