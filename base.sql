CREATE TABLE Gallery (
    id int(5),
    AlbumID int(5),
    Author varchar(255),
    Gallery_name varchar(255),
    Gallery_description varchar(255),
    Gallery_last_edited date,
    Created_at date
);

CREATE TABLE Album (
    id int(5),
    AlbumID int(5),
    Author varchar(255),
    Album_name varchar(255),
    Album_description varchar(255),
    Album_last_edited date,
    Created_at date
);


CREATE TABLE Images (
    id int(5),
    AlbumID int(5),
    ImageID int(5),
    PcommentID int(5),
    TagID int(5),
    Author varchar(255),
    Images_name varchar(255),
    Images_description varchar(255),
    Created_at date
);

CREATE TABLE Primary_comment (
    id int(5),
    PcommentID int(5),
    ScommentID int(5),
    Author varchar(255),
    Title varchar(255),
    Content varchar(255),
    Created_at date
);

CREATE TABLE Secondary_comment (
    id int(5),
    ScommentID int(5),
    Author varchar(255),
    Title varchar(255),
    Content varchar(255),
    Created_at date
);

CREATE TABLE Tag  (
    id int(5),
    TagID int(5),
    Tag_name varchar(255),
    Author varchar(255),
    Last_element_added_at date,
    Created_at date
);
SELECT *
FROM Album
LEFT JOIN Gallery
ON Album.AlbumID = Gallery.AlbumID;

SELECT *
FROM Images
LEFT JOIN Album
ON Images.AlbumID = Album.AlbumID;

SELECT *
FROM Tag
LEFT JOIN Image
ON Tag.TagID = Image.TagID;

SELECT *
FROM Primary_comment
LEFT JOIN Image
ON Primary_comment.PcommentID = Image.PcommentID;

SELECT *
FROM Secondary_comment
LEFT JOIN Primary_comment
ON Secondary_comment.ScommentID = Primary_comment.ScommentID;
