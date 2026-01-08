CREATE OR REPLACE PACKAGE user_management_pkg IS
PROCEDURE create_user(p_username VARCHAR2, 
                     p_email VARCHAR2,
                     p_password_hash VARCHAR2);
                     
PROCEDURE update_profile_desc(p_user_id NUMBER, 
                              p_profile_desc VARCHAR2);
                              
PROCEDURE follow_user(p_follower_id NUMBER, 
                      p_followed_id NUMBER);
                      
PROCEDURE UNfollow_user(p_follower_id NUMBER, 
                      p_followed_id NUMBER);
                      
END user_management_pkg;
/
