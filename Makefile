ifeq ($(OS),Windows_NT)
  FVM := $(shell where.exe fvm 2>/dev/null)
  FVM_PREFIX := fvm.bat
else
  FVM := $(shell which fvm 2>/dev/null)
  FVM_PREFIX := fvm
endif

ifdef FVM
  FLUTTER := $(FVM_PREFIX) flutter
  DART := $(FVM_PREFIX) dart
else
  FLUTTER := flutter
  DART := dart
endif

define run_pub_get
	@echo "--------- Getting dependencies ($1)..---------"
	@cd $1 && $(FLUTTER) pub get
endef

define run_build_runner
	@echo "--------- Generating code ($1)..---------"
	@cd $1 && $(DART) run build_runner build --delete-conflicting-outputs
endef

define run_pub_upgrade
	@echo "--------- Updating pubspec ($1)..---------"
	@cd $1 && $(FLUTTER) pub upgrade
	@echo "--------- Checking for outdated packages ($1)..---------"
	@cd $1 && $(FLUTTER) pub outdated
endef

init: ## Run on first download
	@echo "---------(1/2) Installing mason..---------"
	@$(DART) pub global activate mason_cli || true
	@echo "---------(2/2) pub get all packages..---------"
	@$(MAKE) pub

b: ## Build without getting dependencies
	$(call run_build_runner, packages/domain)
	$(call run_build_runner, packages/data)
	$(call run_build_runner, .)

pub: ## Get dependencies for all packages
	$(call run_pub_get, packages/domain)
	$(call run_pub_get, packages/data)
	$(call run_pub_get, .)

builder: ## Run to get dependencies and rebuild
	$(call run_pub_get, packages/domain)
	$(call run_build_runner, packages/domain)
	$(call run_pub_get, packages/data)
	$(call run_build_runner, packages/data)
	$(call run_pub_get, .)
	$(call run_build_runner, .)

core:
	$(call run_pub_get, .)
	$(call run_build_runner, .)

domain:
	$(call run_pub_get, packages/domain)
	$(call run_build_runner, packages/domain)

data:
	$(call run_pub_get, packages/data)
	$(call run_build_runner, packages/data)

l10n: ## Build translations
	@$(FLUTTER) gen-l10n

upgrade: ## Update pubspec and check for outdated packages
	$(call run_pub_upgrade, packages/domain)
	$(call run_pub_upgrade, packages/data)
	$(call run_pub_upgrade, .)

lint:
	@echo "---------(1/1) Running linter..---------"
	@$(FLUTTER) analyze --no-pub --suppress-analytics

# --- Flavor-aware run / build targets -------------------------------------
run-dev:
	@./ios/scripts/swap_google_service_info.sh development
	@$(FLUTTER) run --flavor development -t lib/main_development.dart

run-prod:
	@./ios/scripts/swap_google_service_info.sh production
	@$(FLUTTER) run --flavor production -t lib/main_production.dart

run-web:
	@$(FLUTTER) run -d chrome -t lib/main_development.dart

build-web-prod:
	@$(FLUTTER) build web -t lib/main_production.dart

build-android-dev:
	@$(FLUTTER) build apk --flavor development -t lib/main_development.dart

build-android-prod:
	@$(FLUTTER) build appbundle --flavor production -t lib/main_production.dart

build-ios-dev:
	@./ios/scripts/swap_google_service_info.sh development
	@$(FLUTTER) build ios --flavor development -t lib/main_development.dart --no-codesign

build-ios-prod:
	@./ios/scripts/swap_google_service_info.sh production
	@$(FLUTTER) build ios --flavor production -t lib/main_production.dart --no-codesign

cleanBuild:
	@echo "---------(1/1) Cleaning build..---------"
	@$(FLUTTER) clean
	@$(MAKE) builder

verifyCleanBuild: cleanBuild lint

removeGen:
	@echo "---------(1/1) Removing generated files..---------"
	@find . -name "*.config.dart" -type f -prune -exec rm -rf {} \;
	@find . -name "*.freezed.dart" -type f -prune -exec rm -rf {} \;
	@find . -name "*.g.dart" -type f -prune -exec rm -rf {} \;
	@find . -name "*.module.dart" -type f -prune -exec rm -rf {} \;
	@find . -name ".dart_tool" -type d -prune -exec rm -rf {} \;

# Reliable test runners — do NOT use `make tests` as a pass/fail gate.
test-data:
	@$(FLUTTER) test packages/data

test-app:
	@$(FLUTTER) test test

test-integration:
	@$(FLUTTER) test integration_test

tests:
	@echo "\n---------(1/2) Running data tests...---------\n"
	@$(FLUTTER) test packages/data || true
	@echo "\n---------(2/2) Running app tests...---------\n"
	@$(FLUTTER) test test || true
