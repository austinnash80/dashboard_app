class CannedResponse < ApplicationRecord
  
  def self.my_import(file)
    batch,batch_size = [], 2_000
    CSV.foreach(file.path, headers: true, header_converters: :symbol, :encoding => 'utf-8') do |row|
      batch << CannedResponse.new(row.to_hash)
      if batch.size >= batch_size
        CannedResponse.import batch
          batch = []
    end
  end
    CannedResponse.import batch
  end

  # EXPORT
    def self.to_csv # Export to csv function
      attributes = %w{company des state questions answer notes}
      CSV.generate(headers: true) do |csv|
        csv << attributes
          all.each do |i|
            csv << attributes.map{ |attr| i.send(attr) }
          end
      end
    end

end
