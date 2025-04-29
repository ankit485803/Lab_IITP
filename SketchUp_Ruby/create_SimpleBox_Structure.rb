

#  4th March 2025 (Tuesday) when i am exploring the house 3D model creating on sketchup, then i come to know that Ruby prog lang
# is used in developer section of sketchup software to create the building




### part1: create a cuboid shap of building


model = Sketchup.active_model
entities = model.active_entities

# Define building dimensions l*b*h
length = 5.m
width = 3.m
height = 2.5.m

# Define corner points
pts = [
  [0, 0, 0], [length, 0, 0],
  [length, width, 0], [0, width, 0]
]

# Create base face and extrude to form the building
face = entities.add_face(pts)
face.pushpull(height)

puts "Building Created!"





### part2: to assign colors

require 'csv'

model = Sketchup.active_model
entities = model.active_entities

# Define file path to your CSV file
csv_path = "C:/path/to/your/Building_Temperature_Variation.csv"  # Update with correct path

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

# Read CSV data
CSV.foreach(csv_path, headers: true) do |row|
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

puts "Thermal Model Created!"




### update the part2:  with legned

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

# Read CSV data
CSV.foreach(csv_path, headers: true) do |row|
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

# Create a color legend on the right side
legend_origin = [10.m, 0, 0]  # Adjust position as needed
legend_height = 1.m
legend_spacing = 0.2.m

color_ranges = {
  "< 22°C" => "blue",
  "22-25°C" => "cyan",
  "25-28°C" => "green",
  "28-32°C" => "yellow",
  "32-35°C" => "orange",
  "> 35°C" => "red"
}

color_ranges.each_with_index do |(label, color), index|
  y_offset = index * (legend_height + legend_spacing)
  rect_pts = [
    [legend_origin[0], legend_origin[1] + y_offset, legend_origin[2]],
    [legend_origin[0] + 1.m, legend_origin[1] + y_offset, legend_origin[2]],
    [legend_origin[0] + 1.m, legend_origin[1] + y_offset + legend_height, legend_origin[2]],
    [legend_origin[0], legend_origin[1] + y_offset + legend_height, legend_origin[2]]
  ]
  
  face = entities.add_face(rect_pts)
  mat = materials.add(color)
  mat.color = color
  face.material = mat
  
  text = entities.add_text(label, [legend_origin[0] + 1.2.m, legend_origin[1] + y_offset + (legend_height / 2), legend_origin[2]])
end

puts "Thermal Model Created with Color Legend!"




### handing error in UTF8
require 'csv'

model = Sketchup.active_model
entities = model.active_entities

# Define file path to your CSV file
csv_path = "C:/Users/sanja/Desktop/BuildingTempVariation.csv"  # Update with correct path

# Check if file exists before processing
if File.exist?(csv_path)
  puts "File found: #{csv_path}"

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
    # Try opening with different encoding options
    File.open(csv_path, "r:Windows-1252:utf-8") do |file|
      CSV.foreach(file, headers: true, encoding: "utf-8") do |row|
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
    end
  rescue CSV::MalformedCSVError => e
    puts "Error reading CSV file: #{e.message}"
  end

  puts "Thermal Model Created!"
else
  puts "File not found at #{csv_path}"
end





