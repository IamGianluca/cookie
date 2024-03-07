format:
	ruff format .

download_ml:
	git submodule add git@github.com:IamGianluca/ml.git blazingai

install_ml:
	rm -rf blazingai/ml.egg-info/ && \
	pip install -e blazingai/

test:
	mypy pipe/ --ignore-missing-imports

build:
	docker build -t {{ cookiecutter.image_name }} .

start:
	docker run -d --name {{ cookiecutter.container_name }} --env-file ./.env --ipc=host --gpus all -p 5000:5000 -p 8888:8888 --rm -v "/home/gianluca/git/kaggle/{{ cookiecutter.container_name }}:/workspace" -v "/data:/data" -t kaggle

attach:
	docker exec -it {{ cookiecutter.container_name }} /bin/zsh

stop:
	docker kill {{ cookiecutter.container_name }}

clean:
	docker system prune -a && \
	# docker stop $(docker ps -aq) && \
	# docker rm $(docker ps -a -q) && \
	# docker rmi $(docker images -aq) -f && \
	docker image prune && \
	# docker volume rm $(docker volume ls -q) && \
	docker volume prune

upload_lib:
	kaggle datasets version --dir-mode zip -p blazingai/ -m "New version"

upload_ckpts:
	kaggle datasets version --dir-mode zip -p ckpts/ -m "New version"

submit:
	kaggle competitions submit -c {{ cookiecutter.competition_long_name }} -f ./preds/submission.csv -m "$(MSG)"

jupyter:
	jupyter lab --ip 0.0.0.0 --no-browser --allow-root

install_nvim:
	git clone https://github.com/IamGianluca/dotfiles.git .dotfiles && cd .dotfiles && ./install
