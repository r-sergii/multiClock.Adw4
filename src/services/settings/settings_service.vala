namespace Multiclock {

    public class SettingsService {

        private GLib.Settings _settings;

        private SettingsModel _model;
        private ThemeModel _theme;
        private LocaleModel _locale;

        public SettingsService() {
            // GLib settings
            _settings = new GLib.Settings ("ua.inf.multiapps.multiClock");
            _model = new SettingsModel();
            _theme = new ThemeModel();
            _locale = new LocaleModel();
            read ();
            readTheme ();
            readLocale ();
        }

        public GLib.Settings settings {
            get {
                return _settings;
            }
        }

        public Multiclock.SettingsModel model {
            get {
                return _model;
            }
        }

        public Multiclock.ThemeModel theme {
            get {
                return _theme;
            }
        }

        public Multiclock.LocaleModel locale {
            get {
                return _locale;
            }
        }

        public void read () {
            _model.fromSettings (_settings);
        }

        public void write () {
            _model.toSettings (_settings);
        }

        public void readTheme () {
            _theme.fromSettings (_settings);
        }

        public void writeTheme () {
            _theme.toSettings (_settings);
        }

        public void readLocale () {
            _locale.fromSettings (_settings);
        }

        public void writeLocale () {
            _locale.toSettings (_settings);
        }

    }
}
