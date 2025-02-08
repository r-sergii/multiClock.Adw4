namespace Multiclock {
	[GtkTemplate (ui = "/ua/inf/multiapps/multiClock/windows/towns_window/towns_window.ui")]
	public class TownsWindow : Adw.PreferencesWindow {//Adw.ApplicationWindow {
        [GtkChild]
        unowned Gtk.Switch switch_wellington;
        [GtkChild]
        unowned Gtk.Switch switch_sydney;
        [GtkChild]
        unowned Gtk.Switch switch_tokio;
        [GtkChild]
        unowned Gtk.Switch switch_seoul;
        [GtkChild]
        unowned Gtk.Switch switch_shanghai;
        [GtkChild]
        unowned Gtk.Switch switch_hong_kong;
        [GtkChild]
        unowned Gtk.Switch switch_singapore;
        [GtkChild]
        unowned Gtk.Switch switch_frankfurt;
        [GtkChild]
        unowned Gtk.Switch switch_zurich;
        [GtkChild]
        unowned Gtk.Switch switch_london;
        [GtkChild]
        unowned Gtk.Switch switch_toronto;
        [GtkChild]
        unowned Gtk.Switch switch_new_york;
        [GtkChild]
        unowned Gtk.Switch switch_chicago;
        [GtkChild]
        unowned Gtk.Switch switch_san_francisco;
        [GtkChild]
        unowned Gtk.Button button_ok;
        [GtkChild]
        unowned Gtk.Button button_cancel;
        [GtkChild]
        unowned Adw.ToastOverlay overlay;
        [GtkChild]
        unowned Adw.ButtonContent adw_button_ok;
        [GtkChild]
        unowned Adw.ButtonContent adw_button_cancel;
        [GtkChild]
        unowned Adw.WindowTitle adw_title;

//        private string directory_path;
//        private Multiclock.VertBigView vert;

		public TownsWindow () {//Multiclock.VertBigView _vert) {//(Adw.Application app) {
			Object ();//application: app);
            button_ok.clicked.connect(on_ok);
            button_cancel.clicked.connect(on_cancel);

            init ();

            var app = GLib.Application.get_default();
            var theme = (app as Multiclock.Application).theme;
            var locale = (app as Multiclock.Application).settingsService.locale;

            adw_button_ok.label = locale.ok;
            adw_button_ok.tooltip_text = locale.yes_rem;
            adw_button_cancel.label = locale.cancel;
            adw_button_cancel.tooltip_text = locale.no_rem;
            adw_title.title = locale.choose_cities;
		}

		private void init() {
            var app = GLib.Application.get_default();
            var clockService = (app as Multiclock.Application).clockService;

		    switch_wellington.active = clockService.listVisible[0];
            switch_sydney.active = clockService.listVisible[1];
            switch_tokio.active = clockService.listVisible[2];
            switch_seoul.active = clockService.listVisible[3];
            switch_shanghai.active = clockService.listVisible[4];
            switch_hong_kong.active = clockService.listVisible[5];
            switch_singapore.active = clockService.listVisible[6];
            switch_frankfurt.active = clockService.listVisible[7];
            switch_zurich.active = clockService.listVisible[8];
            switch_london.active = clockService.listVisible[9];
            switch_toronto.active = clockService.listVisible[10];
            switch_new_york.active = clockService.listVisible[11];
            switch_chicago.active = clockService.listVisible[12];
            switch_san_francisco.active = clockService.listVisible[13];
		}

		private void save() {
            var app = GLib.Application.get_default();
            var clockService = (app as Multiclock.Application).clockService;
            var vertBigView = (app as Multiclock.Application).vertBigView;
            var horizBigView = (app as Multiclock.Application).horizBigView;
            var settingsService = (app as Multiclock.Application).settingsService;

		    clockService.listVisible[0] = switch_wellington.active;
            clockService.listVisible[1] = switch_sydney.active;
            clockService.listVisible[2] = switch_tokio.active;
            clockService.listVisible[3] = switch_seoul.active;
            clockService.listVisible[4] = switch_shanghai.active;
            clockService.listVisible[5] = switch_hong_kong.active;
            clockService.listVisible[6] = switch_singapore.active;
            clockService.listVisible[7] = switch_frankfurt.active;
            clockService.listVisible[8] = switch_zurich.active;
            clockService.listVisible[9] = switch_london.active;
            clockService.listVisible[10] = switch_toronto.active;
            clockService.listVisible[11] = switch_new_york.active;
            clockService.listVisible[12] = switch_chicago.active;
            clockService.listVisible[13] = switch_san_francisco.active;

            vertBigView.reset ();
            horizBigView.reset ();
            writeSettings (settingsService.model, clockService);
            settingsService.write ();
		}

        public void writeSettings (SettingsModel settings,
            Multiclock.ClockService clockService)
        {
            settings.wellington = clockService.listVisible[0];
            settings.sydney = clockService.listVisible[1];
            settings.tokio = clockService.listVisible[2];
            settings.seoul = clockService.listVisible[3];
            settings.shanghai = clockService.listVisible[4];
            settings.hong_kong = clockService.listVisible[5];
            settings.singapore = clockService.listVisible[6];
            settings.frankfurt = clockService.listVisible[7];
            settings.zurich = clockService.listVisible[8];
            settings.london = clockService.listVisible[9];
            settings.toronto = clockService.listVisible[10];
            settings.new_york = clockService.listVisible[11];
            settings.chicago = clockService.listVisible[12];
            settings.san_francisco = clockService.listVisible[13];
        }

        private void on_clear_entry(Adw.EntryRow entry){
        }

        private void on_entry_change(Adw.EntryRow entry, Gtk.Button clear){
        }

    	private void on_open_exec(){
        }

        private void on_open_icon () {
       }

        private void on_ok() {
            save ();
            this.close ();
        }

        private void on_cancel (){
            this.close ();
        }

        private bool is_empty(string str) {
            return str.strip().length == 0;
        }

        private void create_desktop_file() {
        }

        private void set_toast (string str){
            var toast = new Adw.Toast (str);
            toast.set_timeout (3);
            overlay.add_toast (toast);
        }

//        private void alert (string heading, string body){
//            var dialog_alert = new Adw.AlertDialog(heading, body);
  //          if (body != "") {
    //            dialog_alert.set_body(body);
      //      }
        //    dialog_alert.add_response("ok", _("_OK"));
          //  dialog_alert.set_response_appearance("ok", SUGGESTED);
//            dialog_alert.response.connect((_) => { dialog_alert.close(); });
  //          dialog_alert.present(this);
//        }
	}
}
