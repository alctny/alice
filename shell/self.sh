# Append "$1" to $PATH when not already in.
# This function API is accessible to scripts in /etc/profile.d
function append_path () {
  case ":$PATH:" in
    *:"$1":*)
      ;;
    *)
      PATH="${PATH:+$PATH:}$1"
  esac
}

# SET PATH OR ALIS IN THERE

unset -f append_path
