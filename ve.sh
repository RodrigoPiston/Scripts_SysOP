encontrar_grupo(){ 
    #Verifica si el grupo existe 
    cat /etc/group | awk -F: '$3>499 { print $1}' | grep -w $dato 2> /dev/null 1> /dev/null 
    if test $? -eq 0; then 
        echo "" 
        echo "El grupo ya existe, intente nuevamente" 
        read enter 
       continue 
    fi  
} 
verificar_grupo(){ 
    #Verifica si el grupo existe 
    cat /etc/group | awk -F: '$3>499 { print $1}' | grep -w $dato 2> /dev/null 1> /dev/null 
        if test $? -ne 0 ; then 
            echo "" 
            echo "No se encuentra el grupo ingresado, intente nuevamente" 
            read enter 
            continue 
        fi 
} 
encontrar_usuario(){ 
    #verifica si el usuario ya existe 
    cat /etc/passwd | awk -F: '$3>499 { print $1}' | grep -w $dato 2> /dev/null 1> /dev/null 
    if test $? -eq 0; then 
        echo "" 
        echo "El Usuario ya existe, intente nuevamente" 
        read enter 
        continue 
    fi  
} 
verificar_usuario(){ 
    #verifica si el usuario existe 
    cat /etc/passwd | awk -F: '$3>499 { print $1}' | grep -w $dato 2> /dev/null 1> /dev/null 
    if test $? -ne 0; then 
        echo "" 
        echo "No se encuentra el usuario ingresado, intente nuevamente" 
        read enter 
        continue 
    fi 
} 

verificar_vacio_cancelado(){ 
  
    if [ -z "$dato" ]; then  
        echo "" 
        echo "No se permiten datos vacios, intente nuevamente" 
        read enter 
        continue   
    fi 
 
    if [ "$dato" = "0" ]; then  #Termina si se ingresa 0 
        echo "" 
        echo "Cancelado por el usuario" 
        read enter 
        break 
    fi 
} 
 
verificar_permiso(){ 
 
    if [ "$dato" = "0" ]; then 
       echo "" 
       echo "Acción realizada con exito" 
       read enter 
    else 
        echo "" 
        echo "Error,Enter para continuar" 
        read enter 
        continue 
    fi 
} 
 
# Dependiendo del modo que llegue es a la función que llama 
 
if [ "modo" = "VERIFVC" ]; then 
    verificar_vacio_cancelado
elif [ "modo" = "ENCONTRG" ]; then 
    encontrar_grupo 
elif [ "modo" = "ENCONTRU" ]; then 
    encontrar_usuario 
elif [ "modo" = "VERIFG" ]; then 
    verificar_grupo 
elif [ "modo" = "VERIFU" ]; then 
    verificar_usuario 
elif [ "modo" = "VERIFP" ]; then 
    verificar_permiso 
fi   