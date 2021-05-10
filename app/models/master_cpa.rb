class MasterCpa < ApplicationRecord
  validates :lid, presence: true, uniqueness: true
  has_one :master_cpa_no_mail, foreign_key: 'lid'

  def self.my_import(file)
    batch,batch_size = [], 2_000
    CSV.foreach(file.path, headers: true, header_converters: :symbol, :encoding => 'utf-8') do |row|
      batch << MasterCpa.new(row.to_hash)
      if batch.size >= batch_size
        MasterCpa.import batch
          batch = []
    end
  end
    MasterCpa.import batch
  end

  # EXPORT
    def self.to_csv # Export to csv function
      attributes = %w{lid list lic_st lic fname mi lname suf co add add2 city st zip}
      CSV.generate(headers: true) do |csv|
        csv << attributes
          all.each do |i|
            csv << attributes.map{ |attr| i.send(attr) }
          end
      end
    end

end
