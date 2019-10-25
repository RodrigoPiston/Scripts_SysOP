while [ "$op4" != "0" ] do clear 
    echo "------------ Administrar red ------------" 
    echo "" 
    echo "   1) Verificar conexion con un host" 
    echo "   2) Verificar conexion a internet" 
    echo "   3) Verificar configuraciÃ³n de red" 
    echo "   0) Volver" 
    echo "" 
    echo -n "  Ingrese una opcion del menu: " read op4 
 
    case "$op4" in 
    1) while [ 1 ]; do 
        clear 
        echo "Introduzca una direccion IP: (0 para cancelar) " 
        read ip 
        dato=$ip 
        modo="VERIFVC" 
        . ./ve 
        ping -c6 $ip 
    
        if test $? -gt 0; then 
            echo "" 
            echo "Error, verifique la IP ingresada, Enter para continuar" 
            read enter 
            continue 
        fi 
        echo "" 
        echo "Presione Enter para continuar" 
        read enter 
    break 
    done 
    ;; 
    2) clear 
        echo "Iniciando ping a www.Carambula.net " 
        ping -c6 www.Carambula.net read enter 
    ;; 3) clear 
        echo "Configuración actual" ifconfig 
        echo "Enter para continuar" read enter 
    ;; 0) 
    ;; *) 
        echo "" 
        echo "Ingrese una opcion valida del menu" 
        read enter  
    ;; 
    esac 
done 
 