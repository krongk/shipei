json.array!(@site_contacts) do |site_contact|
  json.extract! site_contact, :id, :site_id, :email, :qq, :phone, :is_processed, :note
  json.url site_contact_url(site_contact, format: :json)
end
