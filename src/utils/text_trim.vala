using Gtk;

namespace MyLib
{
    class TextOperation
    {

        public static string TextTrim(string text, int countTrim, string postfix = "...")
        {
            if (text == null || text.length < countTrim)
                return text;

            string Value = text.substring(0, countTrim - 2) + postfix;

            return Value;
        }
    }
}
