{ cat kubeadmjoincommand.txt.txt; init.sh | sed -n '/^kubeadm join /,$ p' } > ./file.txt
