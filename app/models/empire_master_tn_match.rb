class EmpireMasterTnMatch < ApplicationRecord
  validates :lic, presence: true, uniqueness: true

  def self.my_import(file)
    batch,batch_size = [], 2_000
    CSV.foreach(file.path, headers: true, header_converters: :symbol, :encoding => 'utf-8') do |row|
      batch << EmpireMasterTnMatch.new(row.to_hash)
      if batch.size >= batch_size
        EmpireMasterTnMatch.import batch
          batch = []
    end
  end
    EmpireMasterTnMatch.import batch
  end

  # EXPORT
    def self.to_csv # Export to csv function
      attributes = %w{st lid list exp lic uid lname search_date}
      CSV.generate(headers: true) do |csv|
        csv << attributes
          all.each do |i|
            csv << attributes.map{ |attr| i.send(attr) }
          end
      end
    end
end
