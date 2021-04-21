(define (problem p-plantingseason)
        (:domain d-plantingseason)

    (:objects rastrillo1 - rastrillo
              arado1 - arado
              hoz1 - hoz
              guadana1 - guadana
              manguera1 manguera2 - manguera
              peras fresas trigo judias - planta
              parcela1 parcela2 parcela3 - terreno
    )

    (:init 
     	   (= (coste_total) 0)
           (= (crecimiento_planta_total) 100)
     
           (= (t_abonar)      1)   
           (= (t_comprar)     1)  (no_en_uso     arado1) 
           (= (t_arar)        1)  (no_en_uso   guadana1)      
           (= (t_cosechar)    1)  (no_en_uso       hoz1)      
           (= (t_plantar)     1)  (no_en_uso rastrillo1)    
           (= (t_rastrillar)  1)  (no_en_uso     arado1)      
           (= (t_regado)    100)  (no_en_uso  manguera1)   
           (= (t_crecer)    100)  (no_en_uso  manguera2)
     
           (= (capacidad_abono_total) 500) (= (capacidad_abono_actual) 500)
           (= (capacidad_agua_total)  500) (= (capacidad_agua_actual)  500) 
     	
           (= (tamano parcela1) 100) (= (incremento_crecimiento_por_agua parcela1) 1) 
           (cosechado parcela1) (no_abonado parcela1) (no_rastrillado parcela1) (no_arado parcela1)  
     
     	   (= (tamano parcela2) 110) (= (incremento_crecimiento_por_agua parcela2) 1) 
           (cosechado parcela2) (no_abonado parcela2) (no_rastrillado parcela2) (no_arado parcela2)
     
           (= (tamano parcela3) 120) (= (incremento_crecimiento_por_agua parcela3) 1)
           (cosechado parcela3) (no_abonado parcela3) (no_rastrillado parcela3) (no_arado parcela3)		
         
     	   (= (cosecha peras) 0) 
           (= (capacidad_semillas peras) 200) (= (semillas_actuales peras) 200) (= (coste_semilla peras) 0.2)
           (= (crecimiento_planta_fase peras) 20) (= (agua_necesaria_riego peras) 2.5)
     	
           (= (cosecha fresas) 0) 
           (= (capacidad_semillas fresas) 200) (= (semillas_actuales fresas) 200) (= (coste_semilla fresas) 0.2)
           (= (crecimiento_planta_fase fresas) 20) (= (agua_necesaria_riego fresas) 2.5)
     
           (= (cosecha trigo) 0) 
           (= (capacidad_semillas trigo) 500) (= (semillas_actuales trigo) 500) (= (coste_semilla trigo) 0.05)
           (= (crecimiento_planta_fase trigo) 10) (= (agua_necesaria_riego trigo) 1)
     
           (= (cosecha judias) 0) 
           (= (capacidad_semillas judias) 300) (= (semillas_actuales judias) 300) (= (coste_semilla judias) 0.1)
           (= (crecimiento_planta_fase judias) 30) (= (agua_necesaria_riego judias) 4)

    )

    (:goal
         (and (>= (cosecha peras) 100) (>= (cosecha fresas) 300) (>= (cosecha trigo) 500) (>= (cosecha judias) 305))
    )
  
  	(:metric minimize (total-time)) 
)