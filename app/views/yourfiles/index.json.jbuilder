json.array!(@yourfiles) do |yourfile|
  json.extract! yourfile, :id, :file, :file_id
  json.url yourfile_url(yourfile, format: :json)
end
