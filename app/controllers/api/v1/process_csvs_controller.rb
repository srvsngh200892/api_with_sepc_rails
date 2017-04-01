class Api::V1::ProcessCsvsController < Api::V1::ApiController

  def process_csv
    ensure_params(:csv_file) and return
    processed_output = Api::V1::ProcessCsv.new(params).read_csv
    if processed_output[0]
      render json: processed_output[1], status: :ok
    else
      return render_api_error(01, 422, 'error', 'please provide vaild file')
    end
  end
end
