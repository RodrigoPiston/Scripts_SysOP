while [ "$op2" != "0" ] 
    do 
        clear 
        echo "--------------- Administración de grupos --------------- " 
        echo "                     " 
        echo "         1) Crear grupo de usuario        " 
        echo "         2) Eliminar grupo de usuario     " 
        echo "         3) Cambiar nombre de grupo       " 
        echo "         0) Volver                        " 
        echo "                                          " 
        echo -n "         Ingrese una opcion del menu:  " 
        read op2 
        
    case "$op2" in 
    1) while [ 1 ]; do 
        clear 
        echo -n "Ingrese el nombre del grupo: (0 para cancelar) " 
        read grupo     
        verificacion="registro"
        dato=$grupo 
        modo="VERIFVC" 
        . ./ve 
        modo="ENCONTRG" 
        . ./ve 
        sudo groupadd "$grupo"  
        if test $? -eq 0 ; then 
            echo "" 
            echo "Accion realizada con exito" 
            echo "" 
        fi 
        echo "Enter para continuar" 
        read enter 
    break 
    done 
    ;; 
    2) while [ 1 ];do 
        clear 
        echo -n "Ingrese el nombre del grupo a eliminar: (0 para cancelar) " 
        read grupoEliminar 
        dato=$grupoEliminar  
        modo="VERIFVC" 
        . ./ve 
        modo="VERIFG" 
        . ./ve 
        sudo groupdel "$grupoEliminar" 
        echo "Grupo eliminado con exito" 
        read enter 
        break   
    done 
    ;; 
    3) while [ 1 ]; do 
        clear 
        echo -n "Ingrese el nombre del grupo a modificar: (0 para cancelar) " 
        read nombre_grupo_viejo 
    
        dato=$nombre_grupo_viejo 
        modo="VERIFVC" 
        . ./ve 
        modo="VERIFG" 
        . ./ve 

        while [ 1 ]; do 
        
            echo -n "Ingrese el nuevo nombre del grupo: (0 para cancelar) " 
            read nuevo_nombre_grupo 
            
            dato=$nuevo_nombre_grupo 
            modo="VERIFVC" 
            . ./ve 
            modo="ENCONTRG" 
            . ./ve 

            sudo groupmod -n "$nuevo_nombre_grupo" "$nombre_grupo_viejo" 
        
            if test $? -eq 0 ; then 
            echo "" 
            echo "Accion realizada con exito" 
            echo "" fi 
            echo "Enter para continuar" 
            read enter 
        
        #cierra primer while de la opcion 3 
        break   
        done 
    #cierra el segundo while de la opcion 3 
    break   
    done 
    ;; 
    0) 
        clear 
    ;; 
    *) 
    echo"" 
    echo "Opcion incorrecta, ingrese una opcion valida del menú " 
    read enter 
    ;; 
    #cierra while administracion grupos 
esac 
done 