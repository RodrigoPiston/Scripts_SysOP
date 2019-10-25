while [ "$op7" != "0" ]; do 
    clear 
    echo "---- Menú de administraciún de base de datos -----" 
    echo "       " 
    echo "  1)  Acceder al entorno MySql " 
    echo "  2)  Exportar base de datos  " 
    echo "  3)  Importar base de datos  " 
    echo "  4)  Asignar permisos            " 
    echo "  5)  Crear una base de datos " 
    echo "  6)  Borrar una base de datos " 
    echo "  0)  Volver     " 
    echo "       " 
    echo -n "     Ingrese una opcion del menu: "    
    read op7  
    case $op7 in 
    1) 
    # TODO: Falta configurar bd, usuario y nombre    
    mysql 
    ;; 
    2) 
    while [ 1 ];do 
        clear 
        read -p "Ingrese el nombre de la base de datos a exportar: (0 para cancelar)" exportar 
        dato=$exportar
        #Verificación de errores
        modo="VERIFVC" 
        . ./ve 
        # Exporta la tabla
        dbexport $exportar  
        
        if test $? -gt 0; then 
            echo "" 
            echo "Error, Presiona Enter para continuar" read enter 
            continue 
        fi 
            echo "Enter para continuar" read enter 
        break 
        done 
        ;; 
    3) 
    while [ 1 ]; do 
        clear 
        read -p "Ingrese el nombre de la base de datos a importar: (0 para cancelar) "  importar 
        dato=$importar 
        #Verificación de errores
        modo="VERIFVC" 
        . ./ve 

        dbimport -d datosdbs $importar  
        if test $? -gt 0; then 
        echo "" 
        echo "Error, Presiona Enter para continuar" read enter 
        continue 
        fi 
    break 
    done 
    ;; 
    4) 
    ./administrar_permisos_bd 
    ;; 
    5) while [ 1 ]; do 
        clear 
        echo "Ingrese el nombre de la nueva base de datos: (0 para cancelar) " read crear 

        dato=$crear 
        modo="VERIFVC" 
        . ./ve 

        echo "create database $crear in datosdbs" | dbaccess 
 
        if test $? -gt 0; then 
            echo "" 
            echo "Error, Presiona Enter para continuar" read enter 
            continue 
        fi 
    read enter 
    break 
    done 
    ;; 
    6) 
    while [ 1 ]; do 
    clear 
    read -p "Ingrese el nombre de la base de datos a eliminar: (0 para cancelar) " eliminar 
 
    dato=$eliminar 
    modo="VERIFVC" 
    . ./ve 

    echo "drop database $eliminar" | dbaccess 
 
    if test $? -gt 0; then 
        echo "" 
        read -p "Error, Presiona Enter para continuar" enter 
        continue 
    fi 
    read enter 
    break 
    done 
    ;; 
    0) 
    ;; 
    *) 
    echo "Ingrese una opcion valida del menu" 
    read enter 
    ;; 
esac  
done 