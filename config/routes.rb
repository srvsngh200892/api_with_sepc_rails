Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :process_csvs do
        collection do
          post :process_csv
        end
      end
    end
  end
end
