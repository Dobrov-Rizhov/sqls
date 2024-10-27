CREATE TABLE Artists (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Genres (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Artist_Genre (
    artist_id INT,
    genre_id INT,
    FOREIGN KEY (artist_id) REFERENCES Artists(id),
    FOREIGN KEY (genre_id) REFERENCES Genres(id),
    PRIMARY KEY (artist_id, genre_id)
);

CREATE TABLE Albums (
    id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INT
);

CREATE TABLE Artist_Album (
    artist_id INT,
    album_id INT,
    FOREIGN KEY (artist_id) REFERENCES Artists(id),
    FOREIGN KEY (album_id) REFERENCES Albums(id),
    PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE Tracks (
    id INT PRIMARY key,
    title VARCHAR(255) NOT NULL,
    duration TIME,
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES Albums(id)
);

CREATE TABLE Compilations (
    id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INT
);

CREATE TABLE Compilation_Track (
    compilation_id INT,
    track_id INT,
    FOREIGN KEY (compilation_id) REFERENCES Compilations(id),
    FOREIGN KEY (track_id) REFERENCES Tracks(id),
    PRIMARY KEY (compilation_id, track_id)
);