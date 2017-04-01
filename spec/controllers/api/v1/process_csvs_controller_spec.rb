require 'spec_helper'

describe Api::V1::ProcessCsvsController, type: :controller do
  describe "#process_csv", focus: true do
    it 'should hit process_csv and return first_name with count' do
        file = File.open('tmp/first_name.csv', 'r+')
        @request.env["CONTENT_TYPE"] = "text/csv"
        post :process_csv, csv_file: fixture_file_upload(file)
        hash_body = JSON.parse(response.body)
        expect(hash_body['saurav']).to eq(2)
        expect(hash_body['gaurav']).to eq(2)
        expect(response.status).to eq(200)
    end

    it 'should hit process_csv and return false , this is to test invalid case' do
        file = File.open('tmp/no_first_name.csv', 'r+')
        @request.env["CONTENT_TYPE"] = "text/csv"
        post :process_csv, csv_file: fixture_file_upload(file)
        expect(response.status).to eq(422)
    end
  end
end
