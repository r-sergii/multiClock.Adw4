application_id = 'ua.multiapps.multiClock'
nzd_id = 'flag_new_zealand'
aud_id = 'flag_australia'
jpy_id = 'flag_japan'
kwr_id = 'flag_south_korea'
cny_id = 'flag_china'
hkd_id = 'flag_hong_kong'
sgd_id = 'flag_singapore'
dem_id = 'flag_germany'
chf_id = 'flag_switzerland'
gbp_id = 'flag_uk'
cad_id = 'flag_canada'
usd_id = 'flag_usa'
ok_id = 'ok128'
cancel_id = 'cancel128'
no_connect_id = 'no_connect128'

scalable_dir = join_paths('hicolor', 'scalable', 'apps')
install_data(
  join_paths(scalable_dir, ('@0@.svg').format(application_id)),
  join_paths(scalable_dir, ('@0@.svg').format(nzd_id)),
  join_paths(scalable_dir, ('@0@.svg').format(aud_id)),
  join_paths(scalable_dir, ('@0@.svg').format(jpy_id)),
  join_paths(scalable_dir, ('@0@.svg').format(kwr_id)),
  join_paths(scalable_dir, ('@0@.svg').format(cny_id)),
  join_paths(scalable_dir, ('@0@.svg').format(hkd_id)),
  join_paths(scalable_dir, ('@0@.svg').format(sgd_id)),
  join_paths(scalable_dir, ('@0@.svg').format(dem_id)),
  join_paths(scalable_dir, ('@0@.svg').format(chf_id)),
  join_paths(scalable_dir, ('@0@.svg').format(gbp_id)),
  join_paths(scalable_dir, ('@0@.svg').format(cad_id)),
  join_paths(scalable_dir, ('@0@.svg').format(usd_id)),
  join_paths(scalable_dir, ('@0@.svg').format(ok_id)),
  join_paths(scalable_dir, ('@0@.svg').format(cancel_id)),
  join_paths(scalable_dir, ('@0@.svg').format(no_connect_id)),
  install_dir: join_paths(get_option('datadir'), 'icons', scalable_dir)
)

symbolic_dir = join_paths('hicolor', 'symbolic', 'apps')
install_data(
  join_paths(symbolic_dir, ('@0@-symbolic.svg').format(application_id)),
  install_dir: join_paths(get_option('datadir'), 'icons', symbolic_dir)
)
