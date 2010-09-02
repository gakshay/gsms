# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_gsms_session',
  :secret      => '53c9c10fc9178584534d248e37b56fe9216556167b2bcb10d385b713354f125fc75e205be060baf6fb026d0cfabc2d013bba4defcf96f137f235f86f8d0b2a53'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
