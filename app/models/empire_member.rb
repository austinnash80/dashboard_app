class EmpireMember < ApplicationRecord
  validates :uid, presence: true, uniqueness: true

  def self.my_import(file)
    batch,batch_size = [], 2_000
    CSV.foreach(file.path, headers: true, header_converters: :symbol, :encoding => 'utf-8') do |row|
      batch << EmpireMember.new(row.to_hash)
      if batch.size >= batch_size
        EmpireMember.import batch
          batch = []
    end
  end
    EmpireMember.import batch
  end

  # EXPORT
    def self.to_csv # Export to csv function
      attributes = %w{uid lname email first_purchase last_purchase state lic_num purchases email_unsubscribe}
      CSV.generate(headers: true) do |csv|
        csv << attributes
          all.each do |i|
            csv << attributes.map{ |attr| i.send(attr) }
          end
      end
    end
end
