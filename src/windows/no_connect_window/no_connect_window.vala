namespace Multiclock {


    public class NoConnectWindow : Adw.Window {

        private Gtk.Box main_box;
//        private CircularProgressWidgets.CircularProgressBar pbar;

        public NoConnectWindow (Gtk.Application app) {
            Object (application: app, default_width: 320);
        }

        construct{
            var logo = new Gtk.Image.from_icon_name("no_connect128") {
                pixel_size = 128
            };

            //get current theme
            var app = GLib.Application.get_default();
//            var theme = (app as Multiclock.Application).theme;
            var locale = (app as Multiclock.Application).settingsService.locale;

            Gtk.Label title = new Gtk.Label("multiClock");
            title.set_markup ("<span size='22000'> multiClock </span>");
//            Gtk.Label noconnect = new Gtk.Label("No access to the internet");
  //          Gtk.Label tryagain = new Gtk.Label("Make the connection and try again");
    //        Gtk.Button close = new Gtk.Button.with_label ("Close");
            Gtk.Label noconnect = new Gtk.Label(locale.bad_inet);
            Gtk.Label tryagain = new Gtk.Label(locale.make_connect);
            Gtk.Button close = new Gtk.Button.with_label (locale.close);
            close.set_can_shrink (true);
            close.set_halign(Gtk.Align.CENTER);
            close.clicked.connect (close_app);

            //Gtk.Grid grid = new Gtk.Grid ();
            //grid.set_halign(Gtk.Align.CENTER);
            //grid.set_vexpand(true);

            //grid.attach (new Gtk.Label (""), 0, 0, 1, 1);
            //grid.attach (close, 1, 0, 1, 1);
            //grid.attach (new Gtk.Label (""), 2, 0, 1, 1);

            main_box = new Gtk.Box(Gtk.Orientation.VERTICAL, 5);
            main_box.margin_top = 10;
            main_box.append (logo);
            main_box.append (title);
            main_box.append (noconnect);
            main_box.append (tryagain);
            main_box.append (close);
            main_box.margin_bottom = 10;

            this.set_content(main_box);
        }

        void close_app () {
            var app = GLib.Application.get_default();
            app.quit ();
        }
    }
}
