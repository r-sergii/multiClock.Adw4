using Gtk;

namespace Multiclock {
    [GtkTemplate (ui = "/ua/multiapps/multiClock/windows/main_window/main_window.ui")]
    public class MainWindow : Gtk.ApplicationWindow {
        [GtkChild]
        private unowned Gtk.Box mainBox;//list;
        private MyLib.ThemeSwitcher theme_switcher;
        [GtkChild]
        private unowned Gtk.MenuButton menu_button;

        private Multiclock.VertBigView vertBigView;
        private Multiclock.HorizBigView horizBigView;
        private bool isVert;
        private Gtk.ScrolledWindow scroll;

        private MyLib.CustomMenuItem lang2;
        private MyLib.CustomMenuItem town2;

        public MainWindow (Gtk.Application app) {
            Object (application: app);
            this.bind_property("default-width", this, "windowWidth", BindingFlags.DEFAULT | BindingFlags.SYNC_CREATE);
            this.bind_property("default-height", this, "windowHeight", BindingFlags.DEFAULT | BindingFlags.SYNC_CREATE);
            this.bind_property("maximized", this, "isMaximized", BindingFlags.DEFAULT | BindingFlags.SYNC_CREATE);
        }

        public void init_menu () {
/*
            //var
            lang2 = new MyLib.CustomMenuItem ();
            lang2.pref = "Language";
            lang2.suf = "De";
            lang2.button.clicked.connect (this.on_language_action);
            pop.add_child (lang2, "lang");

            town2 = new MyLib.CustomMenuItem ();
            town2.pref = "Towns";
            town2.suf = "";
            town2.button.clicked.connect (this.on_towns_action);
            pop.add_child (town2, "town");
*/
            var app = GLib.Application.get_default();
            var locale = (app as Multiclock.Application).settingsService.locale;

            var menu = new GLib.Menu();
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            var item_theme = new GLib.MenuItem (_("custom"), null);//"app.set_app_theme");
            item_theme.set_attribute ("custom", "s", "theme");
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//            var item_preferences = new GLib.MenuItem (_("Preferences"), "app.preferences");
            var item_language = new GLib.MenuItem (_(locale.language), "app.language");
            var item_towns = new GLib.MenuItem (_(locale.towns), "app.towns");
            var item_about = new GLib.MenuItem (_(locale.about +" multiClock"), "app.about");
            var item_quit = new GLib.MenuItem (_(locale.exit_), "app.quit");

            message (locale.locale);

            menu.append_item (item_theme);
//            menu.append_item (item_preferences);
            menu.append_item (item_language);
            menu.append_item (item_towns);
            menu.append_item (item_about);
            menu.append_item (item_quit);

            var pop = (Gtk.PopoverMenu) this.menu_button.get_popover ();
            pop.set_menu_model (menu);

            this.theme_switcher = new MyLib.ThemeSwitcher ();
            pop.add_child (this.theme_switcher, "theme");
        }

        construct{
//            var pop = (Gtk.PopoverMenu) this.menu_button.get_popover ();
  //          this.theme_switcher = new MyLib.ThemeSwitcher ();
    //        pop.add_child (this.theme_switcher, "theme");

            init_menu ();

            //Gtk.ScrolledWindow
            scroll = new Gtk.ScrolledWindow ();//null, null);
            scroll.set_policy (Gtk.PolicyType.AUTOMATIC, Gtk.PolicyType.AUTOMATIC);
            scroll.set_vexpand(true);
            scroll.set_hexpand(true);

            vertBigView = new VertBigView ();
            horizBigView = new HorizBigView ();
            var app = GLib.Application.get_default();

            (app as Multiclock.Application).vertBigView = vertBigView;
            (app as Multiclock.Application).horizBigView = horizBigView;

            applyView ();
            mainBox.append (scroll);

            applyLocale ();
        }

        private void applyLocale () {
            //get current theme
//            var app = GLib.Application.get_default();
//            var locale = (application as Multiclock.Application).settingsService.locale;
        }


        private void applyView () {
            if (windowHeight >= windowWidth) {
                scroll.set_child (vertBigView);
                isVert = true;
            }
            else {
                scroll.set_child (horizBigView);
                isVert = false;
            }

        }

/////// Size determination
        public int windowHeight {
            get { return get_height(); }
            set {
                Idle.add(() => {
                    print(@"window height: $value\n");
                    return Source.REMOVE;
                });
                if ((windowHeight >= windowWidth) && (isVert != true)) {
                    applyView ();
                }
                if ((windowHeight < windowWidth) && (isVert == true)) {
                    applyView ();
                }
            }
        }

        public int windowWidth {
            get { return get_width(); }
            set {
                Idle.add(() => {
                    print(@"window width: $value\n");
                    return Source.REMOVE;
                });
                //grid.set_size_request (get_width (), get_height ());
                if ((windowHeight >= windowWidth) && (isVert != true)) {
                    applyView ();
                }
                if ((windowHeight < windowWidth) && (isVert == true)) {
                    applyView ();
                }
            }
        }

        public bool isMaximized {
            get { return maximized; }
            set {
                Idle.add(() => {
                    print(@"window maximized: $isMaximized; width: $(get_width())\n");
                    return Source.REMOVE;
                });
                if ((windowHeight >= windowWidth) && (isVert != true)) {
                    applyView ();
                }
                if ((windowHeight < windowWidth) && (isVert == true)) {
                    applyView ();
                }
            }
        }
/////???
        private void init_style_menu (Gtk.PopoverMenu pop) {
            GLib.Menu menu = new GLib.Menu ();
            var manager = new GtkSource.StyleSchemeManager ();
            var ids = manager.get_scheme_ids ();
            foreach (string id in ids) {
                menu.append (id, @"win.set_editor_theme::$id");
            }
            var model = (GLib.Menu) pop.get_menu_model ();
            model.insert_submenu (3, _ ("Editor Theme"), menu);
        }
///////////

        private void on_towns () {
            message ("towns action activated");

            var towns = new Multiclock.TownsWindow ();//vertBigView);
            //settings.set_transient_for (this);
            towns.show ();
        }

        private void on_language_action () {
            message ("language action show activated");

            var language = new Multiclock.LanguageWindow (this);
            language.set_transient_for (this);
            language.show ();

            var pop = (Gtk.PopoverMenu) this.menu_button.get_popover ();
            pop.hide ();
        }

        private void on_towns_action () {
            message ("towns action show activated");

            var towns = new Multiclock.TownsWindow ();
            towns.set_transient_for (this);
            towns.show ();

            var pop = (Gtk.PopoverMenu) this.menu_button.get_popover ();
            pop.hide ();

        }

        public void on_close_application () {
            var app = GLib.Application.get_default();
            call_are_exit_dialog (app);
            //app.quit();
            //return true;
        }


        private void call_save_changes_dialog () {
            var save_changes_dialog = new Adw.MessageDialog(this, _("Changes are not saved"), _("Save changes to the current note before exiting the program?"));
            save_changes_dialog.add_response("cancel", _("_Cancel"));
            save_changes_dialog.add_response("ok", _("_OK"));
            save_changes_dialog.set_default_response("ok");
            save_changes_dialog.set_close_response("cancel");
            save_changes_dialog.set_response_appearance("ok", SUGGESTED);
            save_changes_dialog.show();
            save_changes_dialog.response.connect((response) => {
                if (response == "ok") {
                    try {
                         //FileUtils.set_contents (file.get_path(), edit_text);
                         //app.quit();
                    } catch (Error e) {
                         stderr.printf ("Error: %s\n", e.message);
                    }
                }
                save_changes_dialog.close();
                //app.quit();
            });
        }

        private void call_are_exit_dialog (GLib.Application app) {
//            var app = GLib.Application.get_default();
//            var theme = (app as Multiclock.Application).theme;
            var locale = (app as Multiclock.Application).settingsService.locale;

//            var are_exit_dialog = new Adw.MessageDialog(this, _("Exit?"), _("Are you sure you want to exit?"));
  //          are_exit_dialog.add_response("cancel", _("_Cancel"));
    //        are_exit_dialog.add_response("ok", _("_Exit"));
            var are_exit_dialog = new Adw.MessageDialog(this, _(locale.exit_), _(locale.are_exit));
            are_exit_dialog.add_response("cancel", _(locale.cancel));
            are_exit_dialog.add_response("ok", _(locale.exit_));
            are_exit_dialog.set_default_response("ok");
            are_exit_dialog.set_close_response("cancel");
            are_exit_dialog.set_response_appearance("ok", SUGGESTED);
            are_exit_dialog.show();
            are_exit_dialog.response.connect((response) => {
                if (response == "ok") {
                    try {
                         app.quit();
                    } catch (Error e) {
                         stderr.printf ("Error: %s\n", e.message);
                    }
                }
                are_exit_dialog.close();
                //app.quit();
            });
        }

    }
}
