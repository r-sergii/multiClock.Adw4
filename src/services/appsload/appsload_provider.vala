namespace Multiclock {

    class AppsLoadProvider {
        const string baseUrl = "https://multiapps-seven.vercel.app/api/appsload";

        Http.Client http;

        public AppsLoadProvider() {
            http = new Http.Client();
        }

        public void insertItem ( AppsLoadModel model ) {
            var host = baseUrl;

            message (model.application);
            message (model.platform);
            message (model.email);
            message (model.uid);
            message (model.device);
            message (model.locale);
            message (model.datetime.to_string ());

            //Gee.HashMap<string,string>
            var data = new Gee.HashMap<string,string>();
            data.set ( AppsLoadField.application, model.application );
            data.set ( AppsLoadField.platform, model.platform );
            data.set ( AppsLoadField.email, model.email );
            data.set ( AppsLoadField.uid, model.uid );
            data.set ( AppsLoadField.device, model.device );
            data.set ( AppsLoadField.locale, model.locale );
            data.set ( AppsLoadField.datetime, model.datetime.to_string () );

            try {
                var response = http.post_form( host, data );
                if ( response.status.code == 200 ){
                    //stdout.printf(@"My public IP address is: $(response)\n");
                    message (response.to_string ());

                }
            } catch (Error err){
                stderr.printf(@"$(err.message)\n");
                //return false;
            }
        }
    }
}
