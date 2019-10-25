while [ "$op1" != "0" ] 
    do  
        clear 
        echo "--------------- Grupos/Usuarios --------------- "  
        echo "                                              " 
        echo "         1) Administrar grupos de usuarios    " 
        echo "         2) Administrar usuarios              " 
        echo "         3) Ver usuarios conectados           " 
        echo "         4) Ver historial de un usuario       " 
        echo "         5) Listado de usuarios creados       " 
        echo "         0) Volver                            " 
        echo "                                              " 
        echo -n "            Ingrese una opcion del menu:   " 
        read op1 
    case "$op1" in 
    1) ./administrarGrupos 
    ;; 
    2) ./administrarUsuarios 
    ;; 
    3) clear 
    who -q 
    echo "" echo "Enter para continuar" 
    read enter 
    ;; 
    4) clear 
    while [ 1 ]; do 
        echo -n "Ingrese nombre de usuario: (0 para cancelar) " 
        read user 
        if [ "$user" = "root" ]; then  
            echo "Presione q si desea cerrar el historial!, Enter para ver historial" 
            read enter 
            less /root/.bash_history 
        else 
            dato=$user 
            modo="VERIFVC" 
            . ./ve 
            modo="VERIFU" 
            . ./ve 
            echo "Presione 'q' si desea cerrar el historial!" 
            read enter 
            less /home/$user/.bash_history 
        fi 
        break 
    done 
    ;; 
    5) clear 
        echo "" 
        echo "Para salir de la visualizacion presione 'q' " 
        read enter 
        clear cat /etc/passwd | awk -F: '$3>499 { print $1}' | sort | less 
        ;; 
    0) 
        clear 
    ;; *) clear 
        echo "Opcion incorrecta, ingrese una opcion valida del menu" 
        read enter ;; 
    #cierra while de inicio 
    esac done