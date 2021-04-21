(define (problem p-plantingseason)
        (:domain d-plantingseason)

    (:objects 
     
     	   rastrillo1 - rastrillo
           arado1 - arado
           hoz1 - hoz
           guadana1 - guadana
           manguera1 manguera2 - manguera
           fruta1 fruta2 trigo1 horta1 - planta
           parcela1 parcela2 parcela3 - terreno
    )

    (:init 
     
           (= (crecimiento_planta_total) 100)
        
           (= (t_abonar)      1)  (no_en_uso     arado1) 
           (= (t_arar)        1)  (no_en_uso   guadana1)      
           (= (t_cosechar)    1)  (no_en_uso       hoz1)      
           (= (t_plantar)     1)  (no_en_uso rastrillo1)    
           (= (t_rastrillar)  1)  (no_en_uso     arado1)      
           (= (t_regado)    100)  (no_en_uso  manguera1)   
           (= (t_crecer)    100)  (no_en_uso  manguera2)
     
           (= (capacidad_abono_total) 500) (= (capacidad_abono_actual) 500) 
           (= (capacidad_agua_total)  500) (= (capacidad_agua_actual)  500) 
     	
           (= (tamano parcela1) 100) (= (incremento_crecimiento_por_agua parcela1) 1) 
           (cosechado parcela1) (no_abonado parcela1) (no_rastrillado parcela1) (no_arado parcela1) (no_ocupado parcela1)  
     
     	   (= (tamano parcela2) 130) (= (incremento_crecimiento_por_agua parcela2) 1) 
           (cosechado parcela2) (no_abonado parcela2) (no_rastrillado parcela2) (no_arado parcela2) (no_ocupado parcela2) 
     
           (= (tamano parcela3) 160) (= (incremento_crecimiento_por_agua parcela3) 1)
           (cosechado parcela3) (no_abonado parcela3) (no_rastrillado parcela3) (no_arado parcela3) (no_ocupado parcela3)		
         
     	   (no_plantada fruta1)
           (= (crecimiento_planta_actual fruta1) 0) (= (crecimiento_planta_fase fruta1) 20) (= (agua_necesaria_riego fruta1) 2.5)
     	
           (no_plantada fruta2)
           (= (crecimiento_planta_actual fruta2) 0) (= (crecimiento_planta_fase fruta2) 20) (= (agua_necesaria_riego fruta2) 2.5)
     
           (no_plantada trigo1)
           (= (crecimiento_planta_actual trigo1) 0) (= (crecimiento_planta_fase trigo1) 10) (= (agua_necesaria_riego trigo1)   1)
     
           (no_plantada horta1)
           (= (crecimiento_planta_actual horta1) 0) (= (crecimiento_planta_fase horta1) 30) (= (agua_necesaria_riego horta1)   4)

    )

    (:goal
      (and (cosechada trigo1) (cosechada fruta1) (cosechada fruta2) (cosechada horta1) )
    )
  
  	 (:metric minimize (total-time)) 
)