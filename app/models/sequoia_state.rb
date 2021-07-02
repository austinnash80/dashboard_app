class SequoiaState < ApplicationRecord
  def self.my_import(file)
    batch,batch_size = [], 2_000
    CSV.foreach(file.path, headers: true, header_converters: :symbol, :encoding => 'utf-8') do |row|
      batch << SequoiaState.new(row.to_hash)
      if batch.size >= batch_size
        SequoiaState.import batch
          batch = []
    end
  end
    SequoiaState.import batch
  end

  # EXPORT
    def self.to_csv # Export to csv function
      attributes = %w{state	st list	list_quantity	matched	market_share ce_cycle hours_per_cycle ce_due	exp_date exp_cycle self_study	has_year_minimum year_minimum}
      CSV.generate(headers: true) do |csv|
        csv << attributes
          all.each do |i|
            csv << attributes.map{ |attr| i.send(attr) }
          end
      end
    end
end
