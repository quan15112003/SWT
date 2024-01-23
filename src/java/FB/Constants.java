package FB;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author Hoang Long
 */
public class Constants {

    public static String FACEBOOK_APP_ID = "808055917596266";
    public static String FACEBOOK_APP_SECRET = "bdd3ed02ac53958c31d243e40756063d";
    public static String FACEBOOK_REDIRECT_URL = "http://localhost:9999/project/login-facebook";
    public static String FACEBOOK_LINK_GET_TOKEN = "https://graph.facebook.com/oauth/access_token?client_id=%s&client_secret=%s&redirect_uri=%s&code=%s";

    public static String GOOGLE_CLIENT_ID
            = "200695014267-347in3eam2f8ff2q37kt3006m2hkic65.apps.googleusercontent.com";
    public static String GOOGLE_CLIENT_SECRET = "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";
    public static String GOOGLE_REDIRECT_URI = "http://localhost:9999/project/login-google";
    public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
    public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
    public static String GOOGLE_GRANT_TYPE = "authorization_code";

}
