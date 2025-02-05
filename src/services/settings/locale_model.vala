namespace Multiclock {

    public abstract class LocaleField {
        public const string locale = "locale";
        public const string loading = "loading";
        public const string language = "language";
        public const string towns = "towns";
        public const string about = "about";
        public const string quit = "quit";
        public const string ok = "ok";
        public const string cancel = "cancel";
        public const string close = "close";
        public const string choose_lang = "choose-lang";
        public const string yes_rem = "yes-rem";
        public const string no_rem = "no-rem";
        public const string choose_cities = "choose-cities";
        public const string bad_inet = "bad-inet";
        public const string make_connect = "make-connect";
        public const string exit_ = "exit";
        public const string are_exit = "are-exit";
    }

    const char SPACE = 32;

    public class LocaleModel {
        public string locale;
        public string loading;
        public string language;
        public string towns;
        public string about;
        public string quit;
        public string ok;
        public string cancel;
        public string close;
        public string choose_lang;
        public string yes_rem;
        public string no_rem;
        public string choose_cities;
        public string bad_inet;
        public string make_connect;
        public string exit_;
        public string are_exit;

        public LocaleModel() {
            reinit ();
        }

        public void for_translate () {
            locale = "EN";
            loading = "Loading...";
            language = "Language";
            towns = "Towns";
            about = "About";
            quit = "Quit";
            ok = "Ok";
            cancel = "Cancel";
            close = "Close";
            choose_lang = "Choose%20language%20for%20application";
            yes_rem = "Apply%20your%20selection";
            no_rem = "Undo%20changes";
            choose_cities = "Choose%20cities%20to%20show";
            bad_inet = "No%20access%20to%20the%20internet";
            make_connect = "Make%20the%20connection%20and%20try%20again";
            exit_ = "Exit?";
            are_exit = "Are%20you%20sure%20you%20want%20to%20exit?";
        }

        public void reinit () {
            locale = "EN";
            loading = "Loading...";
            language = "Language";
            towns = "Towns";
            about = "About";
            quit = "Quit";
            ok = "Ok";
            cancel = "Cancel";
            close = "Close";
            choose_lang = "Choose language for application";
            yes_rem = "Apply your selection";
            no_rem = "Undo changes";
            choose_cities = "Choose cities to show";
            bad_inet = "No access to the internet";
            make_connect = "Make the connection and try again";
            exit_ = "Exit?";
            are_exit = "Are you sure you want to exit?";
        }

        public void fromSettings (GLib.Settings settings)
        {
//            LocaleField localeField = new LocaleField();

            locale = settings.get_string (LocaleField.locale);
            loading = settings.get_string (LocaleField.loading);
            language = settings.get_string (LocaleField.language);
            towns = settings.get_string (LocaleField.towns);
            about = settings.get_string (LocaleField.about);
            quit = settings.get_string (LocaleField.quit);
            ok = settings.get_string (LocaleField.ok);
            cancel = settings.get_string (LocaleField.cancel);
            close = settings.get_string (LocaleField.close);
            choose_lang = settings.get_string (LocaleField.choose_lang);
            yes_rem = settings.get_string (LocaleField.yes_rem);
            no_rem = settings.get_string (LocaleField.no_rem);
            choose_cities = settings.get_string (LocaleField.choose_cities);
            bad_inet = settings.get_string (LocaleField.bad_inet);
            make_connect = settings.get_string (LocaleField.make_connect);
            exit_ = settings.get_string (LocaleField.exit_);
            are_exit = settings.get_string (LocaleField.are_exit);
        }

        public void toSettings (GLib.Settings settings)
        {
//            LocaleField localeField = new LocaleField();

            settings.set_string (LocaleField.locale, locale);
            settings.set_string (LocaleField.loading, loading);
            settings.set_string (LocaleField.language, language);
            settings.set_string (LocaleField.towns, towns);
            settings.set_string (LocaleField.about, about);
            settings.set_string (LocaleField.quit, quit);
            settings.set_string (LocaleField.ok, ok);
            settings.set_string (LocaleField.cancel, cancel);
            settings.set_string (LocaleField.close, close);
            settings.set_string (LocaleField.choose_lang, choose_lang);
            settings.set_string (LocaleField.yes_rem, yes_rem);
            settings.set_string (LocaleField.no_rem, no_rem);
            settings.set_string (LocaleField.choose_cities, choose_cities);
            settings.set_string (LocaleField.bad_inet, bad_inet);
            settings.set_string (LocaleField.make_connect, make_connect);
            settings.set_string (LocaleField.exit_, exit_);
            settings.set_string (LocaleField.are_exit, are_exit);
        }

    }
}
