json.cache! ['v1', @seasons] do
  json.array! @seasons do |season|
    json.id season.id
    json.title season.title
    json.plot season.plot
    json.episodes season.episodes do |episode|
      json.position episode.position
      json.title episode.title
      json.plot episode.plot
    end
  end
end
