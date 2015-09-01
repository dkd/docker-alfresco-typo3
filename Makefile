build:
	docker build -t "dkdde/forgetit_typo3_alfresco" .

publish: build
	docker push dkdde/forgetit_typo3_alfresco
