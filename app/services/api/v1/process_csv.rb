class Api::V1::ProcessCsv

  def initialize(params)
    @file ||= params[:csv_file]
  end

  def read_csv
    return [false] if !validate_header_and_type?
    first_name = Hash.new(0)
    CSV.foreach(@file.path, headers: true) do |row|
      data_hash = row.to_hash
      first_name[data_hash['first_name']] +=1
    end
    return [true, first_name.select{|k,v| v > 1}]
  end

  private

  def validate_header_and_type?
    is_csv = @file.try(:path).present? ?  @file.try(:path).split('.')[-1].try(:include?, 'csv') : false
    return false if !is_csv
    csv = CSV.open(@file.path, &:readline)
    csv.present? ? csv.include?('first_name') : false
  end
end
