class DailySalesEmpire < ApplicationRecord
  # UPLOAD
    def self.my_import(file)
      batch,batch_size = [], 2_000
      CSV.foreach(file.path, headers: true, header_converters: :symbol, :encoding => 'utf-8') do |row|
        batch << DailySalesEmpire.new(row.to_hash)
        if batch.size >= batch_size
          DailySalesEmpire.import batch
            batch = []
      end
    end
      DailySalesEmpire.import batch
    end

  # EXPORT
    def self.to_csv # Export to csv function
      attributes = %w{id day year month day_of_week sales orders}
      CSV.generate(headers: true) do |csv|
        csv << attributes
          all.each do |i|
            csv << attributes.map{ |attr| i.send(attr) }
          end
      end
    end
end
