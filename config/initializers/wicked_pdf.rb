# WickedPDF Global Configuration
#
# Use this to set up shared configuration options for your entire application.
# Any of the configuration options shown here can also be applied to single
# models by passing arguments to the `render :pdf` call.
#
# To learn more, check out the README:
#
# https://github.com/mileszs/wicked_pdf/blob/master/README.md

WickedPdf.config = {

  #Uncomment this path if you are a  Linux or OSX  user
  exe_path: "/usr/local/bin/wkhtmltopdf",

#Default path for windows users
#exe_path => 'C:\Program Files/wkhtmltopdf/bin/wkhtmltopdf.exe',
}
