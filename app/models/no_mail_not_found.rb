class NoMailNotFound < ApplicationRecord
  def self.my_import(file)
    batch,batch_size = [], 2_000
    CSV.foreach(file.path, headers: true, header_converters: :symbol, :encoding => 'utf-8') do |row|
      batch << NoMailNotFound.new(row.to_hash)
      if batch.size >= batch_size
        NoMailNotFound.import batch
          batch = []
    end
  end
    NoMailNotFound.import batch
  end
  
  # EXPORT
    def self.to_csv # Export to csv function
      attributes = %w{company fname mi lname suf co add add2 city state zip note des lic_state}
      CSV.generate(headers: true) do |csv|
        csv << attributes
          all.each do |i|
            csv << attributes.map{ |attr| i.send(attr) }
          end
      end
    end
end
