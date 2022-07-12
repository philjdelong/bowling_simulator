Rails.application.routes.draw do
	get "/", to: "bowling#index"
	patch "/update", to: "bowling#update"
end
