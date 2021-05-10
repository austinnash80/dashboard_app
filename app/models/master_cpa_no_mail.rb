class MasterCpaNoMail < ApplicationRecord
  validates :lid, presence: true, uniqueness: true
  has_one :master_cpa, foreign_key: 'lid'


  def self.my_import(file)
    batch,batch_size = [], 2_000
    CSV.foreach(file.path, headers: true, header_converters: :symbol, :encoding => 'utf-8') do |row|
      batch << MasterCpaNoMail.new(row.to_hash)
      if batch.size >= batch_size
        MasterCpaNoMail.import batch
          batch = []
    end
  end
    MasterCpaNoMail.import batch
  end

  # EXPORT
    def self.to_csv # Export to csv function
      attributes = %w{lid list lname search_date}
      CSV.generate(headers: true) do |csv|
        csv << attributes
          all.each do |i|
            csv << attributes.map{ |attr| i.send(attr) }
          end
      end
    end
end
