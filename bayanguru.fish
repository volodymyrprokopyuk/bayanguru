#!/usr/bin/env fish

function bayanguru_lint
  echo "=> linting bayanguru "
  golangci-lint run ./...
end

function bayanguru_build
  echo "=> building bayanguru"
  go get ./...
  or return 1
  go mod tidy
  or return 1
  go build -o bin/bayanguru ./cmd/bayanguru
end

function bayanguru_update
  echo "=> updating bayanguru"
  go get -u ./...
  or return 1
  go mod tidy
end

function bayanguru_validate
  echo -n "=> validating bayanguru "
  bunx html-validate --formatter codeframe site/public/index.html \
    site/public/catalog/level/elementary-a/1.html \
    site/public/piece/Largo-c3bd.html
end

function bayanguru_publish
  echo "=> publishing bayanguru"
  rm -rf site/public
  ./bin/bayanguru publish all --init
end

function bayanguru_serve
  echo "=> serving bayanguru on http://localhost:7512"
  caddy run --config site/Caddyfile
end

function bayanguru_deploy
  echo "=> deploying bayanguru to https://bayanguru.org"
  source .secret
  or return 1
  bunx wrangler pages deploy site/public --project-name bayanguru \
    --branch main --skip-caching
end

function bayanguru_completions
  echo "=> bayanguru completions"
  cp completions.fish ~/.config/fish/completions/bayanguru.fish
end

function main
  set cmd $argv[1]
  set sub $argv[2]
  switch $cmd
  case lint
    bayanguru_lint
  case build
    bayanguru_build
  case update
    bayanguru_update
  case validate
    bayanguru_validate
  case publish
    bayanguru_publish
  case serve
    bayanguru_serve
  case deploy
    bayanguru_deploy
  case completions
    bayanguru_completions
  case '*'
    echo "unknown command $cmd"
    return 1
  end
end

main $argv
