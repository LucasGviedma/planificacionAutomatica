(define (domain d-plantingseason)

    (:requirements :typing :durative-actions :fluents :equality :conditional-effects)   

    (:types 
        
        planta 
        herramienta
        terreno
    
        rastrillo    - herramienta
        arado        - herramienta
        hoz guadana  - herramienta
        manguera     - herramienta
        
        fruta hortalizas secano - planta
        
        
    )

    (:functions 
        
        (t_rastrillar)
        (t_arar)
        (t_cosechar)
        (t_abonar)
        (t_regado)
        (t_plantar)
        (t_crecer)
                
        (incremento_crecimiento_por_agua ?t - terreno)

        (crecimiento_planta_total)
        (crecimiento_planta_actual ?p - planta)
        (crecimiento_planta_fase   ?p - planta)

        (capacidad_abono_total)
        (capacidad_abono_actual)
        (capacidad_llenado_abono)

        (capacidad_agua_total)
        (capacidad_agua_actual)
        (capacidad_llenado_agua)

        (agua_necesaria_riego ?p - planta)
        (tamano ?t - terreno)
        
    )

    (:predicates 
        
        (rastrillado    ?t - terreno)      
        (no_rastrillado ?t - terreno)     
        (arado          ?t - terreno)
        (no_arado       ?t - terreno)
        (ocupado        ?t - terreno)
        (no_ocupado     ?t - terreno)  
        (cosechado      ?t - terreno)
        (no_cosechado   ?t - terreno)  
        (abonado        ?t - terreno)
        (no_abonado     ?t - terreno) 
                
        (en ?p - planta ?t - terreno)

        (no_plantada    ?p - planta)   
        (no_creciendo   ?p - planta)
        (lista          ?p - planta)
                
        (no_en_uso ?h - herramienta)

    )

    (:durative-action abonar
        
        :parameters (?t - terreno)

        :duration (= ?duration (* (t_abonar) (tamano ?t)))

        :condition (and (at start (and (no_abonado ?t) (>= (capacidad_abono_actual) (tamano ?t))))
                        (over all (and (cosechado ?t))))

        :effect (and (at start (and (not (no_abonado ?t))))
                    (at end   (and (abonado ?t) (decrease (capacidad_abono_actual) (tamano ?t)))))
    )

    (:durative-action rastrillar
        
        :parameters (?r - rastrillo ?t - terreno)

        :duration (= ?duration (* (t_rastrillar) (tamano ?t)))

        :condition (and (at start (and (no_rastrillado ?t) (no_en_uso ?r)))
                        (over all (and (abonado ?t))))

        :effect (and (at start (and (not (no_rastrillado ?t)) (not (no_en_uso ?r))))
                    (at end   (and (rastrillado ?t) (no_en_uso ?r))))
    )

    (:durative-action arar
        
        :parameters (?a - arado ?t - terreno)

        :duration (= ?duration (* (t_arar) (tamano ?t)))

        :condition (and (at start (and (no_arado ?t) (no_en_uso ?a)))
                        (over all (and (rastrillado ?t))))

        :effect (and (at start (and (not (no_arado ?t)) (not (no_en_uso ?a))))
                    (at end   (and (arado ?t) (no_en_uso ?a))))
    )

    (:durative-action plantar
        
        :parameters (?p - planta ?t - terreno)

        :duration (= ?duration (* (t_plantar) (tamano ?t)))
        
        :condition (and (at start (and (no_ocupado ?t) (no_plantada ?p)))
                        (over all (and (arado ?t))))

        :effect (and (at start (and (not (no_ocupado ?t)) (not (no_plantada ?p))))
                    (at end   (and (ocupado ?t) (en ?p ?t) (no_cosechado ?t))))
    )

    (:durative-action cosechar
        
        :parameters (?h - (either hoz guadana) ?t - terreno ?p - planta)

        :duration (= ?duration (* (t_cosechar) (tamano ?t)))

        :condition (at start (and (no_cosechado ?t) (en ?p ?t) (no_en_uso ?h) (>= (crecimiento_planta_actual ?p) (crecimiento_planta_total))))

        :effect (and (at start (and (not (no_cosechado ?t)) (not (ocupado ?t)) (not (no_en_uso ?h))))
                    (at end   (and (cosechado ?t) (no_ocupado ?t) (no_en_uso ?h)
                                    (not (en ?p ?t))       (lista ?p) 
                                    (not (arado ?t))       (no_arado ?t)
                                    (not (abonado ?t))     (no_abonado ?t)
                                    (not (rastrillado ?t)) (no_rastrillado ?t)
                                    (assign (incremento_crecimiento_por_agua ?t) 1))))
    )

    (:durative-action crecer

        :parameters (?p - planta ?t - terreno)
        
        :duration (= ?duration (t_crecer))
                    
        :condition (at start (and (en ?p ?t) (no_creciendo ?p)))
                    
        :effect (and (at start (and (not (no_creciendo ?p))))
                    (at end (and (increase (crecimiento_planta_actual ?p) (* (crecimiento_planta_fase ?p) (incremento_crecimiento_por_agua ?t))) (no_creciendo ?p))))
    )
    
    (:durative-action regar
        
        :parameters (?m - manguera ?t - terreno ?p - planta)

        :duration (= ?duration (t_regado))

        :condition (and (at start (and (no_creciendo ?p) (= (incremento_crecimiento_por_agua ?t) 1) (>= (capacidad_agua_actual) (* (agua_necesaria_riego ?p) (tamano ?t)))))
                        (over all (and (en ?p ?t))))

        :effect (and (at end (and (assign (incremento_crecimiento_por_agua ?t) 2) (decrease (capacidad_agua_actual) (* (agua_necesaria_riego ?p) (tamano ?t))))))
    )
    
    (:durative-action llenar-deposito-agua
                    
        :parameters ()
                    
        :duration (= ?duration (- (capacidad_agua_total) (capacidad_agua_actual)))
                    
        :condition (at start (>= (* (capacidad_agua_total) (capacidad_llenado_agua)) (capacidad_agua_actual)))
                    
        :effect (at end (increase (capacidad_agua_actual) (- (capacidad_agua_total) (capacidad_agua_actual))))
    )

    (:durative-action llenar-deposito-abono
                    
        :parameters ()
                    
        :duration (= ?duration (- (capacidad_abono_total) (capacidad_abono_actual)))
                    
        :condition (at start (>= (* (capacidad_abono_total) (capacidad_llenado_abono)) (capacidad_abono_actual)))
                    
        :effect (at end (increase (capacidad_abono_actual) (- (capacidad_abono_total) (capacidad_abono_actual))))
    )
  
)