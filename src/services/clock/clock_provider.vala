namespace Multiclock {

    class ClockProvider {
        const string baseUrl = "https://multiapps-seven.vercel.app/api/clock/";

        Http.Client http;

        public ClockProvider() {
            http = new Http.Client();
        }

        public void getItems ( Gee.ArrayList<ClockModel> listClocks ) {
            var host = baseUrl;// + "/read";
            var path = "/api/clock/";

//            var http = new Http.Client();

            try {
                var response = http.get( host );
                if ( response.status.code == 200 ){
                    //stdout.printf(@"My public IP address is: $(response)\n");
//                    message (response.to_string ());

                    var parser = new Json.Parser ();
                    parser.load_from_data ((string)response.to_string (), -1);
                    unowned Json.Node node = parser.get_root();
                    unowned Json.Array arr = node.get_array();
                    int i = 0;
                    foreach(unowned Json.Node item in arr.get_elements ()) {
                        listClocks.add (new ClockModel.fromJson (item) );

                        i++;
                        message(i.to_string());
                    }
                }
            } catch (Error err){
                stderr.printf(@"$(err.message)\n");
            }
        }
    }
}

