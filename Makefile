build:
	docker build -t "dkdde/forgetit_typo3_alfresco" .

publish: build
	docker push dkdde/forgetit_typo3_alfresco

run: build
	docker run -p "8080:8080" -it "dkdde/forgetit_typo3_alfresco"
