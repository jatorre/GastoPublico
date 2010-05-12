# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ostrabachio_session',
  :secret      => '4c847a9d922b305a8c584721bb047b5a0ebb78b8fcdcfb1f6c10e54e4a26fa20325757a589d283404bd2f71a757687da6760cdc4d4790d18d49231a30f4e0210'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
