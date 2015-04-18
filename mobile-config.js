/*
* Filename: mobile-config.js
* Author: @rabbitfightter81
* Purpose: Mobile configurations
*/

// This section sets up some basic app metadata,
// the entire section is optional.

App.info({
  id: 'com.rfs.wordsleuth',
  name: 'Word Sleuth',
  description: 'Find anagrams, sub-words, and more with Word sleuth',
  author: 'Rabbit Fighter Studios',
  email: 'rabbitfighter@cryptolab.nett',
  website: 'http://rabbitfighter.net'
});


// Set up resources such as icons and launch screens.
App.icons({

  /* 
  * icons -- objects
  * =====    =======
  * An Object where the keys are different devices and screen sizes, 
  * and values are image paths relative to the project root directory.
  */
  'iphone': 'public/icons/icon.png',
  'iphone_2x': 'public/icons/icon.png',
  'iphone_3x': 'public/icons/icon.png',
  'ipad': 'public/icons/icon.png',
  'ipad_2x': 'public/icons/icon.png',
  'android_ldpi': 'public/icons/icon.png',
  'android_mdpi': 'public/icons/icon.png',
  'android_hdpi': 'public/icons/icon.png',
  'android_xhdpi': 'public/icons/icon.png',
  // ... more screen sizes and platforms ...
});

/*
// Set up launch screens
App.launchScreens({
  
  * launchScreens -- Object
  * =============    ======
  * A dictionary where keys are different devices, screen sizes, 
  * and orientations, and the values are image paths relative to 
  * the project root directory.
  * For Android, launch screen images should be special "Nine-patch" 
  * image files that specify how they should be stretched. 
  * See the Android docs.
 
  'iphone': 'public/splash_screens/splash_screen_320x426.png',                  //320x426
  'iphone_2x': 'public/splash_screens/splash_screen_480x640.png',               //480x640
  'iphone5': 'public/splash_screens/splash_screen_480x640.png',                 //480x640
  'iphone6': 'public/splash_screens/splash_screen_480x640.png',                 //480x640
  'iphone6p_portrait': 'public/splash_screens/splash_screen_480x640.png',       //480x640
  'iphone6p_landscape': 'public/splash_screens/splash_screen_640x480.png',      //640x480
  'ipad_portrait': 'public/splash_screens/splash_screen_768x1024.png',          //768x1024        
  'ipad_portrait_2x': 'public/splash_screens/splash_screen_768x1024.png',       //768x1024
  'ipad_landscape': 'public/splash_screens/splash_screen_1024x768.png',         //1024x768
  'ipad_landscape_2x': 'public/splash_screens/splash_screen_1024x768.png',      //1024x768                    
  'android_ldpi_portrait': 'public/splash_screens/splash_screen_320x426.png',   //320x426
  'android_ldpi_landscape': 'public/splash_screens/splash_screen_426x320.png',  //426x320
  'android_mdpi_portrait': 'public/splash_screens/splash_screen_320x470.png',   //320x470
  'android_mdpi_landscape': 'public/splash_screens/splash_screen_470x320.png',  //470x320
  'android_hdpi_portrait': 'public/splash_screens/splash_screen_480x640.png',   //480x640
  'android_hdpi_landscape': 'public/splash_screens/splash_screen_640x480.png',  //640x480
  'android_xhdpi_portrait': 'public/splash_screens/splash_screen_720x1280.png', //720x1280
  'android_xhdpi_landscape': 'public/splash_screens/splash_screen_1280x720.png',//1280x720
  // ... more screen sizes and platforms ...
});

*/
 
// Set PhoneGap/Cordova preferences
App.setPreference('BackgroundColor', '0x#333333ff'); //'0xff0000ff'); // replaced bg color
App.setPreference('HideKeyboardFormAccessoryBar', true);

/*
// Pass preferences for a particular PhoneGap/Cordova plugin
App.configurePlugin('com.phonegap.plugins.facebookconnect', {
  //APP_ID: '1234567890',
  //API_KEY: 'supersecretapikey'
});
*/