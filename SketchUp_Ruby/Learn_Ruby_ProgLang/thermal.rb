


require 'csv'

model = Sketchup.active_model
entities = model.active_entities

# Define file path to your CSV file
csv_path = "C:/Users/sanja/Desktop/BuildingTempVariation.csv"  # Update with correct path

# Create materials based on temperature range
materials = model.materials

# Define color gradient based on temperature
def get_temp_color(temp)
  if temp < 22
    return "blue"
  elsif temp < 25
    return "cyan"
  elsif temp < 28
    return "green"
  elsif temp < 32
    return "yellow"
  elsif temp < 35
    return "orange"
  else
    return "red"
  end
end

# Read CSV data with proper encoding handling
begin
  CSV.foreach(csv_path, headers: true, encoding: "bom|utf-8") do |row|
    measurement_point = row["Measurement Point"]
    temperature = row["Temperature (°C)"].to_f

    # Get color based on temperature
    color_name = get_temp_color(temperature)
    mat = materials.add(color_name)
    mat.color = color_name

    # Assign material to the respective building face
    case measurement_point
    when "Roof"
      entities.grep(Sketchup::Face).each { |f| f.material = mat if f.normal.z > 0 }
    when "Ground Level"
      entities.grep(Sketchup::Face).each { |f| f.material = mat if f.normal.z < 0 }
    when "Sunlit Wall"
      entities.grep(Sketchup::Face).each { |f| f.material = mat if f.normal.x > 0 }
    when "Shadow Wall"
      entities.grep(Sketchup::Face).each { |f| f.material = mat if f.normal.x < 0 }
    when "Corner"
      entities.grep(Sketchup::Face).each { |f| f.material = mat if f.normal.y > 0 }
    when "Window"
      entities.grep(Sketchup::Face).each { |f| f.material = mat if f.normal.y < 0 }
    when "Door"
      entities.grep(Sketchup::Face).each { |f| f.material = mat if f.normal.y < 0 }
    end
  end
rescue CSV::MalformedCSVError => e
  puts "Error reading CSV file: #{e.message}"
end

puts "Thermal Model Created!"
