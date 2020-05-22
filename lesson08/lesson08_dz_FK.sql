# 1. Добавить необходимые внешние ключи для всех таблиц базы данных vk (приложить команды).

ALTER TABLE profiles
	ADD CONSTRAINT profiles_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id) 
		ON DELETE CASCADE
        ON UPDATE CASCADE,
    ADD CONSTRAINT profiles_photo_id_fk
    FOREIGN KEY (photo_id) REFERENCES media(id) 
		ON DELETE SET NULL
        ON UPDATE CASCADE,
    ADD CONSTRAINT profiles_place_id_fk
    FOREIGN KEY (place_id) REFERENCES plases(id) 
		ON DELETE SET NULL
        ON UPDATE CASCADE;


ALTER TABLE communities_users
	ADD CONSTRAINT communities_users_community_id_fk
    FOREIGN KEY (community_id) REFERENCES communities(id) 
		ON DELETE CASCADE
        ON UPDATE CASCADE,
    ADD CONSTRAINT communities_users_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id) 
		ON DELETE CASCADE
        ON UPDATE CASCADE;    
        
DESC friendship;        

ALTER TABLE friendship 
	MODIFY COLUMN status_id INT UNSIGNED NULL;

ALTER TABLE friendship
	ADD CONSTRAINT friendship_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id) 
		ON DELETE CASCADE
        ON UPDATE CASCADE,
    ADD CONSTRAINT friendship_friend_id_fk
    FOREIGN KEY (friend_id) REFERENCES users(id) 
		ON DELETE CASCADE
        ON UPDATE CASCADE,
    ADD CONSTRAINT friendship_status_id_fk
    FOREIGN KEY (status_id) REFERENCES friendship_statuses(id) 
		ON DELETE SET NULL
        ON UPDATE CASCADE;
        
 DESC likes;      
 
 ALTER TABLE likes 
	MODIFY COLUMN target_type_id INT UNSIGNED NULL;
    
 ALTER TABLE likes
	ADD CONSTRAINT likes_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id) 
		ON DELETE CASCADE
        ON UPDATE CASCADE,
    ADD CONSTRAINT likes_target_type_id_fk
    FOREIGN KEY (target_type_id) REFERENCES target_types(id) 
		ON DELETE SET NULL
        ON UPDATE CASCADE;
        
DESC media;

ALTER TABLE media 
	MODIFY COLUMN media_type_id INT UNSIGNED NULL; 
    
ALTER TABLE media
	ADD CONSTRAINT media_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id) 
		ON DELETE CASCADE
        ON UPDATE CASCADE,
    ADD CONSTRAINT media_media_type_id_fk
    FOREIGN KEY (media_type_id) REFERENCES media_types(id) 
		ON DELETE SET NULL
        ON UPDATE CASCADE;    
        
DESC meetings_users;

ALTER TABLE meetings_users
	ADD CONSTRAINT meetings_users_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id) 
		ON DELETE CASCADE
        ON UPDATE CASCADE,
    ADD CONSTRAINT meetings_users_meeting_id_fk
    FOREIGN KEY (meeting_id) REFERENCES meetings(id) 
		ON DELETE CASCADE
        ON UPDATE CASCADE;   

DESC messages;

ALTER TABLE messages
	ADD CONSTRAINT messages_from_user_id_fk
    FOREIGN KEY (from_user_id) REFERENCES users(id) 
		ON DELETE CASCADE
        ON UPDATE CASCADE,
    ADD CONSTRAINT messages_to_user_id_fk
    FOREIGN KEY (to_user_id) REFERENCES users(id) 
		ON DELETE CASCADE
        ON UPDATE CASCADE;  
        
DESC posts;

ALTER TABLE posts 
	MODIFY COLUMN media_id INT UNSIGNED NULL; 

ALTER TABLE posts
	ADD CONSTRAINT posts_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id) 
		ON DELETE CASCADE
        ON UPDATE CASCADE,
    ADD CONSTRAINT posts_media_id_fk
    FOREIGN KEY (media_id) REFERENCES media(id) 
		ON DELETE SET NULL
        ON UPDATE CASCADE;          
