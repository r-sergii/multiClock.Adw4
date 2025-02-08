namespace MyLib {
    [GtkTemplate (ui = "/ua/inf/multiapps/multiClock/widgets/theme_switcher/theme_switcher.ui")]
    public class ThemeSwitcher : Gtk.Widget {
        [GtkChild]
        private unowned Gtk.CheckButton system_button;
        [GtkChild]
        private unowned Gtk.CheckButton light_button;
        [GtkChild]
        private unowned Gtk.CheckButton dark_button;

        public ThemeSwitcher () {
            Object ();
        }

        construct {
            this.set_layout_manager (new Gtk.BinLayout ());
            this.system_button.set_detailed_action_name ("app.set_app_theme::default");
            this.light_button.set_detailed_action_name ("app.set_app_theme::force-light");
            this.dark_button.set_detailed_action_name ("app.set_app_theme::force-dark");
        }
    }
}
