class CoursesPacific < ApplicationRecord
  def self.my_import(file)
    batch,batch_size = [], 2_000
    CSV.foreach(file.path, headers: true, header_converters: :symbol, :encoding => 'utf-8') do |row|
      batch << CoursesPacific.new(row.to_hash)
      if batch.size >= batch_size
        CoursesPacific.import batch
          batch = []
    end
  end
    CoursesPacific.import batch
  end

  # EXPORT
    def self.to_csv # Export to csv function
      attributes = %w{number version title category sub_category hours pub_date sequoia_number sequoia_version text exam active version_update new update_sheet notes}
      CSV.generate(headers: true) do |csv|
        csv << attributes
          all.each do |i|
            csv << attributes.map{ |attr| i.send(attr) }
          end
      end
    end
end
