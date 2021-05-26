(define (domain d-planetaryExploration)
    (:requirements :strips :equality :typing :disjunctive-preconditions :negative-preconditions :constraints :preferences :fluents :durative-actions)

    (:types
        coord rover_speed rover)

    (:functions 
     			(max_battery ?r - rover) (current_battery ?r - rover) (low_battery ?r - rover) 
                
                (speed    ?s - rover_speed ?r - rover ) 
                (distance ?ci ?cf - coord)

                (dur_pict) (pict_battery_use)
                (dur_dril) (dril_battery_use)
                (dur_comm) (comm_battery_use)
                (dur_anal) (anal_battery_use)
                (dur_rech) 
    )

    (:predicates
        (PICTURE       ?c - coord ?rover - rover)
        (DRILL         ?c - coord ?rover - rover)
        (COMMUNICATION ?c - coord ?rover - rover)
        (ANALYSIS      ?c - coord ?rover - rover)
        (IN            ?c - coord ?rover - rover) 
        (DANGER        ?c - coord) 
    )

    (:durative-action move
        
        :parameters (?r - rover ?ci ?cf - coord ?s - rover_speed )

        :duration (= ?duration (/ (distance ?ci ?cf) (speed ?s ?r)))

        :condition (at start (and (not (= ?ci ?cf))
                                  (IN ?ci ?r)
                                  (>  (current_battery ?r) (low_battery ?r))
                               	  (>= (current_battery ?r) (+ (distance ?ci ?cf) (speed ?s ?r)))))
        
        :effect (and (at start (not (IN ?ci ?r)))
                     (at end   (and (IN ?cf ?r)
                                    (decrease (current_battery ?r) (+ (distance ?ci ?cf) (speed ?s ?r))))))
    )

   (:durative-action take_pic
        
        :parameters (?c - coord ?r - rover)

        :duration (= ?duration (dur_pict))

        :condition (and (at start (and (> (current_battery ?r) (low_battery ?r))
                                       (>= (- (current_battery ?r) (pict_battery_use)) 0)))
                        (over all (IN ?c ?r)))
        
        :effect (at end (and (PICTURE ?c ?r) (decrease (current_battery ?r) (pict_battery_use))))
    )

    (:durative-action drill
        
        :parameters (?c - coord ?r - rover)

        :duration (= ?duration (dur_dril))

        :condition (and (at start (and (> (current_battery ?r) (low_battery ?r))
                                	   (>= (- (current_battery ?r) (dril_battery_use)) 0)))
                        (over all (IN ?c ?r)))
        
        :effect (at end (and (DRILL ?c ?r) (decrease (current_battery ?r) (dril_battery_use))))
    )

    (:durative-action communicate
        
        :parameters (?c - coord ?r - rover)

        :duration (= ?duration (dur_comm))

        :condition (and (at start (and (> (current_battery ?r) (low_battery ?r))
                                       (>= (- (current_battery ?r) (comm_battery_use)) 0)))
                        (over all (IN ?c ?r)))
        
        :effect (at end (and (COMMUNICATION ?c ?r) (decrease (current_battery ?r) (comm_battery_use))))
    )

    (:durative-action analyse
        
        :parameters (?c - coord ?r - rover)

        :duration (= ?duration (dur_anal))

        :condition (and (at start (and (> (current_battery ?r) (low_battery ?r))
                                       (>= (- (current_battery ?r) (anal_battery_use)) 0)))
                        (over all (IN ?c ?r)))
        
        :effect (at end (and (ANALYSIS ?c ?r) (decrease (current_battery ?r) (anal_battery_use))))
    )

    (:durative-action recharge
        
        :parameters (?c - coord ?r - rover)

        :duration (= ?duration (dur_rech))

        :condition (and (at start (<= (current_battery ?r) (low_battery ?r)))
                        (over all (IN ?c ?r)))
        
        :effect (at end (increase (current_battery ?r) (- (max_battery ?r) (current_battery ?r))))
    )

)