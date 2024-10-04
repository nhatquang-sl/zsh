selectExeCmd() {
    local CmdStr=$1
    local CmdTemplate=$2
    local userInput=""
    local selectedIndex=0
    local ascii=0

    # local branches=("dev" "dev-9791-update-env-function-app" "* dev-sprint-27" "feature/9658-restrict-run-store-procedure" "feature/app-configuration" "feature/app-settings" "feature/telegram-signal-generator" "hotfix-9780-telegram-missing-signal-4.x" "main")
    local branches=()
    while IFS= read -r branch; do
        branches+=("$branch")
        # echo $branch
    done < <(eval "$CmdStr")
    branches+=("")

    matchedOptionIndices=$(selectOptions "${branches[@]}" "" 0)
    local IFS=$'\n'  # Set the IFS to newline
    local -a lines=(${=matchedOptionIndices})  # Split input_string into array

    # Iterate over the array and print each element
    for i in {1..${#lines[@]}}; do
        if [[ $i -lt ${#lines[@]} ]]; then
            echo $lines[$i]
        fi
    done

    local matchedIndices=(${(s: :)lines[-1]})  # Split searchText into an array
    
    while true; do
        # Read a single keypress
        read -s -k 1 keyPress

        # Check for escape sequence (Arrow keys start with escape character)
        if [[ $keyPress == $'\e' || $keyPress == '[' || $keyPress == ']' ]]; then
            continue
            # case $keyPress in
            #     '[A')  # Up arrow
            #         echo "Up arrow pressed"
            #         ;;
            #     '[B')  # Down arrow
            #         echo "Down arrow pressed"
            #         ;;
            #     *)
            #         echo "Other key pressed"
            #         ;;
            # esac
        fi
        ascii=$(printf "%d" "'$keyPress")
        
        # normal characters: a-z, 0-9, ' ', '.'
        if [[ ($ascii -ge 97 && $ascii -le 122) || ($ascii -ge 48 && $ascii -le 57) || $ascii -eq 32 || $ascii -eq 46 ]]; then
            selectedIndex=0
            userInput+="$keyPress"
        fi

        if [[ $ascii -eq 127 ]]; then  # Backspace
            selectedIndex=0
            if [[ -z "$userInput" ]]; then
                ascii=0
            else
                userInput=${userInput:0:${#userInput}-1}
            fi
        fi

        if [[ $ascii -eq 65 ]]; then # Up
            if [[ $selectedIndex -gt 0 ]]; then
                selectedIndex=$((selectedIndex - 1))
            else
                continue
            fi 
        elif [[ $ascii -eq 66 ]]; then # Down
            if [[ $((selectedIndex + 1)) -lt ${#matchedIndices[@]} ]]; then
                selectedIndex=$((selectedIndex + 1))
            else
                continue
            fi
        fi

        # Clear the screen on each loop iteration
        clear

        if [[ $ascii -ge 0 ]]; then
            matchedOptionIndices=$(selectOptions "${branches[@]}" $userInput $selectedIndex)
        fi

        if [[ $ascii -eq 96 ]]; then  # `
            echo -e "\n======================== QUIT ==========================\n"
            break
        elif [[ $ascii -eq 10 && ${#matchedOptionIndices[@]} -gt 0 ]]; then  # Enter
            local exeCmd=${branches[$matchedIndices[$selectedIndex + 1]]}
            exeCmd="${exeCmd//[ *]/}"
            exeCmd="${CmdTemplate//\[selectedCmd\]/$exeCmd}"
            echo -e "\e[32m$exeCmd\e[0m"  # Green color for selected item
            eval "$exeCmd"

            echo -n "\e[35mPress any Key to Continue...\e[0m"
            read -s -k 1 var_name
            userInput=""
            clear
        fi

        if [[ ${#matchedOptionIndices[@]} -gt 0 ]]; then
            IFS=$'\n'  # Set the IFS to newline
            lines=(${=matchedOptionIndices})  # Split input_string into array

            # Iterate over the array and print each element
            for i in {1..${#lines[@]}}; do
                if [[ $i -lt ${#lines[@]} ]]; then
                    echo $lines[$i]
                fi
            done

            matchedIndices=(${(s: :)lines[-1]})  # Split searchText into an array
        fi

        # echo "Key pressed: $keyPress, ascii: $ascii"
        # # echo "Matched Indices: [$matchedOptionIndices]"
        # echo "Selected index: $selectedIndex => $matchedIndices[$selectedIndex + 1]"
        # echo "Selected option: $branches[$matchedIndices[$selectedIndex + 1]]"
        print -n $userInput
    done
}

# https://ss64.com/bash/syntax-arrays.html
selectOptions() {
    local num_params=$#
    local optionLen=$((num_params - 2))
    
    local args=("$@")  # All arguments are the CmdArray elements
    shift $optionLen
    local searchText=$1    # First argument is the search string
    local selectedIndex=$2  # Second argument is the selected command index
    local -a options
    local -a matchedOptionIndices
    
    for i in {1..$optionLen}; do
        # echo ${args[$i]}
        options+=(${args[$i]})
    done

    local searchTextSub=(${(s: :)searchText})  # Split searchText into an array
    # echo ${#searchTextSub[@]}
    for i in {1..${#options[@]}}; do
        local isMatch=1
        # echo ${options[$i]}
        for str in $searchTextSub; do
            if [[ ! ${options[$i]} == *"$str"* ]]; then
                isMatch=0
                break
            fi
        done

        if [[ $isMatch -eq 1 ]]; then
            matchedOptionIndices+=($i)
        fi

        # Display maximum 25 results
        if [[ ${#matchedOptionIndices[@]} -eq 25 ]]; then
            break
        fi
    done

    if [ ${#matchedOptionIndices[@]} -gt 0 ]; then
        for i in {1..${#matchedOptionIndices[@]}}; do
            if [[ $((i-1)) -eq $selectedIndex ]]; then
                echo -e "\e[32m$options[$matchedOptionIndices[$i]]\e[0m"  # Green color for selected item
            else
                echo $options[$matchedOptionIndices[$i]]
            fi
        done
    fi
    echo $matchedOptionIndices
}