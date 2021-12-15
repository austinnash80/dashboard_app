class EmpireStateTask < ApplicationRecord
  # UPLOAD
    def self.my_import(file)
      batch,batch_size = [], 2_000
      CSV.foreach(file.path, headers: true, header_converters: :symbol, :encoding => 'utf-8') do |row|
        batch << EmpireStateTask.new(row.to_hash)
        if batch.size >= batch_size
          EmpireStateTask.import batch
            batch = []
      end
    end
      EmpireStateTask.import batch
    end

  # EXPORT
    def self.to_csv # Export to csv function
      attributes = %w{empire_state_id step_number step_name details assigned due_date completed completed_date task_notes}
      CSV.generate(headers: true) do |csv|
        csv << attributes
          all.each do |i|
            csv << attributes.map{ |attr| i.send(attr) }
          end
      end
    end
end
