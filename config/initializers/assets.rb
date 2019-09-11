# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.paths += Dir["#{Rails.root}/vendor/*"]
Rails.application.config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif *.svg)

# Precompile additional assets.
# application.js, application.scss, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w(
  devise/login.scss

)

Rails.application.config.assets.precompile += %w(
  common/common.min.js
  custom.min.js
  settings.js
  gleek.js
  styleSwitcher.js
  chart.js/Chart.bundle.min.js
  circle-progress/circle-progress.min.js
  d3v3/index.js
  topojson/topojson.min.js
  datamaps/datamaps.world.min.js
  raphael/raphael.min.js
  morris/morris.min.js
  moment/moment.min.js
  pg-calendar/js/pignose.calendar.min.js
  chartist/js/chartist.min.js
  chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js
  jqueryui/js/jquery-ui.min.js
  fullcalendar/js/fullcalendar.min.js
  plugins-init/fullcalendar-init.js
  dashboard/dashboard-1
  fullcalendar/lang/pt-br.js
  bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js
  clockpicker/dist/jquery-clockpicker.min.js
  jquery-asColorPicker-master/libs/jquery-asColor.js
  jquery-asColorPicker-master/libs/jquery-asGradient.js
  jquery-asColorPicker-master/dist/jquery-asColorPicker.min.js
  bootstrap-datepicker/bootstrap-datepicker.min.js
  timepicker/bootstrap-timepicker.min.js
  bootstrap-daterangepicker/daterangepicker.js

)
