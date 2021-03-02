(define (domain d-spaceOperations)

    (:requirements :strips :typing :equality :negative-preconditions)
    (:types
        instrument
        satellite
        direction
        mode
    )

    (:predicates
        (calibrated ?i - instrument)
        (on_board ?i - instrument ?s - satellite)
        (supports ?i - instrument ?m - mode)
        (power_on ?i - instrument)
        (pointing ?s - satellite ?d - direction)
        (maintenance ?s - satellite)
        (have_image ?d - direction ?m - mode)
    )

    (:action turn
        :parameters (?s - satellite ?d1 ?d2 - direction)
        :precondition (and (pointing ?s ?d1) (not(= ?d1 ?d2)))
        :effect (and (not(pointing ?s ?d1)) (pointing ?s ?d2))
    )

    (:action switch-on
        :parameters (?i - instrument ?s - satellite)
        :precondition (and (not(power_on ?i)) (on_board ?i ?s))
        :effect (and (power_on ?i))
    )

    (:action switch-off
        :parameters (?i - instrument ?s - satellite)
        :precondition (and (power_on ?i) (on_board ?i ?s))
        :effect (and (not(power_on ?i)))
    )

    (:action callibrate
        :parameters (?s - satellite ?i - instrument ?d - direction)
        :precondition (and (power_on ?i) (on_board ?i ?s) (not (pointing ?s ?d)))
        :effect (and (calibrated ?i))
    )

    (:action maintain
        :parameters (?s - satellite)
        :precondition (and (not (maintenance ?s)))
        :effect (and (maintenance ?s))
    )

    (:action take_image
        :parameters (?s - satellite ?d - direction ?i - instrument ?m - mode)
        :precondition (and (calibrated ?i)
                           (on_board ?i ?s)
                           (supports ?i ?m)
                           (power_on ?i)
                           (pointing ?s ?d)
                           (maintenance ?s))
        :effect (and (have_image ?d ?m) 
                     (not (maintenance ?s)))
    )

)