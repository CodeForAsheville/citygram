module Citygram::Routes
  class Digests < Citygram::App
    helpers Citygram::Routes::Helpers

    get '/digests/:subscription_id/events' do
      @subscription = Subscription[params[:subscription_id]]
      @events = Event.from_subscription(@subscription, params)
      erb :digest
    end
  end
end
