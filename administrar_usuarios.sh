# Declaración de funciones utiles

while [ "$op3" != "0" ] do clear 
    echo "--------------- Administracion de usuarios ---------------" 
    echo "                              " 
    echo "          1) Crear un nuevo usuario                 " 
    echo "          2) Eliminar un usuario                    " 
    echo "          3) Modificar nombre de un usuario     " 
    echo "          4) Modificar contrasena de un usuario     " 
    echo "          5) Cambiar el grupo de un usuario         " 
    echo "          6) Quitar usuario de un grupo             " 
    echo "          7) Asignar grupos secundarios a un usuario" 
    echo "          0) Volver                                 " 
    echo "                                                    " 
    echo -n "            Ingrese una opcion del menu:         " 

    read op3 

    case "$op3" in 
    1) 
    while [ 1 ]; do 
    clear 
    echo -n "Ingrese el nombre de usuario: (0 para cancelar) " 
    read nom1   
    dato=$nom1 
    modo="VERIFVC" 
    . ./ve 
    modo="ENCONTRU" 
    . ./ve
 
        while [ 1 ]; do 
        echo "" 
        echo -n "Ingrese una contrasena: (0 para cancelar) " 
        read pass   
        dato=$pass 
        modo="VERIFVC" 
        . ./ve 
 
            while [ 1 ]; do 
            echo "" 
            echo -n "Ingrese el nombre del grupo para el usuario: (0 para cancelar) " 
            read grupo 
            dato=$grupo 
            modo="VERIFVC" 
            . ./ve 
            modo="VERIFG" 
            . ./ve 

                while [ 1 ]; do 
                echo "" 
                echo -n "Ingrese un comentario para el usuario: (0 para cancelar y 1 para omitir este paso) " 
                read desc 
 
                dato=$desc 
                modo="VERIFVC" 
                . ./ve 
 
                if [ "$desc" = "1" ]; then  desc="" fi 
 
                #se utilizara el nombre de usuario como nombre de directorio 
 
                sudo useradd -g "$grupo" -c "$desc" -d /home/"$nom1" -m -s /bin/bash -p "$pass" "$nom1" 
 
                if test $? -eq 0 ; then 
                    echo "" 
                    echo "Accion realizada con exito" 
                   echo "" 
                fi 
                echo "Enter para continuar" 
                read enter 
 
                #cierra el primer while opcion1 
                break  
                done #cierra el segundo while opcion1 
            break  
            done #cierra el tercer while opcion1 
        break 
        done
    #cierra el cuarto while opcion1 
    break done 
    ;; 2) 
 
    while [ 1 ]; do clear 
        echo"" 
        echo -n "Ingrese el nombre de usuario a eliminar: (0 para cancelar) " 
        read nom2 
    
        dato=$nom2 
        modo="VERIFVC" 
        . ./ve 
        modo="VERIFU"
        . ./ve 
    
        #borra al usuario junto a su directorio raiz 
        sudo userdel -r $nom2 2> /dev/null 1> /dev/null 
        echo "Usuario removido con exito"  
        read enter 
        break 
    done 
    ;; 
    3) 
    while [ 1 ]; do 
        clear  
        echo "" 
        echo "Modificar el nombre del usuario:, (0 para cancelar)" 
        read user7 
    
        dato=$user7 
        modo="VERIFVC" 
        . ./ve 
        modo="VERIFU"
        . ./ve 
        while [ 1 ]; do 
        echo "" 
        echo "Ingrese un nuevo nombre de usuario, (0 para cancelar)" 
        read user8 
        dato=$user8 
        modo="VERIFVC" 
        . ./ve 
        modo="ENCONTRU" 
        . ./ve 
 
        sudo usermod -l "$user8" "$user7" 
 
        if test $? -eq 0 ; then 
        echo "" 
        echo "Accion realizada con exito" 
        echo "" fi 
        echo "Enter para continuar" 
        read enter 
 
        break 
        done 
    break 
    done 
    ;; 
    4) 
    while [ 1 ]; do 
        clear  
        echo "Ingrese un nombre de usuario para modificar su contrasena: (0 para cancelar)" 
        echo "" 
        read user2 
    
        dato=$user2 modo="VERIFVC" 
        . ./ve 
        modo="VERIFU" 
        . ./ve 
    
        sudo passwd $user2 
        echo "Enter para continuar" 
        read enter 
        clear 
        break 
    done 
    ;; 
    5) 
    while [ 1 ]; do 
        clear  
        echo "" 
        echo "Ingrese un nombre de usuario para cambiar de grupo: (0 para cancelar)" 
        read user3 

        dato=$user3 
        modo="VERIFVC"
        . ./ve 
        modo="VERIFU" 
        . ./ve 
    
        #cierra while al final 
    
        while [ 1 ]; do 
        echo "Ingrese el nombre del nuevo grupo: (0 para cancelar)" 
        read groupNew 
 
        dato=$groupNew 
        modo="VERIFVC" 
        . ./ve 
        modo="VERIFG" 
        . ./ve 
 
        #cierra while al final  
        sudo usermod -g $groupNew $user3 
        echo "Se ha cambiado el grupo del usuario con exito" 
        read enter 
    
        #cierra primer while opcion4 
        break 
        done 
    #cierra segundo while opcion4 
    break 
    done 
    ;; 
    6) 
    while [ 1 ]; do 
        clear  
        echo "" 
        echo "Ingrese un nombre de usuario a remover de un grupo: (0 para cancelar)" 
        read user4 

        dato=$user4 
        modo="VERIFVC" 
        . ./ve 
        modo="VERIFU" 
        . ./ve 
        #cierra while al final 
        while [ 1 ]; do 
            echo "Ingrese el nombre del grupo a remover del usuario: (0 para cancelar)" 
            read groupChange 
            dato=$groupChange 
            modo="VERIFVC" 
            . ./ve 
            modo="VERIFG" 
            . ./ve 
 
            sudo gpasswd -d $user4 $groupChange 2> /dev/null 1> /dev/null 
            echo "El usuario se ha removido del grupo con exito" 
            read enter 
            #cierra primer while 
            break 
            done 
            #cierra segundo while 
        break 
        done 
    ;; 
    7) 
    while [ 1 ]; do clear  
        echo "" 
        echo -n "Ingrese nombre de usuario: (0 para cancelar) " 
        read user5 
    
        dato=$user5 
        modo="VERIFVC" 
        . ./ve 
        modo="VERIFU" 
        . ./ve 
    
        #cierra while al final 
    
        while [ 1 ]; do 
            echo "Ingrese el nombre del grupo secundario: (0 para cancelar)" 
            read grupoSec 

            dato=$grupoSec 
            modo="VERIFVC" 
            . ./ve 
            modo="VERIFG" 
            . ./ve 
    
            #cierra while al final 
            sudo usermod -G $grupoSec -a $user5 
            echo "Grupo secundario asignado con exito" 
            read enter 
            #cierra primer while opcion6 
        break 
        done #cierra segundo while opcion6
    break 
    done 
    ;; 
    0) 
    clear 
    ;; 
    *) 
    clear 
    echo "Opcion incorrecta, ingrese una opcion valida del menu " 
    read enter 
    ;; #cierra while administracion de usuarios 
esac 
done