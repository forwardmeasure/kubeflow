Install Minikube
	- https://minikube.sigs.k8s.io/docs/start/
Install kubectl
	- https://kubernetes.io/docs/tasks/tools/install-kubectl/Install to /usr/local/bin
Install kfctl
	- https://github.com/kubeflow/kfctl/releases/
If you want to use your GPU, you need to use the NVIDIA runtime as your default for Docker
	- https://github.com/NVIDIA/k8s-device-plugin
Prepare minikube for running
	- sudo mkdir -p /var/lib/minikube/certs && chmod a+rwx /var/lib/minikube/certs
Start minikube
	- minikube start --cpus 6 --memory 12288 --disk-size=120g --feature-gates=DevicePlugins=true
Verify that minikube is running
	- kubectl get all --all-namespaces
To enable GPU support in k8s (DOES NOT WORK yet, BTW!)
	- Add the following flags to the minikube startup script
		-  --feature-gates=DevicePlugins=true --vm-driver none
	- Ensure that the Nvidia drivers are installed on your laptop/cloud
	- Ensure that you have set the docker daemon to run the NVIDIA runtime using the attached daemon file (place in /etc/docker/daemon.json)
	- Add the NVIDIA/GPU daemonset to minikube
		- kubectl create -f https://raw.githubusercontent.com/NVIDIA/k8s-device-plugin/v0.7.3/nvidia-device-plugin.yml
	- Install kubeflow using the script install_kubeflow.sh (installation can take roughly 10 minutes)
	- Verify kubeflow installation
		- kubectl get pods -n kubeflow
	- If you have enabled Nvidia GPU support
		- You can verify that the nvidia device plugin daemonset is working by looking at the logs of the nvidia-device-plugin-daemonset by running
			- kubectl get pods -n kube-system
		- Once you get the name of the pod, you should be able to verify it ran properly
	- View kubeflow dashboardRun the script kf_dashboard.sh; it will print out the coordinates of the Kubeflow dashboard
	- To delete minikube
		- minikube delete
