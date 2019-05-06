# Ruby on Rails ToDo App

## Instructions

Yo should develop a TODO App that includes the following features

Num | Feature | Notes
----- | ---- | ---- 
1 | Users should login to the App | Devise/Omniauth  
2 | Users can create, read, update and delete (CRUD) lists of TODOs |
3 | Users cand CRUD taks on a list |
4 | Users can export their lists with their tasks to CSV and PDF files. |
5 | Users should receive weekly email including pending tasks | Using emails and BackgroundJobs with Sidekiq and Redis
6 | Users can update your profile: name, email, description and photo | Poto must be uploaded, you could use paperclip for this task
7 | The app must include unit tests with Rspec and integration with Capybara |

## Requisites and how to run

- Install GraphicsMagick if you have issues visualizing the profiles pictures (optional)
- If you are a Windows please follow the instructions below
- If you are a Ubuntu/Linux or macOS user the next step is enough
- run bundle install
- run rails s
- In your browser enter to "http://localhost:3000"


## Instructions for Windows users
- Install wkhtmltopdf you can download it here => wkhtmltopdf.org/downloads.html 
- Once wkhtmltopdf is installed look for the path were wkhtmltopdf.exe was installed
- If you didn't change the install default path, should be C:/Program Files/wkhtmltopdf/bin/wkhtmltopdf.exe
- Copy this path and open the project
- Open config/initializers/wicked_pdf.rb
- In the field :exe_path => change the path and save
- ej. :exe_path => 'C:/Program Files/wkhtmltopdf/bin/wkhtmltopdf.exe'
- Now we are going to be able to generate the PDF's
- Redis server is required, if you dont have it installed enter here and locate the post by zangw and follow the instrucctions "https://stackoverflow.com/questions/6476945/how-do-i-run-redis-on-windows"
- Ready to go and continue with How to run :).