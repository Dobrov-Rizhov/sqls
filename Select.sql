--Задание 2
--Название и продолжительность самого длительного трека.
select title , duration from tracks
where duration >= (select max(duration) from tracks);

--Название треков, продолжительность которых не менее 3,5 минут.
select title from tracks
where 210 <= (duration);

--Названия сборников, вышедших в период с 2018 по 2020 год включительно.
select title from compilations
where release_year between 2018 and 2020;

--Исполнители, чьё имя состоит из одного слова.
select name from artists
where name not like '% %'

--Название треков, которые содержат слово «мой» или «my».
select title from tracks
where title like '%my%' or title like '%мой%';

--Задание 3
--Количество исполнителей в каждом жанре.
select genres.name, count(*) from genres
join artist_genre ag on ag.genre_id = id
group by name;

--Количество треков, вошедших в альбомы 2019–2020 годов.
select albums.title, count(*) from albums
join tracks t on albums.id = t.album_id 
where release_year between 2019 and 2020
group by albums.title; 

--Средняя продолжительность треков по каждому альбому.
select a.title, AVG(t.duration) from albums a 
join tracks t on a.id = t.album_id 
group by a.title;

--Все исполнители, которые не выпустили альбомы в 2020 году.
select distinct a.name from artists a
left join albums al ON a.id = al.id 
where al.release_year <> 2020 or al.release_year is null;

--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
select distinct c.title from compilations c 
join compilation_track ct on c.id = ct.compilation_id 
join tracks t on ct.track_id = t.id
join albums a on t.album_id = a.id 
join artists a2 on a.id = a2.id 
WHERE a2.name = 'Serj Tankian';



