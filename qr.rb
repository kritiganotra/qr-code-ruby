require "rqrcode"

puts "What kind of QR code would you like to generate?"
puts "\n"
puts "1. Open a URL"
puts "2. Join a wifi network"
puts "3. Send a text message"
puts "\n"
puts "Press 4 to exit" 

input = gets.chomp

#Link - Open a URL 
if input.include?("1") 
  puts "What is the URL you would like to encode?"
  text = gets.chomp


#Join a wifi network
elsif input.include?("2")
  puts "What is the name of the wifi network?"
  wifi_network = gets.chomp

  puts "What is the password?"
  wifi_password = gets.chomp

  text = "WIFI:T:WPA;S:#{wifi_network};P:#{wifi_password};;"

#send a text message
elsif input.include?("3")
  puts "What is the phone number you want the code to send a text message to? You can include the country code with a + in the beginning."
  phone_num = gets.chomp

  puts "What do you want to populate the message with?"
  message = gets.chomp
  
  text = "SMSTO:#{phone_num}:#{message}"

elsif input.include?("4")
  puts "Goodbye!"
  exit
else 
  puts "Invalid input. Please try again"
  exit
end

puts "What would you like to call the PNG?"
png_name= gets.chomp

qrcode = RQRCode::QRCode.new(text)
png_qrcode = qrcode.as_png({ :size => 500 })
IO.binwrite("#{png_name}.png", png_qrcode.to_s)
