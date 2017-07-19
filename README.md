def load_imported_personas
  #spreadsheet = open_spreadsheet
  header = spreadsheet.row(1)
  
  (2..spreadsheet.last_row).map do |i|
    
    # en row esta el hash que viene del excel
    # ejemplo: {"id"=>nil, "nombre"=>"carlos", "apellido"=>"gonzalez", "edad"=>"24"}
    row = Hash[[header, spreadsheet.row(i)].transpose]
    
    # en persona se guarda el objeto persona que se filtra por el id
    # y si no existe se instancia uno nuevo
    persona = Persona.find_by_id(row["id"]) || Persona.new
    
    # Aca se concatenan los valores de row con la persona (sea nueva o existente)
    persona.attributes = Hash[row.map{ |k, v| [k.to_sym, v] }]

  end
end
