function netApp --description 'makes a new .NET app'

command mkdir -p $argv[1]
if test $status = 0
        switch $argv[1]
            case '-*'

            case '*'
                cd $argv[1]
        
end
end
dotnet new $argv[2]
end
