json.extract! persona, :id, :nombre, :apellido, :edad, :otro, :created_at, :updated_at
json.url persona_url(persona, format: :json)
