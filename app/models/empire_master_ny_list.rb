class EmpireMasterNyList < ApplicationRecord
  validates :lid, presence: true, uniqueness: true

  def self.my_import(file)
    batch,batch_size = [], 2_000
    CSV.foreach(file.path, headers: true, header_converters: :symbol, :encoding => 'utf-8') do |row|
      batch << EmpireMasterNyList.new(row.to_hash)
      if batch.size >= batch_size
        EmpireMasterNyList.import batch
          batch = []
    end
  end
    EmpireMasterNyList.import batch
  end

  # EXPORT
    def self.to_csv # Export to csv function
      attributes = %w{lid list lic lic_state record_type lic_status iss_date_s iss_date exp_date_s exp_date fname mi lname suf co add add2 city st zip email phone}
      CSV.generate(headers: true) do |csv|
        csv << attributes
          all.each do |i|
            csv << attributes.map{ |attr| i.send(attr) }
          end
      end
    end
end
