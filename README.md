# Baseis-2020-Εκφωνησεις
3)



12 SQL ερωτήματα που θα περιλαμβάνουν inner join, outer join, where,
order by, group by, limit, καθώς και χρησιμοποίηση των συναρτήσεων min,
max, avg, της λέξης κλειδί distinct, καθώς και χρησιμοποίηση των τελεστών
σύγκρισης like, between.
● Κάθε ερώτημα θα πρέπει να συνοδεύεται από μια μικρή περιγραφή που θα εξηγεί ποιος
είναι ο σκοπός του δηλαδή τι ζητάμε. Επίσης θα συνοδεύεται και από το πλήθος των
εγγραφών που επεστράφησαν ως αποτέλεσμα.
● Κάθε πίνακας εκ των Calendar, Listings, Reviews, Neighbourhoods, Geolocation θα
πρέπει να χρησιμοποιηθεί σε τουλάχιστον ένα ερώτημα.
● Τουλάχιστον 8 ερωτήματα θα πρέπει να περιέχουν ένα τουλάχιστον join.
● Τουλάχιστον 2 ερωτήματα θα πρέπει να περιέχουν ένα τουλάχιστον outer join.
4)



Στην συγκεκριμένη Εργασία κάνουμε αλλαγές στην βάση μας ξεκινώντας από την κατάσταση
που είχε όπως την ορίσαμε στην Εργασία 2. Για όλες αυτές τις αλλαγές, παραδοτέα θα είναι 6
sql αρχεία και ένα αρχείο εικόνας.
1. Πίνακας Host - αρχείο host_table.sql
● Δημιουργήστε έναν νέο πίνακα Host ο οποίος θα έχει τα εξής πεδία του Listings:
table Host: host_id, host_url, host_name, host_since, host_location, host_about,
host_response_time, host_response_rate, host_acceptance_rate, host_is_superhost,
host_thumbnail_url, host_picture_url, host_neighbourhood, host_listings_count,
host_total_listings_count, host_verifications, host_has_profile_pic, host_identity_verified,
calculated_host_listings_count. Δηλαδή τα πεδία αυτά να πάρουν τις τιμές του Listings.
● Φτιάξτε τα πεδία του Host να έχουν ονόματα χωρίς το ‘host_’ πρόθεμα.
● Διαγράψτε τα αντιγραφέντα host πεδία από τον Listings εκτός από το host_id.
● Δηλώστε κατάλληλο Primary Key στον Host.
● Δηλώστε κατάλληλο Foreign Key στον Listings με αναφορά στον Host.
2. Πίνακας Room - αρχείο room_table.sql
● Δημιουργήστε έναν νέο πίνακα Room ο οποίος θα έχει τα εξής πεδία του Listings:
table Room: listing_id, accommodates, bathrooms, bedrooms, beds, bed_type,
amenities, square_feet, price, weekly_price, monthly_price, security_deposit. Δηλαδή τα
πεδία αυτά να πάρουν τις τιμές του Listings.
● Διαγράψτε τα αντιγραφέντα room πεδία από τον Listings.
● Δηλώστε κατάλληλο Foreign Key στον Room με αναφορά στον Listings.
● Διαγράψτε τα αντιγραφέντα πεδία από τον Listings εκτός από το listing_id.
1
3. Πίνακας Price - αρχείο price_table.sql
● Δημιουργήστε έναν νέο πίνακα Price ο οποίος θα έχει τα εξής πεδία του Listings:
table Price: listing_id, price, weekly_price, monthly_price, security_deposit, cleaning_fee,
guests_included, extra_people, minimum_nights, maximum_nights,
minimum_minimum_nights, maximum_minimum_nights, minimum_maximum_nights,
maximum_maximum_nights, minimum_nights_avg_ntm, maximum_nights_avg_ntm.
Δηλαδή τα πεδία αυτά να πάρουν τις τιμές του Listings.
● Αλλάξτε τους τύπους πεδίων δεκαδικών αριθμών και χρημάτων σε νέο κατάλληλο
τύπο(μπορεί να χρειαστεί να αφαιρέσετε κάποιο σύμβολο hint:replace()).
● Διαγράψτε τα αντιγραφέντα price πεδία από τον Listings.
● Δηλώστε κατάλληλο Foreign Key στον Price με αναφορά στον Listings.
● Διαγράψτε τα αντιγραφέντα πεδία από τον Listings εκτός από το listing_id.
4. Πίνακας Neighborhood - αρχείο location_table.sql
● Δημιουργήστε έναν νέο πίνακα Location ο οποίος θα έχει τα εξής πεδία του Listings:
table Location: listing_id, street, neighbourhood, neighbourhood_cleansed, city, state,
zipcode, market, smart_location, country_code, country, latitude, longitude,
is_location_exact. Δηλαδή τα πεδία αυτά να πάρουν τις τιμές του Listings.
● Διαγράψτε τα αντιγραφέντα location πεδία από τον Listings.
● Δηλώστε κατάλληλο Foreign Key στον location με αναφορά στον Listings.
● Διαγράψτε τα αντιγραφέντα πεδία από τον Listings εκτός από το listing_id.
● Διαγράψτε τη συχέτιση του πίνακα listing με τον πίνακα neighborhood και συσχετίστε
κατάλληλα τον πίνακα location με τον πίνακα neighborhood.
5. Πίνακας Calendar - αρχείο calendar.sql
● Ομοίως με τα αντίστοιχα πεδία του Price, αφαιρέστε τα σύμβολα που χρειάζεται ώστε να
επιτρέπεται το ALTER σε τύπο πεδίων δεκαδικών αριθμών για τα πεδία price,
adjustable_price, καθώς και να μεταρέψετε το πεδίο available σε πεδίο τύπου boolean.
