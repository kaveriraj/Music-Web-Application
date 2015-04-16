drop table tracks;
drop table Album_Produce_by_Rec_Company;
drop table record_company;
drop table Album;
drop table Musician_Member_of_Band;
drop table band_live_performance;
drop table Live_Venue;
drop table Band;
drop table Instrument_Played_by_Musician;
drop table Instrument;
drop table Musician;

create table Musician (
  Musician_ID number primary key,
  name varchar(128),
  DOB date,
  place varchar(128),
  years varchar(128),
  assoc varchar(300),
  unique (name, DOB)
);

INSERT INTO Musician (Musician_ID, name, DOB,place,years,assoc)VALUES (1, 'Chris Martin', to_date('19770302','YYYYMMDD'),'Kirkcaldy, Scotland','1995-present','Coldplay');
INSERT INTO Musician (Musician_ID, name, DOB,place,years,assoc)VALUES (2, 'Jonny Buckland', to_date('19770911','YYYYMMDD'),'Islington, London', '1995-present','Coldplay');
INSERT INTO Musician (Musician_ID, name, DOB,place,years,assoc)VALUES (3, 'Guy Berryman', to_date('19780412','YYYYMMDD'),'Kirkcaldy, Scotland','1995-present','Coldplay,Apparatjik');
INSERT INTO Musician (Musician_ID, name, DOB,place,years,assoc)VALUES (4, 'Will Champion', to_date('19780731','YYYYMMDD'),'Southampton, England','1995-present','Coldplay' );
INSERT INTO Musician (Musician_ID, name, DOB,place,years,assoc)VALUES (5, 'Dan Auerbach', to_date('19790514','YYYYMMDD'),'Akron, Ohio','1999-present','The Black Keys, Jessica Lea Mayfield, Blakroc');
INSERT INTO Musician (Musician_ID, name, DOB,place,years,assoc)VALUES (6, 'Patrick Carney', to_date('19800415','YYYYMMDD'),'Akron, Ohio','2000-present','The Black Keys, Blakroc, Drummer');
INSERT INTO Musician (Musician_ID, name, DOB,place,years,assoc)VALUES (7, 'Joel Madden', to_date('19790311','YYYYMMDD'),'Waldorf, Maryland,','1995-present','Good Charlotte');
INSERT INTO Musician (Musician_ID, name, DOB,place,years,assoc)VALUES (8, 'Paul Thomas', to_date('19801011','YYYYMMDD'),'Maryland','1996-present','Good Charlotte');
INSERT INTO Musician (Musician_ID, name, DOB,place,years,assoc)VALUES (9, 'Jeff Ament', to_date('19630310','YYYYMMDD'),'Havre, Montana','1981-present','Pearl Jam, Green River, Mother Love Bone');
INSERT INTO Musician (Musician_ID, name, DOB,place,years,assoc)VALUES (10, 'Stone Gossard', to_date('19660720','YYYYMMDD'),'Seattle, Washington,','1983-present','Pearl Jam, Green River, Mother Love Bone');
INSERT INTO Musician (Musician_ID, name, DOB,place,years,assoc)VALUES (11, 'Kurt Cobain', to_date('19671220','YYYYMMDD'),'Aberdeen, Washington','1982-1994','Nirvana, fecal matter');
INSERT INTO Musician (Musician_ID, name, DOB,place,years,assoc)VALUES (12, 'Krist Novoselic', to_date('19650516','YYYYMMDD'),'Compton, LA','1986-present',' Nirvana, Eyes Adrift, Sweet 75, Flipper');
INSERT INTO Musician (Musician_ID, name, DOB,place,years,assoc)VALUES (13, 'Gary LeVox', to_date('19700610','YYYYMMDD'),'Columbus, Ohio','2000-present',' Rascal Flatts');
INSERT INTO Musician (Musician_ID, name, DOB,place,years,assoc)VALUES (14, 'Jay DeMarcus', to_date('19710424','YYYYMMDD'),'Columbus, Ohio','1992-present',' East to West, Rascal Flatts');
INSERT INTO Musician (Musician_ID, name, DOB,place,years,assoc)VALUES (15, 'Hillary Scott', to_date('19860401','YYYYMMDD'),'Nashville, Tennessee','2006-present','Lady Antebellum, Linda Davis');
INSERT INTO Musician (Musician_ID, name, DOB,place,years,assoc)VALUES (16, 'Charles Kelley', to_date('19860401','YYYYMMDD'),'Nashville, Tennessee','2006-present','Lady Antebellum, Linda Davis');
INSERT INTO Musician (Musician_ID, name, DOB,place,years,assoc)VALUES (17, 'Steven Tyler', to_date('19480926','YYYYMMDD'),'Yonkers, New York','1964-present','Aerosmith, Chain Reaction');
INSERT INTO Musician (Musician_ID, name, DOB,place,years,assoc)VALUES (18, 'Tom Hamilton', to_date('19511231','YYYYMMDD'),'Colorado Springs, Colorado,','1970-present','Aerosmith, Chain Reaction');
INSERT INTO Musician (Musician_ID, name, DOB,place,years,assoc)VALUES (19, 'Josh Farro', to_date('19870929','YYYYMMDD'),'New Jersey,','2004-present','Novel American, Paramore');
INSERT INTO Musician (Musician_ID, name, DOB,place,years,assoc)VALUES (20, 'Zac Farro', to_date('19870929','YYYYMMDD'),'New Jersey,','2004-present','Novel American, Paramore');
INSERT INTO Musician (Musician_ID, name, DOB,place,years,assoc)VALUES (21, 'Dan Reynolds', to_date('19870914','YYYYMMDD'),'Las Vegas, Nevada,','2008-present','Imagine Dragons, Egyptian');
INSERT INTO Musician (Musician_ID, name, DOB,place,years,assoc)VALUES (22, 'Daniel Wayne', to_date('19861002','YYYYMMDD'),'Utah','2008-present','Imagine Dragons, Egyptian');

create table Instrument (
Instrument_ID number primary key,
name varchar(64) unique
);

INSERT INTO Instrument (Instrument_ID, name)VALUES (1, 'Piano');
INSERT INTO Instrument (Instrument_ID, name)VALUES (2, 'Electric guitar');
INSERT INTO Instrument (Instrument_ID, name)VALUES (3, 'Bass guitar');
INSERT INTO Instrument (Instrument_ID, name)VALUES (4, 'Drums');
INSERT INTO Instrument (Instrument_ID, name)VALUES (5, 'Vocal');
INSERT INTO Instrument (Instrument_ID, name)VALUES (6, 'Harmonica');
INSERT INTO Instrument (Instrument_ID, name)VALUES (7, 'Tambourine');

create table Instrument_Played_by_Musician (
  Instrument_ID number,
  Musician_ID number,
  primary key (Instrument_ID, Musician_ID),
  foreign key (Musician_ID) references Musician(Musician_ID),
  foreign key (Instrument_ID) references Instrument(Instrument_ID)
);

INSERT INTO Instrument_Played_by_Musician (Instrument_ID, Musician_ID)VALUES (1, 1);
INSERT INTO Instrument_Played_by_Musician (Instrument_ID, Musician_ID)VALUES (2, 1);
INSERT INTO Instrument_Played_by_Musician (Instrument_ID, Musician_ID)VALUES (2, 2);
INSERT INTO Instrument_Played_by_Musician (Instrument_ID, Musician_ID)VALUES (3, 3);
INSERT INTO Instrument_Played_by_Musician (Instrument_ID, Musician_ID)VALUES (4, 4);
INSERT INTO Instrument_Played_by_Musician (Instrument_ID, Musician_ID)VALUES (1, 5);
INSERT INTO Instrument_Played_by_Musician (Instrument_ID, Musician_ID)VALUES (2, 5);
INSERT INTO Instrument_Played_by_Musician (Instrument_ID, Musician_ID)VALUES (3, 6);
INSERT INTO Instrument_Played_by_Musician (Instrument_ID, Musician_ID)VALUES (4, 6);
INSERT INTO Instrument_Played_by_Musician (Instrument_ID, Musician_ID)VALUES (4, 7);
INSERT INTO Instrument_Played_by_Musician (Instrument_ID, Musician_ID)VALUES (2, 7);
INSERT INTO Instrument_Played_by_Musician (Instrument_ID, Musician_ID)VALUES (6, 8);
INSERT INTO Instrument_Played_by_Musician (Instrument_ID, Musician_ID)VALUES (3, 8);
INSERT INTO Instrument_Played_by_Musician (Instrument_ID, Musician_ID)VALUES (1, 9);
INSERT INTO Instrument_Played_by_Musician (Instrument_ID, Musician_ID)VALUES (5, 9);
INSERT INTO Instrument_Played_by_Musician (Instrument_ID, Musician_ID)VALUES (3, 10);
INSERT INTO Instrument_Played_by_Musician (Instrument_ID, Musician_ID)VALUES (7, 11);
INSERT INTO Instrument_Played_by_Musician (Instrument_ID, Musician_ID)VALUES (5, 11);
INSERT INTO Instrument_Played_by_Musician (Instrument_ID, Musician_ID)VALUES (4, 12);
INSERT INTO Instrument_Played_by_Musician (Instrument_ID, Musician_ID)VALUES (2, 12);
INSERT INTO Instrument_Played_by_Musician (Instrument_ID, Musician_ID)VALUES (6, 13);
INSERT INTO Instrument_Played_by_Musician (Instrument_ID, Musician_ID)VALUES (1, 13);
INSERT INTO Instrument_Played_by_Musician (Instrument_ID, Musician_ID)VALUES (5, 14);
INSERT INTO Instrument_Played_by_Musician (Instrument_ID, Musician_ID)VALUES (3, 15);
INSERT INTO Instrument_Played_by_Musician (Instrument_ID, Musician_ID)VALUES (2, 15);
INSERT INTO Instrument_Played_by_Musician (Instrument_ID, Musician_ID)VALUES (4, 16);
INSERT INTO Instrument_Played_by_Musician (Instrument_ID, Musician_ID)VALUES (3, 17);
INSERT INTO Instrument_Played_by_Musician (Instrument_ID, Musician_ID)VALUES (2, 17);
INSERT INTO Instrument_Played_by_Musician (Instrument_ID, Musician_ID)VALUES (1, 18);
INSERT INTO Instrument_Played_by_Musician (Instrument_ID, Musician_ID)VALUES (4, 19);
INSERT INTO Instrument_Played_by_Musician (Instrument_ID, Musician_ID)VALUES (5, 19);
INSERT INTO Instrument_Played_by_Musician (Instrument_ID, Musician_ID)VALUES (3, 20);
INSERT INTO Instrument_Played_by_Musician (Instrument_ID, Musician_ID)VALUES (1, 20);
INSERT INTO Instrument_Played_by_Musician (Instrument_ID, Musician_ID)VALUES (4, 21);
INSERT INTO Instrument_Played_by_Musician (Instrument_ID, Musician_ID)VALUES (1, 22);

create table Band (
  Band_ID number primary key,
  name varchar(32) unique,
  hometown varchar(128),
  homepage varchar(128),
  genre varchar(32)
);

INSERT INTO Band (Band_ID, name, hometown, homepage, genre)VALUES (1, 'Coldplay', 'London, England', 'www.coldplay.com', 'Rock');
INSERT INTO Band (Band_ID, name, hometown, homepage, genre)VALUES (2, 'The Black Keys', 'Akron, Ohio, United States', 'www.theblackkeys.com', 'Rock');
INSERT INTO Band (Band_ID, name, hometown, homepage, genre)VALUES (3, 'Paramore', 'Franklin, Tennessee, United States', 'www.paramore.com', 'Pop');
INSERT INTO Band (Band_ID, name, hometown, homepage, genre)VALUES (4, 'Good Charlotte', 'Waldorf, Maryland,United States', 'www.goodcharlotte.com', 'Pop');
INSERT INTO Band (Band_ID, name, hometown, homepage, genre)VALUES (5, 'Pearl Jam', 'Seattle, Washington,United States', 'www.pearljam.com', 'Alternative Rock');
INSERT INTO Band (Band_ID, name, hometown, homepage, genre)VALUES (6, 'Nirvana', 'Aberdeen, Washington,United States', 'www.nirvana.com', 'Alternative Rock');
INSERT INTO Band (Band_ID, name, hometown, homepage, genre)VALUES (7, 'Rascal Flatts', 'Columbus, Ohio,United States', 'www.rascalflatts.com', 'Country');
INSERT INTO Band (Band_ID, name, hometown, homepage, genre)VALUES (8, 'Lady Antebellum', 'Nashville, Tennessee,United States', 'www.ladyantebellum.com', 'Country');
INSERT INTO Band (Band_ID, name, hometown, homepage, genre)VALUES (9, 'Imagine Dragons', 'Las Vegas, Nevada,United States', 'www.imaginedragons.com', 'Alternative Rock');
INSERT INTO Band (Band_ID, name, hometown, homepage, genre)VALUES (10, 'Aerosmith', 'Boston, Massachusetts,United States', 'www.aerosmith.com', 'Rock');
create table Live_Venue(
  Place_ID number primary key,
  place_name varchar(32) not null,
  venue varchar(32) not null,
  phone number,
  unique (place_name, venue)
);

INSERT INTO Live_Venue (Place_ID, place_name, venue,phone)VALUES (1,'Las Vegas,nevada', 'iHeartRadio Festival',124431);
INSERT INTO Live_Venue (Place_ID, place_name, venue,phone)VALUES (2,'Boston, Massachusetts', 'TD Garden',456789);
INSERT INTO Live_Venue (Place_ID, place_name, venue,phone)VALUES (3,'New York, New York', 'Madison Square Garden', 4321908);
INSERT INTO Live_Venue (Place_ID, place_name, venue,phone)VALUES (4,'San Francisco, California', 'The Exit Hall', 2134789);
INSERT INTO Live_Venue (Place_ID, place_name, venue,phone)VALUES (5,'Pittsburgh, Pennsylvania', 'PNC Field', 41289078);
INSERT INTO Live_Venue (Place_ID, place_name, venue,phone)VALUES (6,'Philadelphia, Pennsylvania', 'Lincoln Financial Field',2135678);
INSERT INTO Live_Venue (Place_ID, place_name, venue,phone)VALUES (7,'Atlanta, Georgia', 'Turner Field',7835678);
INSERT INTO Live_Venue (Place_ID, place_name, venue,phone)VALUES (8,'Dallas, Texas', 'ATT Stadium',21345648);
INSERT INTO Live_Venue (Place_ID, place_name, venue,phone)VALUES (9,'Dover, Delaware', 'Firefly Music Festival',6542481);
INSERT INTO Live_Venue (Place_ID, place_name, venue,phone)VALUES (10,'Chicago, Illinois', 'Pitchfork Music Festival',3124481);
create table band_live_performance(
  Place_ID number,
  Band_ID number,
  Live_Date date,
  primary key (Place_ID, Band_ID),
  foreign key (Band_ID) references Band(Band_ID),
  foreign key (Place_ID) references Live_Venue(Place_ID)
);

INSERT INTO band_live_performance (Place_ID, Band_ID, live_date)VALUES (1, 1, to_date('20140919','YYYYMMDD'));
INSERT INTO band_live_performance (Place_ID, Band_ID, live_date)VALUES (2, 1, to_date('20140921','YYYYMMDD'));
INSERT INTO band_live_performance (Place_ID, Band_ID, live_date)VALUES (3, 2, to_date('20140712','YYYYMMDD'));
INSERT INTO band_live_performance (Place_ID, Band_ID, live_date)VALUES (9, 2, to_date('20141224','YYYYMMDD'));
INSERT INTO band_live_performance (Place_ID, Band_ID, live_date)VALUES (5, 2, to_date('20150204','YYYYMMDD'));
INSERT INTO band_live_performance (Place_ID, Band_ID, live_date)VALUES (4, 3, to_date('20140714','YYYYMMDD'));
INSERT INTO band_live_performance (Place_ID, Band_ID, live_date)VALUES (8, 3, to_date('20140320','YYYYMMDD'));
INSERT INTO band_live_performance (Place_ID, Band_ID, live_date)VALUES (6, 4, to_date('20140913','YYYYMMDD'));
INSERT INTO band_live_performance (Place_ID, Band_ID, live_date)VALUES (10, 4, to_date('20140815','YYYYMMDD'));
INSERT INTO band_live_performance (Place_ID, Band_ID, live_date)VALUES (7, 5, to_date('20150124','YYYYMMDD'));
INSERT INTO band_live_performance (Place_ID, Band_ID, live_date)VALUES (5, 5, to_date('20140912','YYYYMMDD'));
INSERT INTO band_live_performance (Place_ID, Band_ID, live_date)VALUES (2, 5, to_date('20141126','YYYYMMDD'));
INSERT INTO band_live_performance (Place_ID, Band_ID, live_date)VALUES (4, 6, to_date('20140714','YYYYMMDD'));
INSERT INTO band_live_performance (Place_ID, Band_ID, live_date)VALUES (8, 6, to_date('20141206','YYYYMMDD'));
INSERT INTO band_live_performance (Place_ID, Band_ID, live_date)VALUES (9, 7, to_date('20141019','YYYYMMDD'));
INSERT INTO band_live_performance (Place_ID, Band_ID, live_date)VALUES (6, 7, to_date('20140614','YYYYMMDD'));
INSERT INTO band_live_performance (Place_ID, Band_ID, live_date)VALUES (7, 8, to_date('20141127','YYYYMMDD'));
INSERT INTO band_live_performance (Place_ID, Band_ID, live_date)VALUES (10, 8, to_date('20150304','YYYYMMDD'));
INSERT INTO band_live_performance (Place_ID, Band_ID, live_date)VALUES (1, 9, to_date('20140821','YYYYMMDD'));
INSERT INTO band_live_performance (Place_ID, Band_ID, live_date)VALUES (3, 9, to_date('20140215','YYYYMMDD'));
INSERT INTO band_live_performance (Place_ID, Band_ID, live_date)VALUES (8, 10, to_date('20141203','YYYYMMDD'));

create table Musician_Member_of_Band(
  Band_ID number,
  Musician_ID number,
  join_year number not null,
  left_year number,
  primary key (Band_ID, Musician_ID),
  foreign key (Band_ID) references Band(Band_ID),
  foreign key (Musician_ID) references Musician(Musician_ID)
);

INSERT INTO Musician_Member_of_Band (Band_ID, Musician_ID, join_year, left_year)VALUES (1, 1, 1996, NULL);
INSERT INTO Musician_Member_of_Band (Band_ID, Musician_ID, join_year, left_year)VALUES (1, 2, 1996, NULL);
INSERT INTO Musician_Member_of_Band (Band_ID, Musician_ID, join_year, left_year)VALUES (1, 3, 1996, NULL);
INSERT INTO Musician_Member_of_Band (Band_ID, Musician_ID, join_year, left_year)VALUES (1, 4, 1996, NULL);
INSERT INTO Musician_Member_of_Band (Band_ID, Musician_ID, join_year, left_year)VALUES (2, 5, 2001, NULL);
INSERT INTO Musician_Member_of_Band (Band_ID, Musician_ID, join_year, left_year)VALUES (2, 6, 2001, NULL);
INSERT INTO Musician_Member_of_Band (Band_ID, Musician_ID, join_year, left_year)VALUES (4, 7, 1996, NULL);
INSERT INTO Musician_Member_of_Band (Band_ID, Musician_ID, join_year, left_year)VALUES (4, 8, 1996, NULL);
INSERT INTO Musician_Member_of_Band (Band_ID, Musician_ID, join_year, left_year)VALUES (5, 9, 1990, NULL);
INSERT INTO Musician_Member_of_Band (Band_ID, Musician_ID, join_year, left_year)VALUES (5, 10, 1990, NULL);
INSERT INTO Musician_Member_of_Band (Band_ID, Musician_ID, join_year, left_year)VALUES (6, 11, 1987, NULL);
INSERT INTO Musician_Member_of_Band (Band_ID, Musician_ID, join_year, left_year)VALUES (6, 12, 1987, NULL);
INSERT INTO Musician_Member_of_Band (Band_ID, Musician_ID, join_year, left_year)VALUES (7, 13, 1999, NULL);
INSERT INTO Musician_Member_of_Band (Band_ID, Musician_ID, join_year, left_year)VALUES (7, 14, 1999, NULL);
INSERT INTO Musician_Member_of_Band (Band_ID, Musician_ID, join_year, left_year)VALUES (8, 15, 2006, NULL);
INSERT INTO Musician_Member_of_Band (Band_ID, Musician_ID, join_year, left_year)VALUES (8, 16, 2006, NULL);
INSERT INTO Musician_Member_of_Band (Band_ID, Musician_ID, join_year, left_year)VALUES (10, 17, 1970, NULL);
INSERT INTO Musician_Member_of_Band (Band_ID, Musician_ID, join_year, left_year)VALUES (10, 18, 1970, NULL);
INSERT INTO Musician_Member_of_Band (Band_ID, Musician_ID, join_year, left_year)VALUES (3, 19, 2004, NULL);
INSERT INTO Musician_Member_of_Band (Band_ID, Musician_ID, join_year, left_year)VALUES (9, 21, 2008, NULL);
INSERT INTO Musician_Member_of_Band (Band_ID, Musician_ID, join_year, left_year)VALUES (9, 22, 2008, NULL);

create table Album(
  Album_ID number,
  Band_ID number,
  name varchar(64) unique,
  Number_of_tracks Number not null,
  release_year number not null,
  primary key (Album_ID, Band_ID),
  foreign key (Band_ID) references Band(Band_ID)
);

INSERT INTO Album(Album_ID, Band_ID, name, Number_of_tracks, release_year)VALUES (1, 1, 'Parachutes', 2, 2000);
INSERT INTO Album(Album_ID, Band_ID, name, Number_of_tracks, release_year)VALUES (2, 1, 'A Rush of Blood to the Head', 3, 2002);
INSERT INTO Album(Album_ID, Band_ID, name, Number_of_tracks, release_year)VALUES (1, 2, 'Attack and Release', 2, 2008);
INSERT INTO Album(Album_ID, Band_ID, name, Number_of_tracks, release_year)VALUES (2, 2, 'Brothers', 3, 2010);
INSERT INTO Album(Album_ID, Band_ID, name, Number_of_tracks, release_year)VALUES (3, 4, 'The Young and the Hopeless',2, 2002);
INSERT INTO Album(Album_ID, Band_ID, name, Number_of_tracks, release_year)VALUES (4, 4, 'The Chronicles of Life and Death',2, 2004);
INSERT INTO Album(Album_ID, Band_ID, name, Number_of_tracks, release_year)VALUES (5, 5, 'Ten',2, 1991);
INSERT INTO Album(Album_ID, Band_ID, name, Number_of_tracks, release_year)VALUES (6, 5, 'Vs',2, 1993);
INSERT INTO Album(Album_ID, Band_ID, name, Number_of_tracks, release_year)VALUES (7, 6, 'Bleach',2, 1989);
INSERT INTO Album(Album_ID, Band_ID, name, Number_of_tracks, release_year)VALUES (8, 6, 'NeverMind', 2, 1991);
INSERT INTO Album(Album_ID, Band_ID, name, Number_of_tracks, release_year)VALUES (9, 7, 'Melt ',2, 2002);
INSERT INTO Album(Album_ID, Band_ID, name, Number_of_tracks, release_year)VALUES (10, 7, 'Feels Like Today',2,2004);
INSERT INTO Album(Album_ID, Band_ID, name, Number_of_tracks, release_year)VALUES (11, 8, 'Need You Now',2,2010);
INSERT INTO Album(Album_ID, Band_ID, name, Number_of_tracks, release_year)VALUES (12, 9, 'Hell and Silence',2,2010);
INSERT INTO Album(Album_ID, Band_ID, name, Number_of_tracks, release_year)VALUES (13, 9, 'Its Time',2,2012);
INSERT INTO Album(Album_ID, Band_ID, name, Number_of_tracks, release_year)VALUES (14, 10, 'Get your wings',2,1974);
INSERT INTO Album(Album_ID, Band_ID, name, Number_of_tracks, release_year)VALUES (15, 10, 'Toys in the Attic',2,1975);
INSERT INTO Album(Album_ID, Band_ID, name, Number_of_tracks, release_year)VALUES (16, 3, 'All We Know Is Falling', 2, 2005);
INSERT INTO Album(Album_ID, Band_ID, name, Number_of_tracks, release_year)VALUES (17, 3, 'Riot', 2, 2007);


create table record_company(
  Rec_Company_ID number primary key,
  rec_company_name varchar(32) unique,
  founder varchar(32)
);

INSERT INTO record_company(Rec_Company_ID, rec_company_name, founder)VALUES (1, 'Capitol Records', 'Johnny Mercer');
INSERT INTO record_company(Rec_Company_ID, rec_company_name, founder)VALUES (2, 'Nonesuch Records', 'Jac Holzman');
INSERT INTO record_company(Rec_Company_ID, rec_company_name, founder)VALUES (3, 'Epic Records', 'Sony');
INSERT INTO record_company(Rec_Company_ID, rec_company_name, founder)VALUES (4, 'Subpop Records', 'Bruce Pavitt');
INSERT INTO record_company(Rec_Company_ID, rec_company_name, founder)VALUES (5, 'DGC Records', 'David Geffen');
INSERT INTO record_company(Rec_Company_ID, rec_company_name, founder)VALUES (6, 'Lyric Street Records', 'Randy Goodman');
INSERT INTO record_company(Rec_Company_ID, rec_company_name, founder)VALUES (7, 'Imagine Dragons', 'Dan Reynolds');
INSERT INTO record_company(Rec_Company_ID, rec_company_name, founder)VALUES (8, 'Interscope Records', 'Jimmy Iovine');
INSERT INTO record_company(Rec_Company_ID, rec_company_name, founder)VALUES (9, 'Columbia Records', 'Sony');
INSERT INTO record_company(Rec_Company_ID, rec_company_name, founder)VALUES (10, 'Fueled by Ramen', 'John Janick');
create table Album_Produce_by_Rec_Company(
  Rec_Company_ID number,
  Band_ID number,
  Album_ID number not null,
  primary key (Rec_Company_ID, Band_ID, Album_ID),
  foreign key (Album_ID, Band_ID) references Album(Album_ID, Band_ID),
  foreign key (Rec_Company_ID) references record_company(Rec_Company_ID)
);

INSERT INTO Album_Produce_by_Rec_Company(Rec_Company_ID, Band_ID, Album_ID)VALUES (1, 1, 1);
INSERT INTO Album_Produce_by_Rec_Company(Rec_Company_ID, Band_ID, Album_ID)VALUES (1, 1, 2);
INSERT INTO Album_Produce_by_Rec_Company(Rec_Company_ID, Band_ID, Album_ID)VALUES (2, 2, 1);
INSERT INTO Album_Produce_by_Rec_Company(Rec_Company_ID, Band_ID, Album_ID)VALUES (2, 2, 2);
INSERT INTO Album_Produce_by_Rec_Company(Rec_Company_ID, Band_ID, Album_ID)VALUES (3, 4, 3);
INSERT INTO Album_Produce_by_Rec_Company(Rec_Company_ID, Band_ID, Album_ID)VALUES (3, 4, 4);
INSERT INTO Album_Produce_by_Rec_Company(Rec_Company_ID, Band_ID, Album_ID)VALUES (3, 5, 5);
INSERT INTO Album_Produce_by_Rec_Company(Rec_Company_ID, Band_ID, Album_ID)VALUES (3, 5, 6);
INSERT INTO Album_Produce_by_Rec_Company(Rec_Company_ID, Band_ID, Album_ID)VALUES (4, 6, 7);
INSERT INTO Album_Produce_by_Rec_Company(Rec_Company_ID, Band_ID, Album_ID)VALUES (5, 6, 8);
INSERT INTO Album_Produce_by_Rec_Company(Rec_Company_ID, Band_ID, Album_ID)VALUES (6, 7, 9);
INSERT INTO Album_Produce_by_Rec_Company(Rec_Company_ID, Band_ID, Album_ID)VALUES (6, 7, 10);
INSERT INTO Album_Produce_by_Rec_Company(Rec_Company_ID, Band_ID, Album_ID)VALUES (1, 8, 11);
INSERT INTO Album_Produce_by_Rec_Company(Rec_Company_ID, Band_ID, Album_ID)VALUES (7, 9, 12);
INSERT INTO Album_Produce_by_Rec_Company(Rec_Company_ID, Band_ID, Album_ID)VALUES (8, 9, 13);
INSERT INTO Album_Produce_by_Rec_Company(Rec_Company_ID, Band_ID, Album_ID)VALUES (9, 10, 14);
INSERT INTO Album_Produce_by_Rec_Company(Rec_Company_ID, Band_ID, Album_ID)VALUES (9, 10, 15);
INSERT INTO Album_Produce_by_Rec_Company(Rec_Company_ID, Band_ID, Album_ID)VALUES (10,3, 16);
INSERT INTO Album_Produce_by_Rec_Company(Rec_Company_ID, Band_ID, Album_ID)VALUES (10, 3, 17);




create table tracks(
  Track_ID number,
  Album_ID number,
  Band_ID number,
  title varchar(256) unique not null,
  length_in_secs number not null,
  primary key (Track_ID, Album_ID, Band_ID),
  foreign key (Album_ID, Band_ID) references Album(Album_ID, Band_ID)
);

INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (1, 1, 1, 'Dont Panic', 137);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (2, 1, 1, 'Shiver', 300);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (1, 2, 1, 'Politik', 318);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (2, 2, 1, 'In My Place',228);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (3, 2, 1, 'God Put a Smile upon Your Face',297);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (1, 1, 2, 'All You Ever Wanted',175);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (2, 1, 2, 'I Got Mine', 238);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (1, 2, 2, 'Everlasting Light', 204);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (2, 2, 2, 'Next Girl', 198);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (3, 2, 2, 'Tighten Up', 211);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (1, 3, 4, 'The Anthem', 255);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (2, 3, 4, 'Hold On', 301);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (1, 4, 4, 'Walk Away ', 321);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (2, 4, 4, 'We Believe', 224);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (1, 5, 5, 'Once', 351);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (2, 5, 5, 'Alive', 541);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (1, 6, 5, 'Animal', 245);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (2, 6, 5, 'Daughter',395);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (1, 7, 6, 'Blew',235);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (2, 7, 6, 'About A Girl',215);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (1, 8, 6, 'Smells Like Teen Spirit',235);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (2, 8, 6, 'In Bloom',231);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (1, 9, 7, 'These Days',435);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (2, 9, 7, 'Mayberry',385);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (1, 10, 7, 'Where You Are',285);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (2, 10, 7, 'Then I Did',512);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (1, 11, 8, 'Our Kind of Love',203);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (2, 11, 8, 'Hello World',345);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (1, 12, 9, 'All Eyes',345);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (2, 12, 9, 'I Dont Mind',415);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (1, 13, 9, 'Its time',400);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (2, 13, 9, 'Round and Round',300);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (1, 14, 10, 'Same Old Song and Dance',412);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (2, 14, 10, 'Woman of the World',549);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (1, 15, 10, 'Walk This Way',341);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (2, 15, 10, 'Sweet Emotion',434);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (1, 16, 3, 'All We Know',313);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (2, 16, 3, 'Pressure',305);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (1, 17, 3, 'Misery Business',331);
INSERT INTO tracks(Track_ID, Album_ID, Band_ID, title, length_in_secs)VALUES (2, 17, 3, 'Hallelujah',333);
