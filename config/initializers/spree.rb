# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# Note: If a preference is set here it will be stored within the cache & database upon initialization.
#       Just removing an entry from this initializer will not make the preference value go away.
#       Instead you must either set a new value or remove entry, clear cache, and remove database entry.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|
  # Example:
  # Uncomment to stop tracking inventory levels in the application
  config.logo = 'logo/eattreat.png'
  #config.track_inventory_levels = false
  country = Spree::Country.find_by_name('India')
  config.default_country_id = country.id if country.present?
  config.checkout_zone = country.id

Money::Currency.register({
   :priority        => 1,
   :iso_code        => "INR",
   :iso_numeric     => country.id,
   :name            => "INDIA",
   :symbol          => "₹",
   :subunit         => "Paisa",
   :subunit_to_unit => 100,
   :separator       => ".",
   :delimiter       => ","
})


Spree::Price.update_all(currency: 'INR')
 
end

Spree.user_class = "Spree::User"


 
