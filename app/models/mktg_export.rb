class MktgExport < ApplicationRecord
  validates :uid, presence: true, uniqueness: true

  def self.my_import(file)
    batch,batch_size = [], 2_000
    CSV.foreach(file.path, headers: true, header_converters: :symbol, :encoding => 'utf-8') do |row|
      batch << MktgExport.new(row.to_hash)
      if batch.size >= batch_size
        MktgExport.import batch
          batch = []
    end
  end
    MktgExport.import batch
  end

  # EXPORT
    def self.to_csv # Export to csv function
      attributes = %w{uid campaign des exp fname lname street_1 street_2 city state zip text_1 text_2 text_3 text_4 text_5 text_6 text_7 text_8 text_9 text_10}
      CSV.generate(headers: true) do |csv|
        csv << attributes
          all.each do |i|
            csv << attributes.map{ |attr| i.send(attr) }
          end
      end
    end
end
