json.array!(@devices) do |device|
  json.extract! device, :id, :name, :width, :height, :os, :preview_image, :vertical_bg, :horizontal_bg, :screen_size
  json.url device_url(device, format: :json)
end
