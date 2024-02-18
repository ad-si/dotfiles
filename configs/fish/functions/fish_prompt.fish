function printPagesPerDay
    set -l bookPath "/Users/adrian/Dropbox/Projects/programmiersprachenbuch/main.pdf"
    set -l writtenPages (pdfinfo "$bookPath" | grep Pages | cut -c 9-)
    set -l pagesToWrite (echo "250 - $writtenPages" | bc -l)
    set -l deadline (gdate -d '2019-06-11' +%s)
    set -l today (gdate +%s)
    set -l pagesPerDay \
        (echo "scale=2; $pagesToWrite * 86400" / \($deadline - $today\) | bc -l)

    printf ' %s p | %s p/d ' (math "round($writtenPages * 10)/10") $pagesPerDay
end


function printTasksStatus
    if command -sq tasklite
        set --local taskCount (tasklite runsql \
      "select count(*) from tasks_view where closed_utc is null and tags is null" \
      | tail -n 1)

        set --local openTasks (tasklite count state:open)

        # set --local taskDesc (tasklite next \
        #   | grep '^body: ' \
        #   | cut -c 7- \
        #   | sed -E 's/(.{40})(.{1,})$/\1…/')

        # printf ' %s | %s ' $taskCount # $taskDesc

        printf ' 📥 %s | ☑️  %s ' $taskCount $openTasks
    end
end


function checkIfDarkMode
    set -l interfaceStyle (defaults read -g AppleInterfaceStyle 2> /dev/null)
    test -n "$interfaceStyle" -a "$interfaceStyle" = Dark
end


function fish_prompt --description 'Write out the prompt'
    set -l last_status $status

    if test -n "$IN_NIX_SHELL"
        set_color --background=005fe7 white
        printf ' ❄️ '
        set_color normal
    end

    set -l bgColor (checkIfDarkMode && echo "000000" || echo "eeeeee")
    set -l bgColorMuted (checkIfDarkMode && echo "333333" || echo "cccccc")

    if not set -q __fish_prompt_normal
        set -g __fish_prompt_normal (set_color normal)
    end

    if not test $last_status -eq 0
        set_color $fish_color_error
        printf '❌ '
    end

    # Disable path shortening
    set -g fish_prompt_pwd_dir_length 0

    set_color --background "$bgColor" $fish_color_cwd
    printf ' %s%s ' (prompt_pwd) (__fish_git_prompt)

    set_color --background "$bgColorMuted" "$bgColor"
    printf '\ue0b0'

    set_color cyan
    printf ' %s' (whoami)

    set_color black
    printf '@'

    set_color red
    printf '%s ' (hostname | cut -d . -f 1)

    # Gray Arrow End
    set_color --background "$bgColor" "$bgColorMuted"
    printf '\ue0b0'
    set_color --background "$bgColor" normal

    # Show datetime
    # set_color white
    # printf ' %s ' (date -u "+%Y-%m-%d %H:%M:%S")

    # set_color --background "$bgColorMuted" "$bgColor"
    # printf '\ue0b0'
    # set_color --background "$bgColorMuted"

    printTasksStatus

    # printPagesPerDay

    # Gray Arrow End
    # set_color --background normal "$bgColorMuted"
    # printf '\ue0b0'
    # set_color normal

    # Black Arrow End
    set_color --background normal "$bgColor"
    printf '\ue0b0'
    set_color normal

    printf '\n'

    set_color magenta
    printf '$ '
    set_color normal
end
