PROJECT BASEIS

/*\copy table FROM 'path' DELIMITER ',' CSV
HEADER; */


/* Δημιουργία πινάκων */

create table ratings(
   userId int,
   movieId int,
   rating varchar(10),
   timestamp int
);

create table credits(
   cast_to text,
   crew text,
   id int
);

create table keywords(
   id int,
   keywords text
);

create table links(
   movieId int,
   imdbId int,
   tmdbId int
);

create table ratings_small (
	userId int,
	movieId int,
	rating double,
	timestamp long
);

create table movies_metadata(
   adult varchar(10),
   belongs_to_collection varchar(190),
   budget int,
   genres varchar(270),
   homepage varchar(250),
   id int,
   imdb_id varchar(10),
   original_language varchar(10),
   original_title varchar(110),
   overview varchar(1000),
   popularity varchar(10),
   poster_path varchar(40),
   production_companies varchar(1260),
   production_countries varchar(1040),
   release_date date,
   revenue bigint,
   runtime varchar(10),
   spoken_languages varchar(770),
   status varchar(20),
   tagline varchar(300),
   title varchar(110),
   video varchar(10),
   vote_average varchar(10),
   vote_count int
);



/* βλεπουμε τα στοιχεια του πινακα που θελουμε να ορίσουμε primary key και υπάρχουν διπλότητα. Προχωράμε στη διαγραφή τους" */
SELECT
    id,
    COUNT(id)
FROM
    credits
GROUP BY
    id
HAVING
    COUNT(id)> 1
ORDER BY
    id;
	

/*Delete duplicate fom credits*/
DELETE FROM credits
WHERE id IN
    (SELECT id
    FROM 
        (SELECT id,
         ROW_NUMBER() OVER( PARTITION BY id
        ORDER BY id ) AS row_num
        FROM credits ) t
        WHERE t.row_num > 1 );

/* set primary key (id) to credits*/		
alter table credits
add primary key (id);

/*Delete duplicate fom keywords
DELETE 1972*/
DELETE FROM keywords
WHERE id IN
    (SELECT id
    FROM 
        (SELECT id,
         ROW_NUMBER() OVER( PARTITION BY id
        ORDER BY id ) AS row_num
        FROM keywords ) t
        WHERE t.row_num > 1 );
		
/* set primary key (id) to keywords*/
alter table keywords
add primary key (id);

/*Delete duplicate fom links
DELETE 0*/
DELETE FROM links
WHERE movieid IN
    (SELECT movieid
    FROM 
        (SELECT movieid,
         ROW_NUMBER() OVER( PARTITION BY movieid
        ORDER BY movieid ) AS row_num
        FROM links ) t
        WHERE t.row_num > 1 );
		
/* set primary key (movieid) to links*/
alter table links
add primary key (movieid);

/*Delete duplicate fom movies_metadata
DELETE 59*/
DELETE FROM movies_metadata
WHERE id IN
    (SELECT id
    FROM 
        (SELECT id,
         ROW_NUMBER() OVER( PARTITION BY id
        ORDER BY id ) AS row_num
        FROM movies_metadata ) t
        WHERE t.row_num > 1 );

		/* set primary key (movieid) to movies_metadata*/
alter table movies_metadata
add primary key (id);

ALTER TABLE "credits"
ADD FOREIGN KEY(id) REFERENCES "movies_metadata" (id);


--FK for Keywords table

ALTER TABLE "keywords"
ADD FOREIGN KEY(id) REFERENCES "movies_metadata" (id);

--FK for Links table

ALTER TABLE "links"
ADD FOREIGN KEY(tmdbid) REFERENCES "movies_metadata" (id);


--FK for Ratings_Small table

ALTER TABLE "ratings"
ADD FOREIGN KEY(movieid) REFERENCES "movies_metadata" (id);





---------------------------------


1.
SELECT count (movies_metadata.id),
	SPLIT_PART(movies_metadata.release_date::VARCHAR,'-', 1) y
FROM movies_metadata
group by y
order by y;


2.
SELECT CAST(count(*) AS INTEGER), genres 
FROM movies_metadata
group by genres




ALTER TABLE ratings ALTER COLUMN rating TYPE numeric USING (rating::numeric);

SELECT COUNT (rating) AS number_of_ratings, userid
FROM ratings
GROUP BY userid 
ORDER BY userid 
/* Αριθμός από ratings ανά χρήστη*/

SELECT AVG (rating) AS average_rating, userid
FROM ratings
GROUP BY userid 
ORDER BY userid
/* Μέση βαθμολογία (rating) ανά χρήστη*/

CREATE VIEW view_avgrating AS(
SELECT COUNT (rating) AS number_of_ratings, AVG(rating) as average_rating , userid
FROM ratings
GROUP BY userid 
ORDER BY userid)
/* Δημιουργουμε ενα view με ονομα view_avgrating και ισάγουμε  για κάθε χρήστη τον αριθμό των ratings όπως και τη μέση βαθμολογία που έχει αξιολογήσει*/
/* INSIGHT: Παρατηρουμε οτι υπαρχει μείωση/αύξηση της μέσης βαθμολογίας ανάλογα με συνολικό αριθμό των ratings που έχει κάνει ο κάθε χρήστης. Με βάση αυτή τη λογική μπορούμε να δούμε το πόσο "αυστηρός" είναι ο κάθε χρήστης. Δεν πρέπει να το θεωρούμε δεδομένο καθώς μπορεί κάποια ταινία να έχει λίγες ή υψηλόβαθμες κριτικές
(vice versa)*/
