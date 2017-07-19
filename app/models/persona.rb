class Persona < ApplicationRecord
    
  def self.subir_excel(file)
    
    file_ext = File.extname(file.original_filename)
    raise "Unknown file type: #{file.original_filename}" unless [".xls", ".xlsx"].include?(file_ext)

    spreadsheet = (file_ext == ".xls") ? Roo::Excel.new(file.path) : Roo::Excelx.new(file.path)

    header = spreadsheet.row(1)
    
    (2..spreadsheet.last_row).each do |i|
      Persona.create(nombre: spreadsheet.row(i)[0], apellido: spreadsheet.row(i)[1])
    end

  end
  
end
