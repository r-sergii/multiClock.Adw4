multiclock_sources = [
  'main.vala',
  'windows/main_window/main_window.vala',
  'windows/splash_window/splash_window.vala',
  'windows/towns_window/towns_window.vala',
  'windows/language_window/language_window.vala',
  'windows/no_connect_window/no_connect_window.vala',
  'views/vert_big_view.vala',
  'views/horiz_big_view.vala',
  'widgets/theme_switcher/theme_switcher.vala',
  'widgets/custom-menu-item/custom-menu-item.vala',
  'widgets/clock_widget/clock_widget.vala',
  'widgets/clock_widget/clock_face.vala',
  'widgets/circular-progress-bar/circular-progress-bar.vala',
  'services/clock/clock_service.vala',
  'services/clock/clock_provider.vala',
  'services/clock/clock_model.vala',
  'services/connect/connect_service.vala',
  'services/connect/connect_provider.vala',
  'services/connect/connect_model.vala',
  'services/settings/settings_service.vala',
  'services/settings/settings_model.vala',
  'services/settings/theme_model.vala',
  'services/settings/locale_model.vala',
  'services/translate/translate_service.vala',
  'services/translate/translate_provider.vala',
  'services/translate/translate_model.vala',
  'services/appsload/appsload_service.vala',
  'services/appsload/appsload_provider.vala',
  'services/appsload/appsload_model.vala',
  'utils/http.vala',
  'utils/text_trim.vala',
  'utils/info_linux.vala',
  'utils/info_linux.c',
  'application.vala',
]

multiclock_deps = [
  dependency('gio-2.0'),
  dependency('gtksourceview-5'),
  dependency('libadwaita-1', version: '>= 1.0'),
  dependency('gee-0.8'),
  dependency('gdk-pixbuf-2.0'),
  dependency('json-glib-1.0')
]

gnome = import('gnome')

multiclock_sources += gnome.compile_resources('multiclock-resources',
  'multiclock.gresource.xml',
  c_name: 'multiclock'
)

executable('multiclock', multiclock_sources,
	link_args: '-lm',
  vala_args: ['--target-glib=2.50'],
  dependencies: multiclock_deps,
  install: true,
)
