APP=freedombox
MOODLE_BRANCH=MOODLE_34_STABLE

### Docker settings.
IMAGE=dockerscripts/freedombox
CONTAINER=freedombox1-example-org
#PORTS=

DOMAIN="plinth.example.org"

### MySQL settings
DBNAME=plinth
DBUSER=plint
DBPASS=plinth

### Gmail account for notifications.
### Make sure to enable less-secure-apps:
### https://support.google.com/accounts/answer/6010255?hl=en
GMAIL_ADDRESS=
GMAIL_PASSWD=

### freedombox site settings.
SITE_LANG=en
SITE_FULLNAME="freedombox Example 1"
SITE_SHORTNAME="MDL1"

### Admin settings.
ADMIN_USER=admin
ADMIN_PASS="admin-1234"
ADMIN_EMAIL=admin@example.org

### Settings for register/login with OAuth2.
### See: https://developers.google.com/adwords/api/docs/guides/authentication#webapp
GOOGLE_CLIENT_ID=
GOOGLE_CLIENT_SECRET=

### Additional plugins to be installed.
PLUGINS="
    mod_bigbluebuttonbn
    mod_recordingsbn
    mod_offlinequiz
    qbehaviour_adaptive_adapted_for_coderunner
    qtype_coderunner
    atto_mathslate
    tinymce_mathslate
    mod_webrtcexperiments
"

### Settings for the plugin offlinequiz.
OFFLINEQUIZ_LOGOURL=
