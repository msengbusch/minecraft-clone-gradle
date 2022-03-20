#!/bin/bash

# ARG_OPTIONAL_SINGLE([option],[o],[optional argument help msg])
# ARG_OPTIONAL_BOOLEAN([print],[],[boolean optional argument help msg])
# ARG_POSITIONAL_SINGLE([cmd],[positional argument help  msg],[])
# ARG_HELP([The general script's help msg])
# ARGBASH_GO()
# needed because of Argbash --> m4_ignore([
### START OF CODE GENERATED BY Argbash v2.9.0 one line above ###
# Argbash is a bash code generator used to get arguments parsing right.
# Argbash is FREE SOFTWARE, see https://argbash.io for more info
# Generated online by https://argbash.io/generate


die()
{
	local _ret="${2:-1}"
	test "${_PRINT_HELP:-no}" = yes && print_help >&2
	echo "$1" >&2
	exit "${_ret}"
}


begins_with_short_option()
{
	local first_option all_short_options='oh'
	first_option="${1:0:1}"
	test "$all_short_options" = "${all_short_options/$first_option/}" && return 1 || return 0
}

# THE DEFAULTS INITIALIZATION - POSITIONALS
_positionals=()
# THE DEFAULTS INITIALIZATION - OPTIONALS
_arg_option=
_arg_print="off"


print_help()
{
	printf '%s\n' "The general script's help msg"
	printf 'Usage: %s [-o|--option <arg>] [--(no-)print] [-h|--help] <cmd>\n' "$0"
	printf '\t%s\n' "<cmd>: positional argument help  msg"
	printf '\t%s\n' "-o, --option: optional argument help msg (no default)"
	printf '\t%s\n' "--print, --no-print: boolean optional argument help msg (off by default)"
	printf '\t%s\n' "-h, --help: Prints help"
}


parse_commandline()
{
	_positionals_count=0
	while test $# -gt 0
	do
		_key="$1"
		case "$_key" in
			-o|--option)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_option="$2"
				shift
				;;
			--option=*)
				_arg_option="${_key##--option=}"
				;;
			-o*)
				_arg_option="${_key##-o}"
				;;
			--no-print|--print)
				_arg_print="on"
				test "${1:0:5}" = "--no-" && _arg_print="off"
				;;
			-h|--help)
				print_help
				exit 0
				;;
			-h*)
				print_help
				exit 0
				;;
			*)
				_last_positional="$1"
				_positionals+=("$_last_positional")
				_positionals_count=$((_positionals_count + 1))
				;;
		esac
		shift
	done
}


handle_passed_args_count()
{
	local _required_args_string="'cmd'"
	test "${_positionals_count}" -ge 1 || _PRINT_HELP=yes die "FATAL ERROR: Not enough positional arguments - we require exactly 1 (namely: $_required_args_string), but got only ${_positionals_count}." 1
	test "${_positionals_count}" -le 1 || _PRINT_HELP=yes die "FATAL ERROR: There were spurious positional arguments --- we expect exactly 1 (namely: $_required_args_string), but got ${_positionals_count} (the last one was: '${_last_positional}')." 1
}


assign_positional_args()
{
	local _positional_name _shift_for=$1
	_positional_names="_arg_cmd "

	shift "$_shift_for"
	for _positional_name in ${_positional_names}
	do
		test $# -gt 0 || break
		eval "$_positional_name=\${1}" || die "Error during argument parsing, possibly an Argbash bug." 1
		shift
	done
}

parse_commandline "$@"
handle_passed_args_count
assign_positional_args 1 "${_positionals[@]}"

# OTHER STUFF GENERATED BY Argbash

### END OF CODE GENERATED BY Argbash (sortof) ### ])
# [ <-- needed because of Argbash


echo "$_arg_cmd"

# ] <-- needed because of Argbash