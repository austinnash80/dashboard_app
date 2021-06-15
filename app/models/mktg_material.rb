class MktgMaterial < ApplicationRecord

  def self.my_import(file)
    batch,batch_size = [], 2_000
    CSV.foreach(file.path, headers: true, header_converters: :symbol, :encoding => 'utf-8') do |row|
      batch << MktgMaterial.new(row.to_hash)
      if batch.size >= batch_size
        MktgMaterial.import batch
          batch = []
    end
  end
    MktgMaterial.import batch
  end

  # EXPORT
    def self.to_csv # Export to csv function
      attributes = %w{co campaign name land_date delivered_to quantity link_name}
      CSV.generate(headers: true) do |csv|
        csv << attributes
          all.each do |i|
            csv << attributes.map{ |attr| i.send(attr) }
          end
      end
    end

end
