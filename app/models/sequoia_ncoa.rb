class SequoiaNcoa < ApplicationRecord
  validates :uid, presence: true, uniqueness: true

  def self.my_import(file)
    batch,batch_size = [], 2_000
    CSV.foreach(file.path, headers: true, header_converters: :symbol, :encoding => 'utf-8') do |row|
      batch << SequoiaNcoa.new(row.to_hash)
      if batch.size >= batch_size
        SequoiaNcoa.import batch
          batch = []
    end
  end
    SequoiaNcoa.import batch
  end

  # EXPORT
    def self.to_csv # Export to csv function
      attributes = %w{uid fname lname street_1 street_2 city state zip new bad}
      CSV.generate(headers: true) do |csv|
        csv << attributes
          all.each do |i|
            csv << attributes.map{ |attr| i.send(attr) }
          end
      end
    end

end
