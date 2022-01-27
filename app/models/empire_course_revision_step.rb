class EmpireCourseRevisionStep < ApplicationRecord
  def self.my_import(file)
    batch,batch_size = [], 2_000
    CSV.foreach(file.path, headers: true, header_converters: :symbol, :encoding => 'utf-8') do |row|
      batch << EmpireCourseRevisionStep.new(row.to_hash)
      if batch.size >= batch_size
        EmpireCourseRevisionStep.import batch
          batch = []
    end
  end
    EmpireCourseRevisionStep.import batch
  end

  # EXPORT
    def self.to_csv # Export to csv function
      attributes = %w{empire_course_revision_id number phase step	details	assigned note due_date complete	complete_date file	extra_s	extra_i}
      CSV.generate(headers: true) do |csv|
        csv << attributes
          all.order(empire_course_revision_id: :asc).order(number: :asc).each do |i|
            csv << attributes.map{ |attr| i.send(attr) }
          end
      end
    end
end
