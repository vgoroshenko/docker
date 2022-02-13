build:
	$(shell ./install.sh)
	docker build -t python_2 -f cicd/python/Dockerfile .
	docker build -t python_3 -f cicd/python3/Dockerfile .
	docker-compose up --build -d