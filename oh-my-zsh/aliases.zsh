alias k="kubectl"
alias kgp="kubectl get pods"
alias kdlp="kubectl delete pod"
alias kdsp="kubectl describe pod"
alias kgd="kubectl get deployments"
alias kdld="kubectl delete deployment"
alias kdsd="kubectl describe deployment"
alias kgs="kubectl get svc"
alias kdls="kubectl delete svc"
alias kdss="kubectl describe svc"
alias kgh="kubectl get hr"
alias kdlh="kubectl delete hr"
alias kdsh="kubectl describe hr"
alias kgn="kubectl get ns"
alias kdln="kubectl delete ns"
alias kdsn="kubectl describe ns"
alias gssh="gcloud compute ssh"
alias gscp="gcloud compute scp"
alias open="xdg-open"
alias b="firefox"
alias launch_portainer="docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer && browse http://localhost:9000"
alias portainer="browse http://localhost:9000"
alias listen2yt="youtube-dl -x --verbose --audio-format mp3"
alias kns="kubens"
alias kctx="kubectx"
# New linux commands
alias cat="/usr/bin/bat"
alias catn="/usr/bin/cat"
alias catnl="/usr/bin/bat -P"
alias du="dust"
alias vi="lvim"
alias ls="exa"
alias df="duf"
alias find="fd"
alias grep="rg"
alias ping="gping"
alias ps="procs"
alias curl="curlie"
alias dig="dog"
alias kk="kitty +kitten"
alias kki="kitty +kitten icat"

# Arch House Keeping
alias arch_hk="yay -Sc && sudo pacman -Scc"

# Arch Purge
alias arch_purge="sudo pacman -Rns $(pacman -Qtdq) ; sudo fstrim -av"

# Arch Update
alias arch_update="yay -Syu --nocombinedupgrade"

alias ahk=arch_hk
alias ap=arch_purge
alias au=arch_update

alias omzu="omz reload"
