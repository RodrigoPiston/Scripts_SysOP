permisoBD(){ 

    echo "Ingrese el nombre del permiso ('connect, resource, dba'), 0 para cancelar: " read permBD 
 
    dato=$permBD 
    modo="VERIFVC" 
    . ./ve 
 
    if [ "$permBD" != "connect" ] && [ "$permBD" != "resource" ] && [ "$permBD" != "dba" ]; then 
        echo "" 
        echo "Permiso ingresado incorrecto, intente nuevamente" read enter 
        continue 
    fi 
} 
 
permisoTabla(){ 
    echo "Ingrese el nombre del permiso ('select, insert, update, delete, all'), 0 para cancelar: " read permT 
 
    dato=$permT modo="VERIFVC" 
    . ./ve 
 
    if [ "$permT" != "select" ] && [ "$permT" != "insert" ] && [ "$permT" != "update" ] && [ "$permT" != "delete" ] && [ "$permT" != "all" ]; then 
        echo "" 
        echo "Permiso ingresado incorrecto, intente nuevamente" read enter 
        continue 
    fi 

    echo "Ingrese el nombre de la tabla: (0 para cancelar) " read tabla 
 
    dato=$tabla 
    modo="VERIFVC" 
    . ./ve 
} 
 
pedirUser(){ 
    echo "Ingrese el nombre del usuario: (0 para cancelar)" read usuario 
    dato=$usuario 
    modo="VERIFVC" 
    . ./ve 
    modo="VERIFU" 
    . ./ve 
} 
 
nomBD(){ 
    echo "Ingrese el nombre de la base de datos: (0 para cancelar) " read base 
    dato=$base 
    modo="VERIFVC" 
    . ./ve } 
 
# Menu 
while [ "$op8" != "0" ]; do 
    clear  
    echo "------- Administración de permisos de base de datos -------"  
    echo "       "  
    echo "  1) Asignar permiso en una Base de Datos "  
    echo "  2) Asignar permisos en una tabla "  
    echo "  3) Eliminar permisos de una Base de datos "  
    echo "  4)  Eliminar permisos de una Tabla "  
    echo "  0)  Volver     "  
    echo "      "  
    echo -n "     Ingrese una opcion del menu: "    read op8  
    case $op8 in 
    1) while [ 1 ]; do 
        clear 
    #EJECUCIÓN DE FUNCIONES 
        permisoBD 
        while [ 1 ]; do 
            clear 
            pedirUser 
    
            while [ 1 ]; do 
            clear 
            nomBD 
            echo "" 
            echo "Asignando el permiso : $permBD al usuario: $usuario en la base de datos: $base" 
            echo "grant $permBD to $usuario" | dbaccess $base 

            dato=$(echo $?) 
            modo="VERIFP" 
            . ./ve 
            break 
            done 
        break 
        done 
    break 
    done 
    ;; 
    2) while [ 1 ]; do 
        clear #EJECUCION DE FUNCIONES 
        pedirUser 
        while [ 1 ]; do 
        clear 
        permisoTabla 
        clear 
        nomBD 
        echo "" 
        echo "Asignando permiso: $permT , en la tabla: $tabla , para el usuario: $usuario , en la base de datos: $base" 
        echo "grant $permT on $tabla to $usuario" | dbaccess $base 
 
        dato=$(echo $?) 
        modo="VERIFP" 
        . ./ve 
        break 
        done 
    break 
    done 
    ;; 
    3) while [ 1 ]; do 
        clear 
        #EJECUCION DE FUNCIONES 
        permisoBD 
        while [ 1 ]; do     
            clear 
            pedirUser 
            while [ 1 ]; do 
            clear 
            nomBD 
            echo "" 
            echo "Revocando el permiso : $permBD del usuario: $usuario de la base de datos: $base" 
            echo "revoke $permBD from $usuario" | dbaccess $base 

            dato=$(echo $?) 
            modo="VERIFP" 
            . ./ve 
            break 
            done 
        break 
        done 
    break 
    done 
    ;; 
    4) while [ 1 ]; do 
        clear 
        #EJECUCION DE FUNCIONES 
        pedirUser while [ 1 ]; do 
        clear 
        permisoTabla 
        clear 
        nomBD 
        echo "" 
        echo "Revocando el permiso: $permT , de la tabla: $tabla , del el usuario: $usuario , de la base de datos: $base" 
        echo "revoke $permT on $tabla from $usuario" | dbaccess $base 
        dato=$(echo $?) 
        modo="VERIFP" 
        . ./ve 
        break 
        done 
        break 
        done 
        ;; 
        0) 
        clear 
        ;; 
        *) 
        echo "" 
        echo "Ingrese una opcion valida del menu" read enter ;; 
    esac 
done