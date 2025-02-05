namespace Multiclock {

    public abstract class SettingsField {
        public const string wellington = "wellington";
        public const string sydney = "sydney";
        public const string tokio = "tokio";
        public const string seoul = "seoul";
        public const string shanghai = "shanghai";
        public const string hong_kong = "hong-kong";
        public const string singapore = "singapore";
        public const string frankfurt = "frankfurt";
        public const string zurich = "zurich";
        public const string london = "london";
        public const string toronto = "toronto";
        public const string new_york = "new-york";
        public const string chicago = "chicago";
        public const string san_francisco = "san-francisco";
    }

    public class SettingsModel {
        public bool wellington;
        public bool sydney;
        public bool tokio;
        public bool seoul;
        public bool shanghai;
        public bool hong_kong;
        public bool singapore;
        public bool frankfurt;
        public bool zurich;
        public bool london;
        public bool toronto;
        public bool new_york;
        public bool chicago;
        public bool san_francisco;

        public SettingsModel() {
            wellington = true;
            sydney = true;
            tokio = true;
            seoul = true;
            shanghai = true;
            hong_kong = true;
            singapore = true;
            frankfurt = true;
            zurich = true;
            london = true;
            toronto = true;
            new_york = true;
            chicago = true;
            san_francisco = true;
        }

        public void fromSettings (GLib.Settings settings)
        {
/*            wellington = settings.get_boolean ("wellington");
            sydney = settings.get_boolean ("sydney");
            tokio = settings.get_boolean ("tokio");
            seoul = settings.get_boolean ("seoul");
            shanghai = settings.get_boolean ("shanghai");
            hong_kong = settings.get_boolean ("hong-kong");
            singapore = settings.get_boolean ("singapore");
            frankfurt = settings.get_boolean ("frankfurt");
            zurich = settings.get_boolean ("zurich");
            london = settings.get_boolean ("london");
            toronto = settings.get_boolean ("toronto");
            new_york = settings.get_boolean ("new-york");
            chicago = settings.get_boolean ("chicago");
            san_francisco = settings.get_boolean ("san-francisco");
*/
//            SettingsField settingsField = new SettingsField();

            wellington = settings.get_boolean (SettingsField.wellington);
            sydney = settings.get_boolean (SettingsField.sydney);
            tokio = settings.get_boolean (SettingsField.tokio);
            seoul = settings.get_boolean (SettingsField.seoul);
            shanghai = settings.get_boolean (SettingsField.shanghai);
            hong_kong = settings.get_boolean (SettingsField.hong_kong);
            singapore = settings.get_boolean (SettingsField.singapore);
            frankfurt = settings.get_boolean (SettingsField.frankfurt);
            zurich = settings.get_boolean (SettingsField.zurich);
            london = settings.get_boolean (SettingsField.london);
            toronto = settings.get_boolean (SettingsField.toronto);
            new_york = settings.get_boolean (SettingsField.new_york);
            chicago = settings.get_boolean (SettingsField.chicago);
            san_francisco = settings.get_boolean (SettingsField.san_francisco);
        }

        public void toSettings (GLib.Settings settings)
        {
/*            settings.set_boolean ("wellington", wellington);
            settings.set_boolean ("sydney", sydney);
            settings.set_boolean ("tokio", tokio);
            settings.set_boolean ("seoul", seoul);
            settings.set_boolean ("shanghai", shanghai);
            settings.set_boolean ("hong-kong", hong_kong);
            settings.set_boolean ("singapore", singapore);
            settings.set_boolean ("frankfurt", frankfurt);
            settings.set_boolean ("zurich", zurich);
            settings.set_boolean ("london", london);
            settings.set_boolean ("toronto", toronto);
            settings.set_boolean ("new-york", new_york);
            settings.set_boolean ("chicago", chicago);
            settings.set_boolean ("san-francisco", san_francisco);
*/
//            SettingsField settingsField = new SettingsField();

            settings.set_boolean (SettingsField.wellington, wellington);
            settings.set_boolean (SettingsField.sydney, sydney);
            settings.set_boolean (SettingsField.tokio, tokio);
            settings.set_boolean (SettingsField.seoul, seoul);
            settings.set_boolean (SettingsField.shanghai, shanghai);
            settings.set_boolean (SettingsField.hong_kong, hong_kong);
            settings.set_boolean (SettingsField.singapore, singapore);
            settings.set_boolean (SettingsField.frankfurt, frankfurt);
            settings.set_boolean (SettingsField.zurich, zurich);
            settings.set_boolean (SettingsField.london, london);
            settings.set_boolean (SettingsField.toronto, toronto);
            settings.set_boolean (SettingsField.new_york, new_york);
            settings.set_boolean (SettingsField.chicago, chicago);
            settings.set_boolean (SettingsField.san_francisco, san_francisco);

        }
    }
}
