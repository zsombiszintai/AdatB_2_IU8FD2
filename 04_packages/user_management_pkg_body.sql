CREATE OR REPLACE PACKAGE BODY user_management_pkg IS

  PROCEDURE create_user(p_username      VARCHAR2
                       ,p_email         VARCHAR2
                       ,p_password_hash VARCHAR2) IS
  BEGIN
    INSERT INTO cityscape_user
      (id
      ,username
      ,email
      ,password_hash
      ,registration_date
      ,user_role
      ,profile_description
      ,profile_picture_url)
    VALUES
      (NULL
      ,p_username
      ,p_email
      ,p_password_hash
      ,SYSDATE
      ,NULL
      ,NULL
      ,NULL);
  END create_user;

  PROCEDURE update_profile(p_user_id      NUMBER
                          ,p_profile_desc VARCHAR2) IS
  BEGIN
    UPDATE cityscape_user
       SET profile_description = p_profile_desc
     WHERE id = p_user_id;
  END update_profile;

  PROCEDURE follow_user(p_follower_id NUMBER
                       ,p_followed_id NUMBER) IS
  BEGIN
    INSERT INTO user_follow
      (follower_id
      ,followed_id)
    VALUES
      (p_follower_id
      ,p_followed_id);
  END follow_user;

  PROCEDURE unfollow_user(p_follower_id NUMBER
                         ,p_followed_id NUMBER) IS
  BEGIN
    DELETE FROM user_follow
     WHERE follower_id = p_follower_id
       AND followed_id = p_followed_id;
  END unfollow_user;

END user_managment_pkg;
/
