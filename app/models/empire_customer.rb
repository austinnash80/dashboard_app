class EmpireCustomer < ApplicationRecord

  validates :e_id, presence: true, uniqueness: true

  def self.my_import(file)
    batch,batch_size = [], 2_000
    CSV.foreach(file.path, headers: true, header_converters: :symbol, :encoding => 'utf-8') do |row|
      batch << EmpireCustomer.new(row.to_hash)
      if batch.size >= batch_size
        EmpireCustomer.import batch
          batch = []
    end
  end
    EmpireCustomer.import batch
  end

  # EXPORT
    def self.to_csv # Export to csv function
      attributes = %w{id e_id uid lic_state lic_num existing purchase_s purchase price_s price product email fname lname street_1 street_2 city state zip}
      CSV.generate(headers: true) do |csv|
        csv << attributes
          all.each do |i|
            csv << attributes.map{ |attr| i.send(attr) }
          end
      end
    end

end
