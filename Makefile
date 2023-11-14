-include keystores/Makefile

ENVIRONMENT=dev
WSO2_AM_CHART_PATH=charts/wso2-am
APP_NAME=etisalat-am

APP_NAMESPACE=dev-wso2
APP_RELEASE_NAME=$(ENVIRONMENT)-$(APP_NAME)

lint-etisalat-am-app:
	helm lint $(WSO2_AM_CHART_PATH) -f $(WSO2_AM_CHART_PATH)/values.yaml --with-subcharts

install-etisalat-am-app:
	helm upgrade --install $(APP_RELEASE_NAME) $(WSO2_AM_CHART_PATH) \
		--dependency-update \
		--create-namespace \
		--namespace $(APP_NAMESPACE)

uninstall-etisalat-am-app:
	- helm uninstall $(APP_RELEASE_NAME) --namespace $(APP_NAMESPACE)
	- kubectl delete ns $(APP_NAMESPACE)

-include overrides.mk