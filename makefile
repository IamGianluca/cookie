include .env

print:
	echo ${FNAME}

format:
	isort . && \
	black -l 79 .

install:
	rm -rf blazingml/src/ml.egg-info/ && \
	pip install -e blazingml/src/

test:
	mypy pipe/ --ignore-missing-imports

build:
	docker build -t ${IMAGE_NAME} .

start:
	docker run -d --name ${CONTAINER_NAME} --ipc=host --gpus all -p 5000:5000 -p 8888:8888 --rm -v "/home/gianluca/git/kaggle/spine:/workspace" -v "/data:/data" -t kaggle

attach:
	docker exec -it ${CONTAINER_NAME} /bin/bash

stop:
	docker kill spine

clean:
	docker system prune -a && \
	# docker stop $(docker ps -aq) && \
	# docker rm $(docker ps -a -q) && \
	# docker rmi $(docker images -aq) -f && \
	docker image prune && \
	# docker volume rm $(docker volume ls -q) && \
	docker volume prune

upload_lib:
	kaggle datasets version --dir-mode zip -p blazingml/src/ -m "New version"

upload_ckpts:
	kaggle datasets version --dir-mode zip -p ckpts/ -m "New version"

submit:
	kaggle competitions submit -c ${COMPETITION_LONG_NAME} -f ./preds/submission.csv -m "$(MSG)"

jupyter:
	jupyter lab --ip 0.0.0.0 --no-browser --allow-root
