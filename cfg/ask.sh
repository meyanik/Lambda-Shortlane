#/bin/bash

cat << "EOF"
===============================================================================
    _        _    _                     _                            __         
   | |      / \  | |__   ___  _ __ __ _| |_ ___  _ __ _   _    ___  / _|        
   | |     / _ \ | '_ \ / _ \| '__/ _` | __/ _ \| '__| | | |  / _ \| |_         
   | |___ / ___ \| |_) | (_) | | | (_| | || (_) | |  | |_| | | (_) |  _|        
   |_____/_/   \_\_.__/ \___/|_| _\__,_|\__\___/|_|   \__, |  \___/|_|          
   |  \/  (_) ___ _ __ ___   ___| | ___  ___| |_ _ __ |___/_ __ (_) ___ ___     
   | |\/| | |/ __| '__/ _ \ / _ \ |/ _ \/ __| __| '__/ _ \| '_ \| |/ __/ __|    
   | |  | | | (__| | | (_) |  __/ |  __/ (__| |_| | | (_) | | | | | (__\__ \   
   |_|_ |_|_|\___|_|  \___/ \___|_|\___|\___|\__|_|  \___/|_| |_|_|\___|___/    
  | __ )  __ _ ___  ___  __| | |  _ \  ___  ___(_) __ _ _ __                    
  |  _ \ / _` / __|/ _ \/ _` | | | | |/ _ \/ __| |/ _` | '_ \                   
  | |_) | (_| \__ \  __/ (_| | | |_| |  __/\__ \ | (_| | | | |                  
  |____/ \__,_|___/\___|\__,_| |____/ \___||___/_|\__, |_| |_|   _              
    __ _ _ __   __| |    / \  _   _| |_ ___  _ __ |___/ __ _| |_(_) ___  _ __   
   / _` | '_ \ / _` |   / _ \| | | | __/ _ \| '_ ` _ \ / _` | __| |/ _ \| '_ \  
  | (_| | | | | (_| |  / ___ \ |_| | || (_) | | | | | | (_| | |_| | (_) | | | | 
   \__,_|_| |_|\__,_| /_/   \_\__,_|\__\___/|_| |_| |_|\__,_|\__|_|\___/|_| |_| 

===============================================================================
PLEASE SELECT THE CIRCUIT TYPE FOR CONFIG FILE
===============================================================================

EOF

PS3="1 for combinational,2 for sequential configuration : "

select opt in comb seq; do

  case $opt in
    comb)
	cp $(pwd)/cfg/comb/config.json /foss/tools/openlane/2022.12/designs/$filename/
	sed -i "s/To_Be_Replaced/$filename/g" /foss/tools/openlane/2022.12/designs/$filename/config.json
	exit 0
      ;;
    seq)
      cp /foss/designs/TangNano/led_btn/cfg/seq/config.json /foss/tools/openlane/2022.12/designs/$filename/
	exit 0
      ;;
    *) 
      echo "Invalid option $REPLY"
      ;;
  esac
done
