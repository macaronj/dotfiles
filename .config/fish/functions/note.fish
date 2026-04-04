function n
    # Set the date for filename (YYYY-MM-DD format)
    set date (date '+%Y-%m-%d')
    set timestamp (date '+%H:%M:%S')
    set filename "notizen.md"

    # Create directory if it doesn't exist
    if not test -d "$HOME/Documents/Nextcloud/Notes/Base"
        mkdir -p "$HOME/Documents/Nextcloud/Notes/Base"
    end

    # Create file with header if it doesn't exist
    if not test -e "$filename"
        echo "# $date" >>"$filename"
        echo "" >>"$filename"
    end

    # Append the note with timestamp
    if test (count $argv) -gt 0
        echo "- $timestamp: $argv" >>"$filename"
    else
        echo "Please provide a note to record."
        return 1
    end
end
