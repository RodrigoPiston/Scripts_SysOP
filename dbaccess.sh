while [ "$op0" != "0" ]; do 
    clear 
    echo "---- Administracion de base de datos ----" 
    echo "" 
    echo " 1) Crear Base de Datos   " 
    echo " 2) Crear estructura de la base de datos " 
    echo " 0) Salir    " 
    echo "" 
    echo -n "Ingrese una opcion del menu: "    
    read op0 
    case $op0 in 
    1) while [ 1 ]; do 
 
    read -p "Ingrese un nombre para la base de datos"  database 
    dato=$database 
    control="vc" 
    . ./ControlDeErrores 
 
    while [ 1 ]; do 
        echo "¿ Seguro desea crear la base de datos $database ? (s/n) 0 para cancelar" 
        read eleccion 
 
        dato=$eleccion 
        control="vc" 
        . ./ControlDeErrores 
        if [ "$eleccion" = "s" ]; then 
        echo "create database $database" | dbaccess 
        echo "Enter para continuar" 
        read enter 
        else 
        echo "No se ha creado ninguna base de datos" 
        read enter 
        fi 
        break 
        done 
        break 
        done 
        ;;
        2) 
        while [ 1 ]; do 
        clear 
        echo "Crear estructura en la base de datos de nombre " 
        read nombrBD 
        dato=$nombrBD 
        control="vc" 
        . ./ControlDeErrores 
        read enter 
        break 
        done 
        ;; 
        0) 
        clear 
        ;; 
        *) 
        echo "Ingrese una opcion valida del menu" 
        read enter  
        ;; 
        esac 
        done
        
