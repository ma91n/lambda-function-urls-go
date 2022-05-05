deploy_raw:
	GOOS=linux GOARCH=amd64 go build -ldflags="-s -w -buildid=" -trimpath -o bin/lambda_raw/lambda cmd/lambda_raw/main.go
	zip -j bin/lambda_raw/lambda.zip bin/lambda_raw/lambda
	aws lambda update-function-code --profile my_profile --region ap-northeast-1 --function-name my-function-url-lambda --zip-file fileb://bin/lambda_raw/lambda.zip

deploy_handler:
	GOOS=linux GOARCH=amd64 go build -ldflags="-s -w -buildid=" -trimpath -o bin/lambda_handler/lambda cmd/lambda_handler/main.go
	zip -j bin/lambda_handler/lambda.zip bin/lambda_handler/lambda
	aws lambda update-function-code --profile my_profile --region ap-northeast-1 --function-name my-function-url-lambda --zip-file fileb://bin/lambda_handler/lambda.zip
