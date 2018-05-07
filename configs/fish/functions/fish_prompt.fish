function fish_prompt --description 'Write out the prompt'
	set -l last_status $status

	if not set -q __fish_prompt_normal
		set -g __fish_prompt_normal (set_color normal)
	end

	# Disable path shortening
	set -g fish_prompt_pwd_dir_length 0

	set_color -b 000000 $fish_color_cwd
	printf ' %s%s ' (prompt_pwd) (__fish_git_prompt)

	set_color -b 111111 000000
	printf '\ue0b0'

	set_color red
	printf ' %s ' (hostname | cut -d . -f 1)

	set_color -b 000000 111111
	printf '\ue0b0'
	set_color -b 000000

	set_color cyan
	printf ' %s ' (whoami)

	set_color -b 111111 000000
	printf '\ue0b0'
	set_color -b 111111

	set_color white
	printf ' %s ' (date -u "+%Y-%m-%d %H:%M:%S")

	set_color -b 000000 111111
	printf '\ue0b0'
	set_color -b 000000

	printf ' '

	set_color -b normal 000000
	printf '\ue0b0\n'
	set_color normal

	if not test $last_status -eq 0
		set_color $fish_color_error
	end

	set_color -b 000000 magenta
	printf '$'

	set_color -b normal 000000
	printf '\ue0b0 '
	set_color normal
end
