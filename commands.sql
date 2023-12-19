/* [CONCAT](https://dev.mysql.com/doc/refman/8.0/en/string-functions.html#function_concat)
 function, generate the following output:*/
/*
```bash
+---------------------------------------------+
| Recording                                   |
+---------------------------------------------+
| Dawn of Midi recorded Dysnomia              |
| Interpol recorded Turn on the Bright Lights |
| Melvins recorded Houdini                    |
| Mogwai recorded Come on Die Young           |
| Mogwai recorded Every Country’s Sun         |
| The Chrome Cranks recorded Dead Cool        |
| Warpaint recorded Heads Up                  |
+---------------------------------------------+
```
*/
SELECT CONCAT(artist.artist_name, ' recorded ', album.album_name) AS Recording FROM artist JOIN album ON artist.artist_id = album.artist_id;



/*Complete the following nested query in order to achieve the
 following MySQL result:
  `SELECT artist_name FROM artist WHERE artist_id = ();`.
   Note that the empty parens is where you’d include the nested query;
    it’s not a function.
*/
/*
```bash
+-------------------+---------------------------+
| artist_name       | album_name                |
+-------------------+---------------------------+
| Dawn of Midi      | Dysnomia                  |
| Interpol          | Turn on the Bright Lights |
| The Chrome Cranks | Dead Cool                 |
| Melvins           | Houdini                   |
| Mogwai            | Come on Die Young         |
| Mogwai            | Every Country’s Sun       |
| Warpaint          | Heads Up                  |
+-------------------+---------------------------+
```
*/
/*below does make the table above but check later to see if changing the = to IN and adding a join counts*/
SELECT artist_name, album_name FROM artist JOIN album ON artist.artist_id = album.artist_id
WHERE artist.artist_id IN (SELECT artist_id FROM album);



/*Using the relation `Compiles` =  that shows all the albums created by artists
exactly like the output above.*/


SELECT artist.artist_name, album.album_name FROM artist JOIN album ON artist.artist_id = album.artist_id;


/*Using the relation `Contains` = that shows all the tracks belonging to every album.
 Ensure you include track name and album name.*/

SELECT album.album_name, track.track_name FROM album JOIN track ON album.artist_id = track.artist_id AND album.album_id = track.album_id;

/*Using the relation `WasPlayedAt` = that shows all played tracks. 
Ensure you include track name and track time in your output.*/

SELECT track.track_name, track.time, played.played FROM track 
JOIN played ON track.track_id = played.track_id AND track.album_id = played.album_id AND track.artist_id = played.artist_id;

