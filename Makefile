build:
	boot2docker up
	docker build -t "dkdde/forgetit_typo3_alfresco" .

publish:
	boot2docker up
	docker push dkdde/forgetit_typo3_alfresco
<
