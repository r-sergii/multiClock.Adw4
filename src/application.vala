/* application.vala
 *
 * Copyright 2024 r-sergii
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

//xgettext --files-from=po/POTFILES --from-code=UTF-8 --output po/multiclock.pot

namespace Multiclock {
    public class Application : Adw.Application {

        public Adw.ColorScheme theme { get; set; }
        private Multiclock.ClockService _clockService;

        private Multiclock.VertBigView _vertBigView;
        private Multiclock.HorizBigView _horizBigView;

        private Multiclock.SettingsService _settingsService;

        private MyLib.InfoLinux info;

        public Application () {
            Object (application_id: "ua.multiapps.multiClock", flags: ApplicationFlags.FLAGS_NONE);
        }

        construct {
            ActionEntry[] action_entries = {
                { "towns", this.on_towns_action },
                { "language", this.on_language_action },
                { "about", this.on_about_action },
                { "preferences", this.on_preferences_action },
                { "quit", this.on_quit }
            };
            this.add_action_entries (action_entries, this);
            this.set_accels_for_action ("app.language", {"<primary>l"});
            this.set_accels_for_action ("app.towns", {"<primary>t"});
            this.set_accels_for_action ("app.about", {"<primary>a"});
            this.set_accels_for_action ("app.quit", {"<primary>q"});

            var set_theme_action = new GLib.PropertyAction ("set_app_theme", this, "theme");
            set_theme_action.notify.connect (this.set_app_theme);
            this.add_action (set_theme_action);

            info = new MyLib.InfoLinux ();
            stdout.printf ("%s\n", info.os + "-" + info.cpu);

            _settingsService = new SettingsService ();
            _clockService = new ClockService ();
        }

        public override void activate () {
            base.activate ();

            init_app_theme ();

            var provider = new Gtk.CssProvider ();
            provider.load_from_resource ("/ua/multiapps/multiClock/theme_switcher.css");
            Gtk.StyleContext.add_provider_for_display (Gdk.Display.get_default (), provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);

            var win = this.active_window;
            if (win == null) {

                var connectService = new ConnectService ();
                bool result = connectService.connect ();
                if (result == false) {
                    var noconnect = new Multiclock.NoConnectWindow (this);
                    noconnect.present ();
                    return;
                }

                var appsLoad = new Multiclock.AppsLoadService (info, _settingsService.locale.locale );
                appsLoad.insert ();

                var splash = new Multiclock.SplashWindow (this);
                splash.present ();
                _clockService.getItems ();
                _clockService.readSettings (_settingsService.model);
                Timeout.add (3000, make_window);
//                win = this.create_window ();
 //               win.present ();
                this.set_app_theme ();

//                win = new Multiclock.Window (this);
            }
            win.present ();
        }

        public Multiclock.ClockService clockService {
            get {
                return _clockService;
            }
        }

        public Multiclock.VertBigView vertBigView {
            get {
                return _vertBigView;
            }
            set {
                _vertBigView = value;
            }
        }

        public Multiclock.HorizBigView horizBigView {
            get {
                return _horizBigView;
            }
            set {
                _horizBigView = value;
            }
        }

        public Multiclock.SettingsService settingsService {
            get {
                return _settingsService;
            }
        }

        private bool make_window()
        {
            var win = new Multiclock.MainWindow (this);
//            win.set_position ( Gtk.WindowPosition.CENTER );// (GTK_WIN_POS_CENTER);
            win.present ();
            return false;
        }

        private Multiclock.MainWindow create_window () {
//            _vertBigView = new VertBigView ();
  //          _horizBigView = new HorizBigView ();

            var win = new Multiclock.MainWindow (this);

            // Css settings
            var provider = new Gtk.CssProvider ();
            provider.load_from_resource ("/ua/multiapps/multiClock/theme_switcher.css");
            Gtk.StyleContext.add_provider_for_display (Gdk.Display.get_default (), provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);

            // GLib settings
//            var settings = new GLib.Settings ("org.hitchhiker_linux.vapad");
  //          settings.bind ("vimode", win, "vimode", GLib.SettingsBindFlags.DEFAULT);
    //        settings.bind ("grid", win, "display_grid", GLib.SettingsBindFlags.DEFAULT);
      //      settings.bind ("syntax", win, "editor_theme", GLib.SettingsBindFlags.DEFAULT);
        //    settings.bind ("font", win, "editor_font", GLib.SettingsBindFlags.DEFAULT);
          //  settings.bind ("theme", this, "theme", GLib.SettingsBindFlags.DEFAULT);
            return win;
        }

        private void on_about_action () {
//            string[] authors = { "r-sergii" };
  //          Gtk.show_about_dialog (this.active_window,
    //                               "program-name", "multiclock",
      //                             "authors", authors,
        //                           "version", "0.1.0");

            var win = new Adw.AboutWindow () {
                application_name = "multiClock",
                application_icon = "ua.multiapps.multiClock",
                version = "0.1.0",
                copyright = "Copyright © 2025 Serhii Rudchenko",
//                license_type = License.GPL_3_0,
                developer_name = "Serhii Rudchenko",
                developers = {"Serhii Rudchenko email:sergej.rudchenko@gmail.com"},
                translator_credits = _("translator-credits"),
                website = "https://r-serega.github.io/mapps/",
                issue_url = "email:multiApps@i.ua"
            };
            win.set_transient_for (this.active_window);
            win.show ();

        }

        private void on_preferences_action () {
            message ("app.preferences action activated");
        }

        private void init_app_theme () {
            var th = settingsService.theme;
            switch (th.theme) {
                case 0: theme = Adw.ColorScheme.DEFAULT;
                        break;
                case 1: theme = Adw.ColorScheme.FORCE_LIGHT;
                        break;
                case 2: theme = Adw.ColorScheme.FORCE_DARK;
                        break;
                case 3: theme = Adw.ColorScheme.PREFER_LIGHT;
                        break;
                case 4: theme = Adw.ColorScheme.PREFER_DARK;
                        break;
                default: theme = Adw.ColorScheme.DEFAULT;
                        break;
            }
            Adw.StyleManager.get_default ().set_color_scheme (this.theme);
        }

        private void set_app_theme () {
            Adw.StyleManager.get_default ().set_color_scheme (this.theme);
            message (this.theme.to_string());

            var th = settingsService.theme;

            switch(theme) {
                case Adw.ColorScheme.FORCE_LIGHT:
                    message ("FL");
                    th.theme = 1;
                    break;
                case Adw.ColorScheme.FORCE_DARK:
                    message ("FD");
                    th.theme = 2;
                    break;
                case Adw.ColorScheme.PREFER_LIGHT:
                    message ("PFL");
                    th.theme = 3;
                    break;
                case Adw.ColorScheme.PREFER_DARK:
                    message ("PFL");
                    th.theme = 4;
                    break;
                case Adw.ColorScheme.DEFAULT:
                    message ("DEF");
                    th.theme = 0;
                    break;
                default:
                    message ("default");
                    th.theme = 0;
                    break;
            }
//            th.toSettings ();
            settingsService.writeTheme ();

        }

//        private void on_quit () {
  //          message ("app.preferences action activated");
    //    }

        private void on_towns_action () {
            message ("towns action show activated");

            var towns = new Multiclock.TownsWindow ();
            towns.set_transient_for (this.active_window);
            towns.show ();
        }

        private void on_language_action () {
            message ("language action show activated");

            var language = new Multiclock.LanguageWindow (this.active_window as Multiclock.MainWindow);
            language.set_transient_for (this.active_window);
            language.show ();

//            (this.active_window as Multiclock.MainWindow).init_menu ();
        }

        private void on_quit () {
//            this.get_windows ().foreach ((obj) => {
  //              var win = (Multiclock.MainWindow) obj;
    //            win.close_all ();
      //      });
            Multiclock.MainWindow win = this.active_window as Multiclock.MainWindow;
            win.on_close_application ();
        }
    }
}
