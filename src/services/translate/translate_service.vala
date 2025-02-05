namespace Multiclock {

    public class TranslatorService {

        private LocaleModel __currentLocale;
        public Gee.ArrayList<ResultTranslatorModel> listTranslator;

        public TranslatorService() {
            __currentLocale = new LocaleModel();
            listTranslator = new Gee.ArrayList<ResultTranslatorModel> ();
        }

        public Multiclock.LocaleModel currentLocale {
            get {
                return __currentLocale;
            }
        }

        public void getDataItems (string local) {
            listTranslator.clear ();
            var temp = new LocaleModel();
            temp.for_translate ();
            var translateModel = new TranslatorModel(local);
            translateModel.words = temp.loading + ";" + temp.language + ";" + temp.towns + ";"
                + temp.about + ";" + temp.quit + ";" + temp.ok + ";" + temp.cancel + ";"
                + temp.close + ";" + temp.choose_lang + ";" + temp.yes_rem + ";" + temp.no_rem + ";"
                + temp.choose_cities + ";" + temp.bad_inet + ";" + temp.exit_ + ";"
                + temp.make_connect + ";" + temp.are_exit;

            message (translateModel.lang);
            message (translateModel.words);
            var translateProvider = new TranslatorProvider ();
            translateProvider.getItems ( translateModel, listTranslator );
            //_currentLocale.locale = translateModel.lang;

            message (listTranslator.size.to_string ());
        }

        public void reinitModel (LocaleModel _currentLocale) {
            _currentLocale.reinit ();
        }

        public void fillModel (LocaleModel _currentLocale, string local) {
            _currentLocale.locale = local;
            message (_currentLocale.locale);

            for(int i = 0;i<listTranslator.size;i++) {
                message(listTranslator[i].translation);
                switch (listTranslator[i].original)
                {
                    case "Loading...":
                        _currentLocale.loading = listTranslator[i].translation;
                        break;
                    case "Language":
                        _currentLocale.language = listTranslator[i].translation;
                        break;
                    case "Towns":
                        _currentLocale.towns = listTranslator[i].translation;
                        break;
                    case "About":
                        _currentLocale.about = listTranslator[i].translation;
                        break;
                    case "Quit":
                        _currentLocale.quit = listTranslator[i].translation;
                        break;
                    case "Ok":
                        _currentLocale.ok = listTranslator[i].translation;
                        break;
                    case "Cancel":
                        _currentLocale.cancel = listTranslator[i].translation;
                        break;
                    case "Close":
                        _currentLocale.close = listTranslator[i].translation;
                        break;
                    case "Choose language for application":
                        _currentLocale.choose_lang = listTranslator[i].translation;
                        break;
                    case "Apply your selection":
                        _currentLocale.yes_rem = listTranslator[i].translation;
                        break;
                    case "Undo changes":
                        _currentLocale.no_rem = listTranslator[i].translation;
                        break;
                    case "Choose cities to show":
                        _currentLocale.choose_cities = listTranslator[i].translation;
                        break;
                    case "No access to the internet":
                        _currentLocale.bad_inet = listTranslator[i].translation;
                        break;
                    case "Make the connection and try again":
                        _currentLocale.make_connect = listTranslator[i].translation;
                        break;
                    case "Exit?":
                        _currentLocale.exit_ = listTranslator[i].translation;
                        break;
                    case "Are you sure you want to exit?":
                        _currentLocale.are_exit = listTranslator[i].translation;
                        break;
                    default:
                        break;
                }
            }
            //listTranslator.foreach ((e) => {  });
        }
    }
}
