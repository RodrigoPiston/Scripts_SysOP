while [ "$op" != "0" ] 
    do  clear echo "--------------  Menu Principal --------------" 
        echo "    " 
        echo "           1) Grupos / Usuarios                " 
        echo "           2) Base de Datos              " 
        echo "           3) Recursos del sistema      " 
        echo "           4) Red          " 
        echo "           5) Administrar permisos de archivos     " 
        echo "           0) Salir                             " 
        echo "                                               " 
        echo -n "        Ingrese una opcion del menu: "  read op 

    case $op in  
        1)  ./menu_grupos_usuarios  
        ;;  
        2)  ./administrar_base_de_datos  
        ;;  
        3)  ./administrar_servidor  
        ;;  
        4)  ./administrar_red  
        ;;  
        5)  ./administrar_permisos
        ;;  0)  
        clear  
        exit  
        ;;  
        *)  
            clear  
            echo " Opción incorrecta, ingrese una opción valida del menú "  
            echo  read enter  
            clear  
        ;;
    esac 
done 