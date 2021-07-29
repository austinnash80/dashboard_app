class SequoiaMember < ApplicationRecord
  validates :uid, presence: true, uniqueness: true

  def self.my_import(file)
    batch,batch_size = [], 2_000
    CSV.foreach(file.path, headers: true, header_converters: :symbol, :encoding => 'utf-8') do |row|
      batch << SequoiaMember.new(row.to_hash)
      if batch.size >= batch_size
        SequoiaMember.import batch
          batch = []
    end
  end
    SequoiaMember.import batch
  end

  # EXPORT
    def self.to_csv # Export to csv function
      attributes = %w{uid lname first_purchase last_purchase membership_exp discount_exp cpa cpa_memberships ea ea_memberships afsp afsp_purchases ethics ethics_purchases other email_unsubscribe}
      CSV.generate(headers: true) do |csv|
        csv << attributes
          all.each do |i|
            csv << attributes.map{ |attr| i.send(attr) }
          end
      end
    end
end
