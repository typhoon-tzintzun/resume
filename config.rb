# Require any additional compass plugins here.
require 'bootstrap'

require 'font-awesome-sass'

require 'autoprefixer-rails'

on_stylesheet_saved do |file|
  css = File.read(file)
  map = file + '.map'

  if File.exists? map
    result = AutoprefixerRails.process(css,
      from: file,
      to:   file,
      map:  { prev: File.read(map), inline: false })
    File.open(file, 'w') { |io| io << result.css }
    File.open(map,  'w') { |io| io << result.map }
  else
    File.open(file, 'w') { |io| io << AutoprefixerRails.process(css) }
  end
end

#Folder settings
relative_assets = true      #because we're not working from the root
css_dir = "css"          #where the CSS will saved
sass_dir = "sass"           #where our .scss files are
images_dir = "images"    #the folder with your images
fonts_dir = "fonts"

# You can select your preferred output style here (can be overridden via the command line):
output_style = :expanded # After dev :compressed

# To disable debugging comments that display the original location of your selectors. Uncomment:
line_comments = true

# Obviously
preferred_syntax = :scss
