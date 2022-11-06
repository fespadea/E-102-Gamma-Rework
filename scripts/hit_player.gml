//hit_player

// [Random alt on hit feature]
// Random alt on hit
if(randomAltOnHit){ // if "random alt on hit" activated
    updateUnlimitedAlt(random_func(10, NUM_UNLIMITED_ALTS-1, true), false); // update the unlimited alt to a random alt
    init_shader(); // update the alt visually
}



#define updateUnlimitedAlt
unlimitedAlt = argument[0];
var syncedVar = get_synced_var(player);
var newSyncedVar = 0;
newSyncedVar += syncedVar >> (LAST_BIT_UNLIMITED+1) << (LAST_BIT_UNLIMITED+1);
newSyncedVar += (unlimitedAlt & ((1 << (LAST_BIT_UNLIMITED-FIRST_BIT_UNLIMITED+1))-1)) << FIRST_BIT_UNLIMITED;
newSyncedVar += syncedVar & ((1 << (FIRST_BIT_UNLIMITED))-1);
set_synced_var(player, newSyncedVar);