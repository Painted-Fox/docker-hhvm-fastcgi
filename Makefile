# Substitute your own docker index username, if you like.
DOCKER_USER=paintedfox

# Change this to suit your needs.
NAME:=hhvm
DATA_DIR:=/tmp/hhvm-fastcgi
#PORT:=127.0.0.1:3306

RUNNING:=$(shell docker ps | grep $(NAME) | cut -f 1 -d ' ')
ALL:=$(shell docker ps -a | grep $(NAME) | cut -f 1 -d ' ')
DOCKER_RUN_COMMON=-name="$(NAME)" -v $(DATA_DIR):/data $(DOCKER_USER)/hhvm-fastcgi

all: build

build:
	docker build -t="$(DOCKER_USER)/hhvm-fastcgi" .

run: clean
	mkdir -p $(DATA_DIR)
	docker run -d $(DOCKER_RUN_COMMON)

bash: clean
	mkdir -p $(DATA_DIR)
	docker run -entrypoint="/bin/bash" -t -i $(DOCKER_RUN_COMMON)

# Removes existing containers.
clean:
ifneq ($(strip $(RUNNING)),)
	docker stop $(RUNNING)
endif
ifneq ($(strip $(ALL)),)
	docker rm $(ALL)
endif

# Destroys the data directory.
deepclean: clean
	sudo rm -rf $(DATA_DIR)
