while [ "$op5" != "0" ] do 
       clear 
       echo "------------- Informacion del Servidor -------------" 
       echo "" 
       echo "   1) Verificar espacio del disco duro" 
       echo "   2) Informacion del disco duro" 
       echo "   3) Ver procesos del sistema"  
       echo "   4) Verificar conexiones establecidas" 
       echo "   0) Volver" 
       echo "" 
       echo -n "  Ingrese una opcion del menu: " read op5 
    
    case "$op5" in 
 
    1) clear 
        echo "Estado del disco duro: " 
        echo "" df -h /  
        echo "" 
        echo "Presionar enter para continuar" read enter 
    ;; 
    2) 
        clear 
        smartctl -i /dev/sda 
        echo "" 
        echo "Presione Enter para continuar" read enter 
    ;; 
    3) 
        clear 
        echo "Para ver los procesos del sistema presione Enter " 
        echo "" 
        echo " AVISO: Para salir de la visualizacion de los procesos presione 'q'" read enter top 
    ;; 
    4) 
        netstat -punta 
        echo "" 
        echo "Enter para continuar" read enter 
    ;; 
    0) 
    ;; 
    *) 
        echo "Ingrese una opcion valida del menuº" read enter  
    ;; 
    esac 
done 
 