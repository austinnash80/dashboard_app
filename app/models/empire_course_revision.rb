class EmpireCourseRevision < ApplicationRecord
  def self.my_import(file)
    batch,batch_size = [], 2_000
    CSV.foreach(file.path, headers: true, header_converters: :symbol, :encoding => 'utf-8') do |row|
      batch << EmpireCourseRevision.new(row.to_hash)
      if batch.size >= batch_size
        EmpireCourseRevision.import batch
          batch = []
    end
  end
    EmpireCourseRevision.import batch
  end

  # EXPORT
    def self.to_csv # Export to csv function
      attributes = %w{id priority course_number course course_type state status hour revision note upgrades}
      CSV.generate(headers: true) do |csv|
        csv << attributes
          all.order(priority: :asc).each do |i|
            csv << attributes.map{ |attr| i.send(attr) }
          end
      end
    end
end
