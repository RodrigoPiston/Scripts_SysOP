while [ "$op6" != "0" ];  do 
    clear 
    echo "------- Administracion de Permisos para archivos -------" 
    echo "     " 
    echo "   1)  Asignar permiso de lectura " 
    echo "   2)  Asignar permiso de escritura" 
    echo "   3)  Asignar permiso de ejecucion" 
    echo "   4)  Asignar todos los permisos " 
    echo "   5)  Quitar permiso de lectura " 
    echo "   6)  Quitar permiso de escritura " 
    echo "   7)  Quitar permiso de ejecucion " 
    echo "   8)  Quitar todos los permisos " 
    echo "   0)  Volver   " 
    echo "     " 
    echo -n "     Ingrese una opcion del menu: "  
    read op6 
    case $op6 in 
 
    1) while [ 1 ]; do 
        clear 
        echo -n "Ingrese el nombre de un archivo: (0 para cancelar) " 
        read archivo1    
        dato=$archivo1 
        modo="VERIFVC" 
        . ./ve 
        chmod +r $archivo1 
    
        dato=$(echo $?) 
        modo="VERIFP" 
        . ./ve 
    break 
    done 
    ;; 
    2) while [ 1 ]; do 
        clear 
        echo -n "Ingrese el nombre de un archivo: (0 para cancelar) " 
        read archivo2    
        dato=$archivo2 
        modo="VERIFVC" 
        . ./ve 
    
        chmod +w $archivo2 
    
        dato=$(echo $?) 
        modo="VERIFP" 
        . ./ve 
    break 
    done 
    ;; 
    3) while [ 1 ]; do 
        clear 
        echo -n "Ingrese el nombre de un archivo: (0 para cancelar) " 
        read archivo3 
        dato=$archivo3 
        modo="VERIFVC" . ./ve 
        chmod +x $archivo3 
        dato=$(echo $?) 
        modo="VERIFP" 
        . ./ve 
    break 
    done 
    ;; 
    4) while [ 1 ]; do 
        clear 
        echo -n "Ingrese el nombre de un archivo: (0 para cancelar) " 
        read archivo4    
        dato=$archivo4 
        modo="VERIFVC" 
        . ./ve  
        chmod +rwx $archivo4   
        dato=$(echo $?) 
        modo="VERIFP" 
        . ./ve 
    break 
    done 
    ;; 
    5) while [ 1 ]; do 
        clear 
        echo -n "Ingrese el nombre de un archivo: (0 para cancelar)" 
        read archivo5 
        dato=$archivo5 
        modo="VERIFVC" 
        . ./ve 
        chmod -r $archivo5 
        dato=$(echo $?) 
        modo="VERIFP" 
        . ./ve 
    break 
    done 
    ;; 
    6) while [ 1 ]; do 
    clear 
    echo -n "Ingrese el nombre de un archivo: (0 para cancelar) " 
    read archivo6 
    dato=$archivo6 
    modo="VERIFVC" 
    . ./ve 
    chmod -w $archivo6 
    dato=$(echo $?) 
    modo="VERIFP"
    . ./ve 
    break 
    done    
    ;; 
    7) while [ 1 ]; do 
        clear 
        echo -n "Ingrese el nombre de un archivo: (0 para cancelar) " 
        read archivo7 
        dato=$archivo7 
        modo="VERIFVC" 
        . ./ve 
        chmod -x $archivo7 
    
        dato=$(echo $?) 
        modo="VERIFP" 
        . ./ve 
    break 
    done 
    ;; 
    8) while [ 1 ]; do 
        clear 
        echo -n "Ingrese el nombre de un archivo: (0 para cancelar) " 
        read archivo8 
        dato=$archivo8 
        modo="VERIFVC" 
        . ./ve 
        chmod -rwx $archivo8  
        dato=$(echo $?) 
        modo="VERIFP" 
        . ./ve 
    break 
    done 
    ;; 
    0) 
    clear 
    ;; 
    *) 
    clear 
    echo "Opcion Incorrecta, Ingrese una opcion valida del menu" read enter 
    clear 
    ;; 
    esac 
done 