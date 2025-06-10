// NOTE: Basic config

// Startup page will restore previous session
user_pref("browser.startup.page", 3);

// Newpage config, Only show web search
user_pref("browser.newtabpage.activity-stream.showSearch", true);
user_pref("browser.newtabpage.activity-stream.showWeather", false);
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.feeds.sections", false);
user_pref("browser.newtabpage.activity-stream.showRecentSaves", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);

// Bookmark visibility
user_pref("browser.toolbars.bookmarks.visibility", "always");

// Fullscreen apis to behave like default Xmonad
user_pref("browser.fullscreen.autohide", false);
user_pref("full-screen-api.ignore-widgets", true);

// History and downloads
user_pref("privacy.cpd.cache", true); // [DEFAULT: true]
user_pref("privacy.clearHistory.cache", true);
user_pref("privacy.cpd.formdata", true); // [DEFAULT: true]
user_pref("privacy.cpd.history", true); // [DEFAULT: true]
// user_pref("privacy.cpd.downloads", true); // not used, see note above
user_pref("privacy.clearHistory.historyFormDataAndDownloads", true);
user_pref("privacy.cpd.cookies", false);
user_pref("privacy.cpd.sessions", true); // [DEFAULT: true]
user_pref("privacy.cpd.offlineApps", false); // [DEFAULT: false]
user_pref("privacy.clearHistory.cookiesAndStorage", false);

// Cookies
// user_pref("privacy.clearOnShutdown.cookies", true); // Cookies
// user_pref("privacy.clearOnShutdown.offlineApps", true); // Site Data
// user_pref("privacy.clearOnShutdown.sessions", true);  // Active Logins [DEFAULT: true]

// Sessions
user_pref("privacy.clearSiteData.cache", false);
user_pref("privacy.clearSiteData.cookiesAndStorage", false); // keep false until it respects "allow" site exceptions

// Cache
user_pref("privacy.clearOnShutdown.cache", true);
user_pref("privacy.clearOnShutdown_v2.cache", true);
user_pref("privacy.clearOnShutdown.downloads", true);
user_pref("privacy.clearOnShutdown.formdata", true);
user_pref("privacy.clearOnShutdown.history", true);
user_pref("privacy.clearOnShutdown_v2.historyFormDataAndDownloads", true);

// Password Management
user_pref("signon.autofillForms", false);
// user_pref("security.nocertdb", true);
// user_pref("signon.rememberSignons", false);
/* 0904: disable formless login capture for Password Manager [FF51+] ***/
user_pref("signon.formlessCapture.enabled", false);
//
// NOTE: Additional configs taken from https://github.com/arkenfox/user.js/

// Don't show warning message on about:config
user_pref("browser.aboutConfig.showWarning", false);
