class MktgPostcard < ApplicationRecord

  def self.my_import(file)
    batch,batch_size = [], 2_000
    CSV.foreach(file.path, headers: true, header_converters: :symbol, :encoding => 'utf-8') do |row|
      batch << MktgPostcard.new(row.to_hash)
      if batch.size >= batch_size
        MktgPostcard.import batch
          batch = []
    end
  end
    MktgPostcard.import batch
  end

  # EXPORT
    def self.to_csv # Export to csv function
      attributes = %w{campaign company segment mail_day range_1_a range_1_b range_2_a range_2_b done sent notes}
      CSV.generate(headers: true) do |csv|
        csv << attributes
          all.each do |i|
            csv << attributes.map{ |attr| i.send(attr) }
          end
      end
    end
end
