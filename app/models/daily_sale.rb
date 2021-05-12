class DailySale < ApplicationRecord

  # UPLOAD
    def self.my_import(file)
      batch,batch_size = [], 2_000
      CSV.foreach(file.path, headers: true, header_converters: :symbol, :encoding => 'utf-8') do |row|
        batch << DailySale.new(row.to_hash)
        if batch.size >= batch_size
          DailySale.import batch
            batch = []
      end
    end
      DailySale.import batch
    end

  # EXPORT
    def self.to_csv # Export to csv function
      attributes = %w{day year month day_of_week sales cpa_full_price cpa_renewal_price ea_full_price ea_renewal_price ethics afsp other}
      CSV.generate(headers: true) do |csv|
        csv << attributes
          all.each do |i|
            csv << attributes.map{ |attr| i.send(attr) }
          end
      end
    end
end
