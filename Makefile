include .env

pull-services:
	- if [ ! -d "${MAIL_SERVICE_PATH}/" ]; then git clone https://github.com/delivery-app-rso/Mailing-microservice.git ${MAIL_SERVICE_PATH}; else echo "${MAIL_SERVICE_PATH} already exists."; fi
	- if [ ! -d ${INVOICE_SERVICE_PATH} ]; then git clone https://github.com/delivery-app-rso/Invoice-microservice.git ${INVOICE_SERVICE_PATH}; else echo "${INVOICE_SERVICE_PATH} already exists."; fi
	- if [ ! -d ${FRONTEND_PATH} ]; then git clone https://github.com/delivery-app-rso/frontend.git ${FRONTEND_PATH}; else echo "${FRONTEND_PATH} already exists."; fi
	- if [ ! -d ${ITEMS_SERVICE_PATH} ]; then git clone https://github.com/delivery-app-rso/items-microservice.git ${ITEMS_SERVICE_PATH}; else echo "${ITEMS_SERVICE_PATH} already exists."; fi
	- if [ ! -d ${NAVIGATION_SERVICE_PATH} ]; then git clone https://github.com/delivery-app-rso/navigation-microservice.git ${NAVIGATION_SERVICE_PATH}; else echo "${NAVIGATION_SERVICE_PATH} already exists."; fi
	- if [ ! -d ${USERS_SERVICE_PATH} ]; then git clone https://github.com/delivery-app-rso/users-microservice.git ${USERS_SERVICE_PATH}; else echo "${USERS_SERVICE_PATH} already exists."; fi
	- if [ ! -d ${DELIVERY_SERVICE_PATH} ]; then git clone https://github.com/delivery-app-rso/delivery-microservice.git ${DELIVERY_SERVICE_PATH}; else echo "${DELIVERY_SERVICE_PATH} already exists."; fi

run-frontend:
	- npm install --prefix ${FRONTEND_PATH}
	- npm run start --prefix ${FRONTEND_PATH}

up:
	- docker-compose up -d

down:
	- docker-compose down

logs:
	- docker-compose logs -f

install: pull-services up run-frontend