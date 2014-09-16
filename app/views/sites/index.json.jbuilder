json.array!(@sites) do |site|
  json.extract! site, :id, :url, :title, :keywords, :description, :is_processed, :note
  json.url site_url(site, format: :json)
end
