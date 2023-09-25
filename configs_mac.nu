let $configs = open ~/.dotfiles/configs_mac.yaml

for $c in ( $configs | transpose ) {

    let $config_dir = $c.column0
    let $config_files = $c.column1

    for $f in ( $config_files | transpose ) {

        let $config_file = $f.column0
        let $config_file_path = $"~/.dotfiles/configs/($config_dir)/($config_file)"
        let $config_sym_link_path = $f.column1
        let $config_sym_link_path_exists = $config_sym_link_path | path exists
        let $backup_timestamp = date now | date to-timezone utc | format date '%Y_%m_%d_%H_%M_%S'

        # if there is not file in the targeted symbolic link path, 
        #   create the directory path if it doesn't already exist
        if ( not $config_sym_link_path_exists ) {
            mkdir ( $config_sym_link_path | path dirname | path expand )
            ln -s ( $config_file_path | path expand ) ( $config_sym_link_path | path expand )
        }
        
        if ( $config_sym_link_path_exists ) {

            let $config_file_object =  (ls -a $config_sym_link_path | first )
            
            # if the file in the targeted symbolic link path is a file (not a symbolic link),
            #   backup the file and remove the original
            if ( $config_file_object.type == 'file' ) {
                cp ( $config_file_path | path expand ) ( $"($config_sym_link_path).backup.($backup_timestamp)" | path expand )
                rm ( $config_sym_link_path | path expand )
                ln -s ( $config_file_path | path expand ) ( $config_sym_link_path | path expand )
            }
        }


    }
    
}

if ( not ( '~/.mackup' | path exists ) ) {
	ln -s -f ( '~/.dotfiles/configs/mackup/custom_config/' | path expand ) ( '~/.mackup' | path expand )
}

/opt/homebrew/bin/mackup restore --verbose