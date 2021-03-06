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
      attributes = %w{id campaign_id campaign company segment delivery_type mail_day drop_day land_day range_1_a range_1_b range_2_a range_2_b range_3_a range_3_b range_4_a range_4_b range_5_a range_5_b range_6_a range_6_b range_7_a range_7_b range_8_a range_8_b range_9_a range_9_b range_10_a range_10_b done sent notes}
      CSV.generate(headers: true) do |csv|
        csv << attributes
          all.each do |i|
            csv << attributes.map{ |attr| i.send(attr) }
          end
      end
    end
end
