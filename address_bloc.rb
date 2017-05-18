require_relative 'controllers/menu_controller'

menu = MenuContoller.new

system "clear"
puts "Welcome to AddressBloc!"

menu.main_menu
