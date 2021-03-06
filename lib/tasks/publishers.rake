namespace :publishers do
  task update: :app do
    Publisher.where(active: true).select(:id).paged_each do |publisher|
      Citygram::Workers::PublisherPoll.perform_async(publisher.id)
    end
  end
end
