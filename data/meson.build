# Install icons
icon_sizes = ['16', '24', '32', '48', '64', '128']

foreach i : icon_sizes
    install_data (
        join_paths ('icons', i, meson.project_name () + '.png'),
        install_dir: join_paths (get_option ('datadir'), 'icons', 'hicolor', i + 'x' + i, 'apps')
    )
    install_data (
        join_paths ('icons', i, meson.project_name () + '.png'),
        install_dir: join_paths (get_option ('datadir'), 'icons', 'hicolor', i + 'x' + i + '@2', 'apps')
    )
endforeach

desktop_file = i18n.merge_file(
  input: 'ua.multiapps.multiClock.desktop.in',
  output: 'ua.multiapps.multiClock.desktop',
#  input: meson.project_name () + '.desktop.in',
#  output: meson.project_name () + '.desktop',
  type: 'desktop',
  po_dir: '../po',
  install: true,
  install_dir: join_paths(get_option('datadir'), 'applications')
)

desktop_utils = find_program('desktop-file-validate', required: false)
if desktop_utils.found()
  test('Validate desktop file', desktop_utils,
    args: [desktop_file]
  )
endif

#appstream_file = i18n.merge_file(
#  input: 'ua.multiapps.multiClock.appdata.xml.in',
#  output: 'ua.multiapps.multiClock.appdata.xml',
##  input: meson.project_name () + '.appdata.xml.in',
##  output: meson.project_name () + '.appdata.xml',
#  po_dir: '../po',
#  install: true,
#  install_dir: join_paths(get_option('datadir'), 'appdata')
#)

appstream_util = find_program('appstream-util', required: false)
if appstream_util.found()
  test('Validate appstream file',
    appstream_util,
    args: ['validate', appstream_file],
#    args: ['validate', '--no-net', '--explain', appdata_file.full_path()],
#    workdir: meson.current_build_dir()
  )
endif

install_data('ua.multiapps.multiClock.gschema.xml',
#install_data(meson.project_name () + '.gschema.xml',
  install_dir: join_paths(get_option('datadir'), 'glib-2.0/schemas')
)

compile_schemas = find_program('glib-compile-schemas', required: false)
if compile_schemas.found()
  test('Validate schema file', compile_schemas,
    args: ['--strict', '--dry-run', meson.current_source_dir()]
  )
endif

subdir('icons')

