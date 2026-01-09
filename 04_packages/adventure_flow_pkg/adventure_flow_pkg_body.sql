CREATE OR REPLACE PACKAGE BODY adventure_flow_pkg IS

PROCEDURE start_adventure(p_user_id      NUMBER
                         ,p_adventure_id NUMBER) IS

BEGIN
  INSERT INTO adandoned_adventure
    (id
    ,user_id
    ,adventure_id
    ,aborted_at
    ,last_station_id
    ,distance_travelled
    ,elapsed_sec)
  VALUES
    (NULL
    ,p_user_id
    ,p_adventure_id
    ,SYSDATE
    ,1
    ,NULL
    ,NULL);

END start_adventure;

PROCEDURE complete_adventure(p_user_id      NUMBER
                            ,p_adventure_id NUMBER
                            ,p_distance     NUMBER
                            ,p_duration     NUMBER) IS

BEGIN
  INSERT INTO completed_adventure
    (id
    ,user_id
    ,adventure_id
    ,completed_at
    ,distance_travelled
    ,duration_sec)
  VALUES
    (NULL
    ,p_user_id
    ,p_adventure_id
    ,SYSDATE
    ,p_distance
    ,p_duration);

END complete_adventure;

PROCEDURE update_abandon_adventure(p_user_id         NUMBER
                                  ,p_adventure_id    NUMBER
                                  ,p_last_station_id NUMBER
                                  ,p_distance        NUMBER
                                  ,p_elapsed_sec     NUMBER) IS

BEGIN
  UPDATE abandoned_adventure
     SET last_station_id    = p_last_station_id
        ,distance_travelled = p_distance
        ,elapsed_sec        = p_elapsed_sec
        ,aborted_at         = SYSDATE
   WHERE user_id = p_user_id
     AND adventure_id = p_adventure_id;
END update_abandoned_adventure;

PROCEDURE add_station(p_adventure_id NUMBER
                     ,p_lat          NUMBER
                     ,p_lon          NUMBER
                     ,p_riddle       VARCHAR2) IS

BEGIN
  INSERT INTO station
    (id
    ,adventure_id
    ,seq_number
    ,latitude
    ,longitude
    ,riddle_text)
  VALUES
    (NULL
    ,p_adventure_id
    ,NULL
    ,p_lat
    ,p_lon
    ,p_riddle);
END add_station;

END adventure_flow_pkg;
/
