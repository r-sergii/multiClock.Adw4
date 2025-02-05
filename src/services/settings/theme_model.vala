namespace Multiclock {

    public abstract class ThemeField {
        public const string theme = "theme";
    }

    public class ThemeModel {
        public int theme;

        public ThemeModel() {
            theme = 0;
        }

        public void fromSettings (GLib.Settings settings)
        {
//            ThemeField themeField = new ThemeField();

            theme = settings.get_int (ThemeField.theme);
        }

        public void toSettings (GLib.Settings settings)
        {
//            ThemeField themeField = new ThemeField();

            settings.set_int (ThemeField.theme, theme);
        }
    }
}
