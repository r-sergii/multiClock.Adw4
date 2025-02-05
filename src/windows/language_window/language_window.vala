namespace Multiclock {
	[GtkTemplate (ui = "/ua/multiapps/multiClock/windows/language_window/language_window.ui")]
	public class LanguageWindow : Adw.PreferencesWindow {
        [GtkChild]
        unowned Gtk.Button button_ok;
        [GtkChild]
        unowned Gtk.Button button_cancel;
        [GtkChild]
        unowned Adw.ToastOverlay overlay;
        [GtkChild]
        unowned Gtk.ComboBoxText comboLang;
        [GtkChild]
        unowned Adw.ButtonContent adw_button_ok;
        [GtkChild]
        unowned Adw.ButtonContent adw_button_cancel;
        [GtkChild]
        unowned Adw.WindowTitle adw_title;

        private Multiclock.MainWindow _parent;

		public LanguageWindow (Multiclock.MainWindow __parent)
		{
			Object ();//application: app);
            button_ok.clicked.connect(on_ok);
            button_cancel.clicked.connect(on_cancel);

            _parent = __parent;

		    init ();

		    var app = GLib.Application.get_default();
//            var theme = (app as Multiclock.Application).theme;
            var locale = (app as Multiclock.Application).settingsService.locale;

            adw_button_ok.label = locale.ok;
            adw_button_ok.tooltip_text = locale.yes_rem;
            adw_button_cancel.label = locale.cancel;
            adw_button_cancel.tooltip_text = locale.no_rem;
            adw_title.title = locale.choose_lang;

		}

        private void init() {
            comboLang.append_text("EN English language");
            comboLang.append_text("AF Afrikaanse taal");
            comboLang.append_text("AZ Azərbaycan dili");
            comboLang.append_text("BS Bosanski jezik");
            comboLang.append_text("CS Čeština Jazyk");
            comboLang.append_text("CU Cymraeg iaith"); //Валийский
            comboLang.append_text("DA Dansk sprog"); //Датский
            comboLang.append_text("DE Deutsch sprache");
            comboLang.append_text("ES Español idioma");
            comboLang.append_text("ET Eesti keel"); //Эстонский
            comboLang.append_text("FR Français langue");
            comboLang.append_text("GA Gaeilge teanga"); //Ирландский
            comboLang.append_text("GD Albannach (Ghàidhlig) cànain"); //Шотландский
            comboLang.append_text("FI Suomen kieli");
            comboLang.append_text("HR Hrvatski Jezik");
            comboLang.append_text("HU Magyar nyelv");
            comboLang.append_text("IT Italiano Lingua");
            comboLang.append_text("LB Lëtzebuergesch sprooch"); //Люксембург
            comboLang.append_text("LT Lietuvių kalba");
            comboLang.append_text("LV Latviski valodu");
            comboLang.append_text("NL Nederlands taal");
            comboLang.append_text("NO Norsk språk");
            comboLang.append_text("PL Polski Język");
            comboLang.append_text("PT Português Língua");
            comboLang.append_text("RO Română limba");
            comboLang.append_text("SK Slovenský Jazyk"); //Словацкий
            comboLang.append_text("SL Slovenščina Jezik"); //Словенский
            comboLang.append_text("SQ Shqiptare gjuh"); //Албанский
            comboLang.append_text("SV Svenska språket");
            comboLang.append_text("TR Türk Dili");
            comboLang.append_text("BG Български език");
            comboLang.append_text("MK Македонски јазик");
            comboLang.append_text("UA Українська мова");
            comboLang.append_text("EL ελληνική γλώσσα"); //Греческий");
            comboLang.append_text("AR اللغة العربية"); //Арабский
            comboLang.append_text("FA زبان فارسی"); //Персидский
            comboLang.append_text("HE שפה עברית"); //Иврит
            comboLang.append_text("HI हिन्दी भाषा"); //Хинди
            comboLang.append_text("JA 日本 言語"); //Японский
            comboLang.append_text("KA ქართული ენა"); //Грузинский
            comboLang.append_text("KO 한국인 언어"); //Корейский
            comboLang.append_text("TH ไทย ภาษา"); //Тайский
            comboLang.append_text("VI Tiếng Việt ngôn ngữ "); //Вьетнамский
            comboLang.append_text("ZH 中国人 语"); //Китайский
            comboLang.append_text("RU Русский язык");
            comboLang.set_active(0);
        }

/*
      case 'en':
        return LocaleType.en; //"English language"
      case 'af':
        return LocaleType.nl; //"Afrikaanse taal"
      case 'az':
        return LocaleType.az; //"Azərbaycan dili"
      case 'bs':
        return LocaleType.en; //"Bosanski jezik"
      case 'cs':
        return LocaleType.en; //"Čeština Jazyk"
      case 'cu':
        return LocaleType.en; //"Cymraeg iaith"//Валийский
      case 'da':
        return LocaleType.da; //"Dansk sprog"//Датский
      case 'de':
        return LocaleType.de; //"Deutsch sprache"
      case 'es':
        return LocaleType.es; //"Español idioma"
      case 'et':
        return LocaleType.en; //"Eesti keel"//Эстонский
      case 'fr':
        return LocaleType.fr; //"Français langue"
      case 'ga':
        return LocaleType.en; //"Gaeilge teanga"//Ирландский
      case 'gd':
        return LocaleType.en; //"Albannach (Ghàidhlig) cànain"//Шотландский
      case 'fi':
        return LocaleType.fi; //"Suomen kieli"
      case 'hr':
        return LocaleType.en; //"Hrvatski Jezik"
      case 'hu':
        return LocaleType.en; //"Magyar nyelv"
      case 'it':
        return LocaleType.it; //"Italiano Lingua"
      case 'lb':
        return LocaleType.de; //"Lëtzebuergesch sprooch"//Люксембург
      case 'lt':
        return LocaleType.en; //"Lietuvių kalba"
      case 'lv':
        return LocaleType.en; //"Latviski valodu"
      case 'nl':
        return LocaleType.nl; //"Nederlands taal"
      case 'no':
        return LocaleType.en; //"Norsk språk"
      case 'pl':
        return LocaleType.pl; //"Polski Język"
      case 'pt':
        return LocaleType.pt; //"Português Língua"
      case 'ro':
        return LocaleType.it; //"Română limba"
      case 'sk':
        return LocaleType.en; //"Slovenský Jazyk"//Словацкий
      case 'sl':
        return LocaleType.en; //"Slovenščina Jezik"//Словенский
      case 'sq':
        return LocaleType.sq; //"Shqiptare gjuh"//Албанский
      case 'sv':
        return LocaleType.sv; //"Svenska språket"
      case 'tr':
        return LocaleType.tr; //"Türk Dili"
      case 'bg':
        return LocaleType.bg; //"Български език"
      case 'mk':
        return LocaleType.en; //"Македонски јазик"
      case 'uk':
        return LocaleType.uk; //"Українська мова"
      case 'el':
        return LocaleType.en; //"ελληνική γλώσσα"//Греческий
      case 'ar':
        return LocaleType.ar; //"اللغة العربية"//Арабский
      case 'fa':
        return LocaleType.fa; //"زبان فارسی"//Персидский
      case 'he':
        return LocaleType.he; //"שפה עברית"//Иврит
      case 'hi':
        return LocaleType.en; //"हिन्दी भाषा"//Хинди
      case 'ja':
        return LocaleType.jp; //"日本 言語"//Японский
      case 'ka':
        return LocaleType.en; //"ქართული ენა"//Грузинский
      case 'ko':
        return LocaleType.ko; //"한국인 언어"//Корейский
      case 'th':
        return LocaleType.th; //"ไทย ภาษา"//Тайский
      case 'vi':
        return LocaleType.vi; //"Tiếng Việt ngôn ngữ "//Вьетнамский
      case 'zh':
        return LocaleType.zh; //"中国人 语"//Китайский
      default:
        return LocaleType.en; //"English language"

*/
        private void on_ok() {
            GLib.Array<string> arrLang = new GLib.Array<string> ();
            arrLang.append_val ("EN");
            arrLang.append_val ("AF");
            arrLang.append_val ("AZ");
            arrLang.append_val ("BS");
            arrLang.append_val ("CS");
            arrLang.append_val ("CU"); //Валийский
            arrLang.append_val ("DA"); //Датский
            arrLang.append_val ("DE");
            arrLang.append_val ("ES");
            arrLang.append_val ("ET");
            arrLang.append_val ("FR");
            arrLang.append_val ("GA"); //Ирландский
            arrLang.append_val ("GD"); //Шотландский
            arrLang.append_val ("FI");
            arrLang.append_val ("HR");
            arrLang.append_val ("HU");
            arrLang.append_val ("IT");
            arrLang.append_val ("LB"); //Люксембург
            arrLang.append_val ("LT");
            arrLang.append_val ("LV");
            arrLang.append_val ("NL");
            arrLang.append_val ("NO");
            arrLang.append_val ("PL");
            arrLang.append_val ("PT");
            arrLang.append_val ("RO");
            arrLang.append_val ("SK");
            arrLang.append_val ("SL");
            arrLang.append_val ("SQ");
            arrLang.append_val ("SV");
            arrLang.append_val ("TR");
            arrLang.append_val ("BG");
            arrLang.append_val ("MK");
            arrLang.append_val ("UK");
            arrLang.append_val ("EL");
            arrLang.append_val ("AR");
            arrLang.append_val ("FA");
            arrLang.append_val ("HE");
            arrLang.append_val ("HI");
            arrLang.append_val ("JA");
            arrLang.append_val ("KA");
            arrLang.append_val ("KO");
            arrLang.append_val ("TH");
            arrLang.append_val ("VI");
            arrLang.append_val ("ZH");
            arrLang.append_val ("RU");
            // not work
//            Gtk.StringList listLang = new Gtk.StringList(["EN","DE","ES","FR","IT","PL","PT","BG","UA","RU"]);

            var app = GLib.Application.get_default();
            var settingsService = (app as Multiclock.Application).settingsService;

            //this.close ();
            Multiclock.TranslatorService translateService = new TranslatorService ();
            message (arrLang.index(comboLang.get_active()));
            if(comboLang.get_active() == 0) {
                translateService.reinitModel ( settingsService.locale );
            }
            else {
                translateService.getDataItems(arrLang.index(comboLang.get_active()));
//                settingsService.locale.locale = arrLang.index(comboLang.get_active());
                translateService.fillModel( settingsService.locale, arrLang.index(comboLang.get_active()) );
            }

            //settingsService.locale.toSettings (settingsService.settings);
            settingsService.writeLocale ();

            _parent.init_menu ();
            this.close ();
        }

        private void on_cancel (){
            this.close ();
        }

        private void set_toast (string str){
            var toast = new Adw.Toast (str);
            toast.set_timeout (3);
            overlay.add_toast (toast);
        }

        private void alert (string heading, string body){
            var dialog_alert = new Adw.AlertDialog(heading, body);
            if (body != "") {
                dialog_alert.set_body(body);
            }
            dialog_alert.add_response("ok", _("_OK"));
            dialog_alert.set_response_appearance("ok", SUGGESTED);
            dialog_alert.response.connect((_) => { dialog_alert.close(); });
            dialog_alert.present(this);
        }
	}
}
