.DEFAULT_GOAL := help

.PHONY: help
help: ## list up commands
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

# usage:
#		e.g.) make copy-questions NAME=kiki-ki
.PHONY: sync-questions
sync-questions: ## copy files from questions to $NAME dir
	mkdir -p $(NAME) && cp -rn ./questions/ ./$(NAME)
