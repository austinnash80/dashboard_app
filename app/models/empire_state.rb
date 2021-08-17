class EmpireState < ApplicationRecord

  # UPLOAD
    def self.my_import(file)
      batch,batch_size = [], 2_000
      CSV.foreach(file.path, headers: true, header_converters: :symbol, :encoding => 'utf-8') do |row|
        batch << EmpireState.new(row.to_hash)
        if batch.size >= batch_size
          EmpireState.import batch
            batch = []
      end
    end
      EmpireState.import batch
    end

  # EXPORT
    def self.to_csv # Export to csv function
      attributes = %w{state st customers matched_customers list_size list_date list_cost list_notes exp_type renewal_cycle next_exp exp_notes link}
      CSV.generate(headers: true) do |csv|
        csv << attributes
          all.each do |i|
            csv << attributes.map{ |attr| i.send(attr) }
          end
      end
    end
end
