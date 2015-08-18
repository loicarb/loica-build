# Load the application from the current directory

CURRENT_APPLICATION_PATH = File.join(Dir.pwd,'application.rake')

CURRENT_APPLICATION = Loica::Build::Application.load_from(CURRENT_APPLICATION_PATH)
