class SequoiaCustomer < ApplicationRecord
  validates :order_id, presence: true, uniqueness: true

  def self.my_import(file)
    batch,batch_size = [], 2_000
    CSV.foreach(file.path, headers: true, header_converters: :symbol, :encoding => 'utf-8') do |row|
      batch << SequoiaCustomer.new(row.to_hash)
      if batch.size >= batch_size
        SequoiaCustomer.import batch
          batch = []
    end
  end
    SequoiaCustomer.import batch
  end

  # EXPORT
    def self.to_csv # Export to csv function
      attributes = %w{s_id order_id uid exisiting purchase_s purchase price_s price product_1 product_2 designation email fname street_1 street_2 city state zip}
      CSV.generate(headers: true) do |csv|
        csv << attributes
          all.each do |i|
            csv << attributes.map{ |attr| i.send(attr) }
          end
      end
    end
end
