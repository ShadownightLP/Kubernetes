sudo firewall-cmd --permanent --add-port=2379/tcp

sudo apt-mark unhold kubeadm && sudo apt-get update && sudo apt-get install -y kubeadm=1.20.2-00 && sudo apt-mark hold kubeadm

sudo apt-get install -y kubelet=1.20.2-00 kubectl=1.20.2-00 --allow-change-held-packages && sudo apt-mark hold kubelet kubectl
sudo mv ~/pki /etc/kubernetes/
kubeadm config migrate --old-config config.yaml --new-config new.yaml




docker run --rm -it \
--net host \
-v /etc/kubernetes:/etc/kubernetes k8s.gcr.io/etcd:3.4.13-0 etcdctl \
--cert /etc/kubernetes/pki/etcd/peer.crt \
--key /etc/kubernetes/pki/etcd/peer.key \
--cacert /etc/kubernetes/pki/etcd/ca.crt \
--endpoints https://192.168.2.114:2379 endpoint health --cluster

