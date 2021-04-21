(define  (domain d-pizzeria)
    (:requirements :typing :fluents :negative-preconditions :equality :durative-actions)

    (:types
        moto
        comida
        lugar
        pizza plato - comida
        casa restaurante gasolinera - lugar
    )

    (:functions 
        
        (capacidad_pedidos ?m - moto)
        (carga_actual ?m - moto)
        (velocidad ?m - moto)

        (capacidad_gasolina ?m - moto)
        (gasolina_actual ?m - moto)
        (umbral_gasolina)

        (dur_amasado)(dur_cobrado)
        (dur_topping)(dur_hornead) 
        (dur_entrega)(dur_cocinad ?pl - plato)
        (dur_cargado)(dur_gasolin)

        (distancia ?li ?lf - lugar) (gasolina_necesaria ?li ?lf - lugar)
        
    )

    (:predicates

        (AMASADA  ?pi - pizza)
        (TOPPING  ?pi - pizza)
        (HORNEADA ?pi - pizza)
        (COCINADO ?pl - plato)

        (PREPARADO ?p - comida)
        (CARGADO   ?m - moto ?p - comida)

        (EN ?m - moto ?l - lugar)

        (ENTREGADO ?p - comida ?c - casa)
        (COBRADO   ?p - comida ?c - casa)
    )

    (:durative-action amasar
        
        :parameters (?pi - pizza)

        :duration (= ?duration (dur_amasado))

        :condition (at start (not (AMASADA ?pi)))

        :effect (at end (AMASADA ?pi))
    )
 
    (:durative-action anadir_toppings
        
        :parameters (?pi - pizza)

        :duration (= ?duration (dur_topping))

        :condition (at start (and (AMASADA ?pi) (not (TOPPING ?pi))))

        :effect (at end (TOPPING ?pi))
    )
    
    (:durative-action hornear
        
        :parameters (?pi - pizza)

        :duration (= ?duration (dur_hornead))

        :condition (at start (and (TOPPING ?pi) (not (HORNEADA ?pi))))

        :effect (at end (and (HORNEADA ?pi) (PREPARADO ?pi)))
    )

    (:durative-action cocinar
        
        :parameters (?pl - plato)

        :duration (= ?duration (dur_cocinad ?pl))

        :condition (at start (not (COCINADO ?pl)))

        :effect (at end (and (COCINADO ?pl) (PREPARADO ?pl)))
    )

    (:durative-action cargar
        
        :parameters (?m - moto ?pi - comida ?r - restaurante)

        :duration (= ?duration (dur_cargado))

        :condition (and (at start (and (PREPARADO ?pi) 
                                  (>= (capacidad_pedidos ?m) (+ 1 (carga_actual ?m)))
                                  (not (CARGADO ?m ?pi))))
                        (over all (EN ?m ?r)))

        :effect (at end (and (CARGADO ?m ?pi) (increase (carga_actual ?m) 1) (not (PREPARADO ?pi))))
    )

    (:durative-action desplazar
        
        :parameters (?m - moto ?li ?lf - lugar)

        :duration (= ?duration (* 3600 (/ (distancia ?li ?lf) (velocidad ?m))))

        :condition (at start (and (not (= ?li ?lf)) (EN ?m ?li) (> (gasolina_actual ?m) (umbral_gasolina)) (>= (gasolina_actual ?m) (gasolina_necesaria ?li ?lf ))))
    
        :effect (and (at start (not (EN ?m ?li))) 
                     (at end (and (EN ?m ?lf) (decrease (gasolina_actual ?m) (gasolina_necesaria ?li ?lf )))))
    )

    (:durative-action cobrar
        
        :parameters (?m - moto ?c - casa ?p - comida)

        :duration (= ?duration (dur_cobrado))

        :condition (and (at start (and (CARGADO ?m ?p) (not (COBRADO ?p ?c))))
                        (over all (EN ?m ?c)))

        :effect (at end (COBRADO ?p ?c))
    )

    (:durative-action entregar
        
        :parameters (?m - moto ?c - casa ?p - comida)

        :duration (= ?duration (dur_entrega))

        :condition (and (at start (and (CARGADO ?m ?p) (COBRADO ?p ?c) (not (ENTREGADO ?p ?c))))
                        (over all (EN ?m ?c)))
        
        :effect (at end (and (ENTREGADO ?p ?c) (decrease (carga_actual ?m) 1) (not (CARGADO ?m ?p))))
    )

    (:durative-action echar_gasolina
        
        :parameters (?m - moto ?g - gasolinera)

        :duration (= ?duration (dur_gasolin))

        :condition (and (at start (<= (gasolina_actual ?m) (umbral_gasolina)))
                        (over all (EN ?m ?g)))
        
        :effect (at end (increase (gasolina_actual ?m) (- (capacidad_gasolina ?m) (gasolina_actual ?m))))
    )

)

