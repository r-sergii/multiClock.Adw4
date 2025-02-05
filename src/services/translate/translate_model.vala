namespace Multiclock {

    public abstract class TranslatorField {
        public const string lang = "lang";
        public const string words = "words";
        public const string original = "original";
        public const string translation = "translation";
    }

    public class TranslatorModel {
        public string lang;
        public string words;

        public TranslatorModel(string _lang) {//, string _words) {
            lang = _lang;
            words = "";//_words;
        }
    }

    public class ResultTranslatorModel {
        public string original;
        public string translation;

        public ResultTranslatorModel(string _original, string _translation) {
            original = _original;
            translation = _translation;
        }

        public ResultTranslatorModel.fromJson (Json.Node item) {
//            TranslatorField translatorField = new TranslatorField();

            Json.Object obj = item.get_object ();
            foreach(unowned string name in obj.get_members ()) {
                switch(name) {
                    case TranslatorField.original:
                        unowned Json.Node it = obj.get_member (name);
                        original = obj.get_string_member (TranslatorField.original);
//                        message (original);
                        break;
                    case TranslatorField.translation:
                        unowned Json.Node it = obj.get_member (name);
                        translation = obj.get_string_member (TranslatorField.translation);
//                        message (translation);
                        break;
                    default:
                        break;
                }
            }
        }
    }
}


